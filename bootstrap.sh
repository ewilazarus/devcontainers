#!/bin/bash

PROJECT_NAME=$1

DOCKERFILE_PATH=/tmp/devcontainer_dockerfile
DOCKER_IMAGE=devcontainer
DEVCONTAINER_TEMPLATE=ghcr.io/ewilazarus/devcontainers/ewilazarus:latest

create_tmp_devcontainer_dockerfile() {
    cat <<EOF > $DOCKERFILE_PATH
    FROM node:22-alpine
    RUN npm i -g @devcontainers/cli
    ENTRYPOINT ["devcontainer"]
EOF
}

build_devcontainer_cli() {
    docker build -t $DOCKER_IMAGE -f $DOCKERFILE_PATH . 2> /dev/null
}

apply_template() {
    docker run devcontainer templates apply -t $DEVCONTAINER_TEMPLATE -a '{"projectName": "$PROJECT_NAME"}'
}

create_tmp_devcontainer_dockerfile
build_devcontainer_cli
apply_template
