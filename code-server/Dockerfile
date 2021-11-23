FROM registry.access.redhat.com/ubi8/ubi:latest

# Prep for install
USER root

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN curl -L -o oclient.tgz https://github.com/openshift/okd/releases/download/4.7.0-0.okd-2021-06-19-191547/openshift-client-linux-4.7.0-0.okd-2021-06-19-191547.tar.gz && tar -xf oclient.tgz && cp oc /usr/local/bin/ && chmod +x /usr/local/bin/oc && cp kubectl /usr/local/bin/ && chmod +x /usr/local/bin/kubectl && rm -rf oclient.tgz kubectl oc README.md

# Helm Client
RUN curl -L -o helm.tgz https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz && tar -xf helm.tgz && cp linux-amd64/helm /usr/local/bin/ && chmod +x /usr/local/bin/helm && rm -rf helm.tgz linux-amd64

# User setup
RUN useradd coder && chmod 700 /home/coder && chown coder:coder /home/coder
USER 1000

# Image finalizers
EXPOSE 8080
ENV USER=coder
WORKDIR /home/coder

CMD ["/usr/bin/code-server","--bind-addr","0.0.0.0:8080", "."]
