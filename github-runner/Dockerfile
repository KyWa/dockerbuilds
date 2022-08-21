# Using Red Hat UBI as base image
FROM registry.access.redhat.com/ubi8/ubi:latest

# Prep for install
USER root

ARG RUNNER_ALLOW_RUNASROOT=true
ARG REPO

RUN mkdir actions-runner && cd actions-runner && \
    curl -O -L https://github.com/actions/runner/releases/download/v2.295.0/actions-runner-linux-x64-2.295.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.295.0.tar.gz && \
    ./config.sh --url https://github.com/KyWa/$REPO --token && \

COPY entrypoint.sh /usr/local/bin/

USER 1001

# Container Startup
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
