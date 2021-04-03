FROM codercom/code-server:latest

ENV SHELL=/bin/bash

USER root

# OC/Kubectl CLients
RUN curl -L -o oclient.tgz https://github.com/openshift/okd/releases/download/4.7.0-0.okd-2021-03-28-152009/openshift-client-linux-4.7.0-0.okd-2021-03-28-152009.tar.gz && tar -xf oclient.tgz && cp oc /usr/local/bin/ && chmod +x /usr/local/bin/oc && cp kubectl /usr/local/bin/ && chmod +x /usr/local/bin/kubectl && rm -rf oclient.tgz kubectl oc README.md

# Helm Client
RUN curl -L -o helm.tgz https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz && tar -xf helm.tgz && cp linux-amd64/helm /usr/local/bin/ && chmod +x /usr/local/bin/helm && rm -rf helm.tgz linux-amd64

RUN chown -R coder:coder /home/coder

USER coder
