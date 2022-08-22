# Using Red Hat UBI as base image
FROM registry.access.redhat.com/ubi8/ubi:latest

# Prep for install
USER root

# Vars for build
#ARG RUNNER_ALLOW_RUNASROOT=true
ARG RUNNER_VERSION

# Preparation Items
WORKDIR /home/github
ENV HOME=/home/github
RUN useradd -m github -u 1001 && \
    dnf install -y --skip-broken git hostname unzip bind-utils && \
    dnf clean all && rm -rf /var/cache/yum && \
    curl -fsSLo /tmp/jq-linux64 https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    install -o root -g root -m 0755 /tmp/jq-linux64 /usr/local/bin/jq && \
    rm /tmp/jq-linux64

#######################
# Runner Installation #
#######################

RUN AGENT_LATEST_TAG=$(curl -fsSL -X GET 'https://api.github.com/repos/actions/runner/releases/latest' | jq -r '.tag_name') && \
    AGENT_LATEST_VER="${AGENT_LATEST_TAG/v/}" && \
    RUNNER_VERSION=${RUNNER_VERSION:-$AGENT_LATEST_VER} && \
    curl -fsSL "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" | tar xz && \
    ./bin/installdependencies.sh

# Finalize build
COPY entrypoint.sh /usr/local/bin/

USER 1001

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
