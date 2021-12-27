#!/bin/bash

## Builder Helper script to get around jq issues in Dockerfile
jq_path=`which jq`
if [[ ! ${jq_path} ]];then
    echo "jq not installed, installing"
    curl -o jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
    chmod +x jq
else
    ln -s $jq_path ./jq
fi

echo "starting MC server download"
MC_URL=$(curl `curl -sL https://launchermeta.mojang.com/mc/game/version_manifest.json | ./jq -r '.latest.release as $release | .versions[] | select (.id == $release) | .url'` | ./jq -r '.downloads.server.url') && curl -o server.jar $MC_URL

docker build -t minecraft:latest .

rm -rf jq server.jar
