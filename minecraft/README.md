# Minecraft Dockerfile

To build this image run the following:

```sh
$ ./builder.sh
```

This will download the latest `server.jar` and `jq` as its needed to verify the latest version. Once the latest Minecraft Server has been downloaded, it will build the image using `docker` and clean up the `server.jar` and `jq` files.
