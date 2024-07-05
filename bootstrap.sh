#!/bin/bash

PROJECT_NAME=$1

DOCKERFILE_PATH=/tmp/devcontainer_dockerfile
DOCKER_IMAGE=devcontainer
DEVCONTAINER_TEMPLATE=ghcr.io/ewilazarus/devcontainers/ewilazarus:latest
WORKDIR=/devcontainer

create_tmp_devcontainer_dockerfile() {
    cat <<EOF > $DOCKERFILE_PATH
    FROM node:22-alpine
    RUN npm i -g @devcontainers/cli
    WORKDIR $WORKDIR
    ENTRYPOINT ["devcontainer"]
EOF
}

build_devcontainer_cli() {
    docker build -t $DOCKER_IMAGE -f $DOCKERFILE_PATH . 2> /dev/null
}

apply_template() {
    local options="{\"projectName\": \"$PROJECT_NAME\"}"
    docker run -v $(pwd):$WORKDIR $DOCKER_IMAGE templates apply -t $DEVCONTAINER_TEMPLATE -a "$options"
}

create_tmp_devcontainer_dockerfile
build_devcontainer_cli
apply_template
