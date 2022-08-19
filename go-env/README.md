# Golang Environment in Docker

[![Docker Repository on Quay](https://quay.io/repository/kywa/goenv/status?token=af0678c4-4ea1-414b-b046-44b18afdf1b1 "Docker Repository on Quay")](https://quay.io/repository/kywa/goenv)

This is initially being used as a test for the sake of keeping the host environment clean and running all jobs and development inside a container.

## Usage

Run from your working directory where your `go` code lives:

```
docker run -it -v ${PWD}:/work quay.io/kywa/go-env:latest /bin/bash
```

* [Go](https://golang.org) Version: 1.19
