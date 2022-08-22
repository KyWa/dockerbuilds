#!/usr/bin/env bash
set -o pipefail
set -o errexit

# Function declaration
unregister() {
    echo "Unregistering GitHub runner: ${RUNNER_NAME}"
    REMOVE_TOKEN_URL="${TOKEN_URL}/remove-token"
    PAYLOAD=$(curl -fsSLX POST -H "Authorization: token ${RUNNER_GITHUB_PAT}" "$REMOVE_TOKEN_URL")
    REMOVE_TOKEN=$(echo "$PAYLOAD" | jq -r .token)
    ./config.sh remove --unattended --token "$REMOVE_TOKEN"
}

# Variable declaration
export NAME="${RUNNER_NAME:-$(hostname)}"

RUNNER_HOSTNAME="${RUNNER_HOSTNAME:-github.com}"
RUNNER_OWNER="${RUNNER_OWNER}"
RUNNER_WORKDIR="${RUNNER_WORKDIR:-_work}"
RUNNER_LABELS="${RUNNER_LABELS:-self-hosted,Linux}"

RUNNER_OPT_EPHEMERAL=${OPT_EPHEMERAL:-"--ephemeral"}
RUNNER_OPT_ATTEND=${OPT_ATTEND:-"--unattended"}
RUNNER_OPT_REPLACE=${OPT_REPLACE:-"--replace"}

REGISTRATION_URL="https://${RUNNER_HOSTNAME}/${RUNNER_OWNER}"

# Start registration process
echo "Getting Runner registration token"
if [ "${RUNNER_HOSTNAME}" = "github.com" ];then
    GITHUB_ENDPOINT="api.${RUNNER_HOSTNAME}"
else
    GITHUB_ENDPOINT="${RUNNER_HOSTNAME}/api/v3"
fi

echo "GitHub API Endpoint: ${GITHUB_ENDPOINT}"

if [ -z "${RUNNER_REPOSITORY}" ];then
    TOKEN_URL="https://${GITHUB_ENDPOINT}/orgs/${RUNNER_OWNER}/actions/runners"
else
    TOKEN_URL="https://${GITHUB_ENDPOINT}/repos/${RUNNER_OWNER}/${RUNNER_REPOSITORY}/actions/runners"
    REGISTRATION_URL="${REGISTRATION_URL}/${RUNNER_REPOSITORY}"
fi

GET_TOKEN_URL="${TOKEN_URL}/registration-token"

echo "GitHub Registration Token URL: ${GET_TOKEN_URL}"

PAYLOAD=$(curl -fsSLX POST -H "Authorization: token ${RUNNER_GITHUB_PAT}" "${GET_TOKEN_URL}")

export RUNNER_TOKEN=${RUNNER_TOKEN:-$(echo "$PAYLOAD" | jq -r .token)}
export RUNNER_URL=${RUNNER_URL:-$REGISTRATION_URL}

# Start Runner
echo "
Starting GitHub Runner: ${RUNNER_NAME}
      RUNNER_URL      : ${RUNNER_URL}
      RUNNER_WORKDIR  : ${RUNNER_WORKDIR}
      RUNNER_LABELS   : ${RUNNER_LABELS}
"

./config.sh \
--name "${NAME}" \
--token "${RUNNER_TOKEN}" \
--url "${RUNNER_URL}" \
--work "${RUNNER_WORKDIR}" \
--labels "${RUNNER_LABELS}" \
${RUNNER_OPT_ATTEND} \
${RUNNER_OPT_EPHEMERAL} \
${RUNNER_OPT_REPLACE}

trap unregister EXIT HUP INT QUIT PIPE TERM

RUNNER_GITHUB_PAT="" ./run.sh "$*" &

wait $!
