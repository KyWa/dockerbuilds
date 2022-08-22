# Self-Hosted GitHub Runner w/ Auto Registration

This repository contains the Dockerfile and supporting files that handles the automatic registering of a self-hosted GitHub Runner. It does technically have support for GitHub Enterprise users who are on a self-hosted installation (seen in the variables for the `entrypoint.sh`)

One unique thing that could be possible is use this as a base and have other Images built off of this while adding in extra software for runners in specific repositories. It is more overhead of having more images to manage, however it allows you to keep your "core" runner images clean and lighterweight while allowing you to have unique and larger runners for specific app testing.

## Requirements
This image only has a handful of requirements and they revolve around variables. These variables are outlined below:

* `RUNNER_GITHUB_PAT` - A valid GitHub PAT that has permissions to a particular repository outlined in `$RUNNER_REPOSITORY`
* `RUNNER_OWNER` - This variable would typically be the User a particular repository is under. Example: KyWa
* `RUNNER_REPOSITORY` - Which repository is this runner to be assigned to

## Usage
Below is an example use if running against the GitHub repository "https://github.com/KyWa/dockerbuilds" with $GITHUB_PAT being equal to a valid GitHub PAT for your account that has rights to the repository:

### Docker
```
docker run -d -e RUNNER_REPOSITORY=dockerbuilds -e RUNNER_OWNER=KyWa -e RUNNER_GITHUB_PAT=$GITHUB_PAT quay.io/kywa/github-runner:latest
```

### Kubernetes/OpenShift
```yaml
kind: List
apiVersion: v1
items:
- apiVersion: v1
  kind: Secret
  metadata:
    name: github-pat
  stringData:
    GITHUB_PAT: ghp_somesecretpat
- apiVersion: apps/v1
  kind: Deployment
  metadata:
    labels:
      app: github-runner
    name: github-runner
  spec:
    selector:
      matchLabels:
        app: github-runner
    replicas: 1
    template:
      metadata:
        labels:
          app: github-runner
      spec:
        containers:
        - env:
          - name: RUNNER_REPOSITORY
            value: dockerbuilds
          - name: RUNNER_OWNER
            value: KyWa
          - name: RUNNER_GITHUB_PAT
            valueFrom:
              secretKeyRef:
                key: GITHUB_PAT
                name: github-pat
          image: quay.io/kywa/github-runner:latest
          imagePullPolicy: Always
          name: github-runner
```
