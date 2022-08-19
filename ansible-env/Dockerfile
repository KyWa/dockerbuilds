FROM registry.access.redhat.com/ubi8/ubi:latest

WORKDIR /work

ARG ANSIBLE_VER

# Install requirements.
RUN echo "enabled=0" >> /etc/yum/pluginconf.d/subscription-manager.conf && \
    dnf makecache --timer && \
    dnf -y update && \
    dnf -y install initscripts openssh-clients sudo which hostname python38 && \
    dnf clean all && \
    python3 -m pip install --upgrade pip ansible==${ANSIBLE_VER:-6.2.0} && \
    sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers && \
    mkdir -p /etc/ansible && \
    echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts
