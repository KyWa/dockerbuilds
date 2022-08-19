# Ansible Environment in Docker

Build is based from `geerlingguys` Dockerfile located [here](https://github.com/geerlingguy/docker-ubi8-ansible)

## Usage

The way I use this image is to mount my current directory to the containers `/work` directory. This is where the container will start at and be a workspace to then use `ansible`. What this container image does not do is automate your `ansible` code. It is only here have a "clean" environment on my host machine and not worry about dependencies in it.

## If running on Docker/Docker Desktop or any system without SELinux enabled
```sh
$ docker run -it -v ${PWD}:/work -v ~/.ssh:/root/.ssh quay.io/kywa/ansible-env:latest /bin/bash
```

## If running on a system with SELinux enabled
```sh
$ podman run -it -v ${PWD}:/work:z -v ~/.ssh:/root/.ssh quay.io/kywa/ansible-env:latest /bin/bash
```

* [Ansible](https://ansible.com) Version: `ansible-core` = 2.13.3 (Ansible Community 6.2.0)
* [Python](https://python.org) Version: 3.8
