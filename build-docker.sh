#!/bin/bash -e

DOCKER="docker"
if ! ${DOCKER} ps >/dev/null 2>&1; then
        DOCKER="sudo docker"
fi
if ! ${DOCKER} ps >/dev/null; then
        echo "error connecting to docker:"
        ${DOCKER} ps
        exit 1
fi

${DOCKER} build -t liteshort-build docker
${DOCKER} run --rm --privileged \
    --volume "$(pwd)":/liteshort \
    --name "liteshort-build" \
    liteshort-build \
    bash -e -o pipefail -c \
    "cd /liteshort/; VERSION=$VERSION ./build.sh"
