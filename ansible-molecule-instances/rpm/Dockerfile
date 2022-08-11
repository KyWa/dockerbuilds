FROM quay.io/centos/centos:stream8

USER root

# Stream8 / Fedora
RUN dnf update -y && dnf install -y python3 firewalld sudo initscripts iptstate && dnf clean all && systemctl enable firewalld
