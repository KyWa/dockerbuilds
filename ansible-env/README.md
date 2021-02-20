# Ansible Environment in Docker

Build is based from geerlingguys Dockerfile located [here](https://github.com/geerlingguy/docker-ubi8-ansible)

This is initially being used as a test for the sake of keeping the host environment clean and running all jobs and development inside a container.

Tested in my env by running like so from my Mac with Docker Desktop:

```
docker run -it -v ${PWD}:/work -v ~/.ssh:/root/.ssh quay.io/kywa/ansible-env:latest /bin/bash
```

* [Ansible](https://ansible.com) Version: 2.10.5
* [Python](https://python.org) Version: 3.6.8
