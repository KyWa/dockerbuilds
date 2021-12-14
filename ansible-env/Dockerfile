FROM registry.access.redhat.com/ubi8/ubi:latest

WORKDIR /work

ENV pip_packages "ansible"

# Silence annoying subscription messages.
RUN echo "enabled=0" >> /etc/yum/pluginconf.d/subscription-manager.conf

# Install requirements.
RUN dnf makecache --timer \
 && dnf -y install initscripts \
 && dnf -y update \
 && dnf -y install \
      openssh-clients \
      sudo \
      which \
      hostname \
      python3 \
 && dnf clean all

# Upgrade PIP for Crypto package
RUN pip3 install --upgrade pip

# Install Ansible via Pip.
RUN pip3 install $pip_packages

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts
