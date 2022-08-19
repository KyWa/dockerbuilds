# Using Red Hat UBI as base image
FROM registry.access.redhat.com/ubi8/ubi:latest

# Prep for install
USER root

ARG CODE_SERVER_VERSION

RUN rpm -ivh https://github.com/cdr/code-server/releases/download/v${CODE_SERVER_VERSION:-4.5.0}/code-server-${CODE_SERVER_VERSION:-4.5.0}-amd64.rpm && \
    dnf install -y git python38 python38-pip && \
    dnf clean all && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    useradd coder -u 1001 && chmod 700 /home/coder && chown coder:coder /home/coder

COPY entrypoint.sh /usr/local/bin/

USER 1001

EXPOSE 8080

ENV USER=coder

WORKDIR /home/coder

# Container Startup
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/bin/code-server","--bind-addr","0.0.0.0:8080", "."]
