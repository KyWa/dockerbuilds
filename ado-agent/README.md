# Azure DevOps Self-Hosted Agent

Documentation comes from: https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops

Using straight from documentation, but will move away from Ubuntu at a later date.

## Running via Docker

```
$ docker run -e AZP_URL=dev.azure.com/unixislife -e AZP_TOKEN=`cat secrets` -e AZP_AGENT_NAME=kywa-docker-test quay.io/kywa/ado-agent:latest
```
