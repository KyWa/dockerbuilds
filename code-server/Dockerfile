FROM registry.access.redhat.com/ubi8/ubi:latest

# Prep for install
USER root

RUN curl -fsSL https://code-server.dev/install.sh | sh

# User setup
RUN useradd coder && chmod 700 /home/coder && chown coder:coder /home/coder
USER 1000

# Image finalizers
EXPOSE 8080
ENV USER=coder
WORKDIR /home/coder

CMD ["/usr/bin/code-server","--bind-addr","0.0.0.0:8080", "."]
