FROM registry.access.redhat.com/ubi8/ubi:latest

# Prep for install
USER root

RUN rpm -ivh https://github.com/cdr/code-server/releases/download/v${CODE_SERVER_VERSION:-4.5.0}/code-server-${CODE_SERVER_VERSION:-4.5.0}-amd64.rpm

COPY entrypoint.sh /usr/local/bin/

# User setup
RUN useradd coder -u 1001 && chmod 700 /home/coder && chown coder:coder /home/coder
USER 1001

# Image finalizers
EXPOSE 8080
ENV USER=coder
WORKDIR /home/coder

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/bin/code-server","--bind-addr","0.0.0.0:8080", "."]
