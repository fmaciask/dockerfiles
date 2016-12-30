#!/bin/sh
# This script is from the following url:
# https://docs.gitlab.com/runner/executors/docker.html#workflow

dind docker daemon
    --host=unix:///var/run/docker.sock \
    --host=tcp://0.0.0.0:2375 \
    --storage-driver=vf &

docker build -t "$BUILD_IMAGE" .
docker push "$BUILD_IMAGE"
