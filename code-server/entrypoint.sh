#!/bin/bash
set -e

USER_NAME=coder
USER_ID=$(id -u)
GROUP_ID=$(id -g)
HOME=/home/coder

export PATH=$PATH:/home/coder/.local/bin

if [ ! -e ${HOME}/.local/share/code-server/User/settings.json ]; then
mkdir -p ${HOME}/.local/share/code-server/User
echo '{
    "workbench.colorTheme": "Dark",
    "terminal.integrated.defaultProfile.linux": "bash",
    "terminal.integrated.shell.linux": "/bin/bash",
    "telemetry.enableTelemetry": false
    }' > ${HOME}/.local/share/code-server/User/settings.json
fi

exec "$@"
