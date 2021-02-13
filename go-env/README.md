# Golang Environment in Docker

Build is based from Marcel Dempers located [here](https://github.com/marcel-dempers/docker-development-youtube-series/blob/master/golang/introduction/dockerfile)

This is initially being used as a test for the sake of keeping the host environment clean and running all jobs and development inside a container.

Tested in my env by running like so from my Mac with Docker Desktop:

```
docker run -it -v ${PWD}:/work go-env /bin/bash
```
