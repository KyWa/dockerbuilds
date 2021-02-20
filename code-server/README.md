# VS Code Environment in Docker

This is an image for running VS Code in a browser (aka code-server). This image has the following tools installed:

* [Helm](https://helm.sh/) Version: 3.5.2
* [oc](https://www.okd.io/index.html) Version: 4.6.0
* [kubectl](https://kubernetes.io/) Version: 1.19

To utilize this image just run:

```sh
docker run -d -p 8080:8080 -e PASSWORD="CHANGEME" -v ${PWD}:/home/coder quay.io/kywa/kcode:latest
```

You can then access the server in your web browser (if running locally via Docker Desktop/Podman) by going to http://localhost:8008. Your shell will be `/bin/bash` and your local directory (from where you run the above command at) will be mounted into your home directory


## TOOD

Create Helm Chart for CodeServer with Persistent Storage
