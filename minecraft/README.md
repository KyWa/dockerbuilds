# Minecraft Server Dockerfile

This `Dockerfile` will build a Red Hat UBI image with Java (OpenJDK) that will, upon start up, run a Minecraft Server. If using persistent storage, the start up verifies if an existing `server.jar` is in `/minecraft` and will not overwrite it unless the environment variable `MC_UPGRADE` is set. It can be set to anything as the start up only checks to see if the variable is empty.

## Usage
When running in `docker` or `podman`, run it like so:

```sh
$ podman run -d -v minecraft_data:/minecraft -p 25565:25565 -e MC_JAVA_OPTS="-Xms512m -Xmx2048m" quay.io/kywa/minecraft-server:latest
```

### Vars
`MC_JAVA_OPTS` = Java Options for running Minecraft Server. Example: `-Xms512m -Xmx2048m`
`MC_UPGRADE` = Whether or not to upgrade the existing `server.jar` Example: `yes`

