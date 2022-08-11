# FROM quay.io/centos/centos:stream8
# Below builds from above
FROM quay.io/firewalld/firewalld

USER root

# Stream8 / Fedora
RUN dnf update -y && dnf install -y python3 sudo initscripts && dnf clean all && systemctl enable firewalld
