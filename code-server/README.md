# VS Code Environment in Docker

![Build](https://github.com/KyWa/dockerbuilds/actions/workflows/kcode-publish.yml/badge.svg)

This is an image for running VS Code in a browser (aka code-server). This image has the following tools installed:

* `python`
* `git`

To utilize this image just run:

```sh
$ docker run -d -p 8080:8080 -e PASSWORD="CHANGEME" -v ${PWD}:/home/coder quay.io/kywa/kcode:latest
```

You can then access the server in your web browser (if running locally via Docker Desktop/Podman) by going to http://localhost:8008. Your shell will be `/bin/bash` and your local directory (from where you run the above command at) will be mounted into your home directory
