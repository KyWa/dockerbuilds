#!/bin/bash

set -x

start_minecraft() {
    echo "eula=true" > /minecraft/eula.txt
    exec java $MC_JAVA_OPTS -jar /minecraft/server.jar nogui   
}

if [[ ! -z $MC_UPGRADE ]];then
    curl -o /minecraft/server.jar $(curl `curl -sL https://launchermeta.mojang.com/mc/game/version_manifest.json | /usr/local/bin/jq -r '.latest.release as $release | .versions[] | select (.id == $release) | .url'` | /usr/local/bin/jq -r '.downloads.server.url')
    start_minecraft
elif [[ ! -f /minecraft/server.jar ]];then  
    curl -o /minecraft/server.jar $(curl `curl -sL https://launchermeta.mojang.com/mc/game/version_manifest.json | /usr/local/bin/jq -r '.latest.release as $release | .versions[] | select (.id == $release) | .url'` | /usr/local/bin/jq -r '.downloads.server.url')
    start_minecraft
fi
start_minecraft
