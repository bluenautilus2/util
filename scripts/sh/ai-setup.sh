#!/bin/bash

if [ "$TII_JFROG_USERNAME" = "" ];then
    # Running locally
    export PIP_EXTRA_INDEX_URL="https://artifactory.turnitin.com/artifactory/api/pypi/python/simple"
else
    export PIP_EXTRA_INDEX_URL=https://$TII_JFROG_USERNAME:$TII_JFROG_PASSWORD@turnitin.jfrog.io/artifactory/api/pypi/pypi/simple
fi

export SAM_BUILD_ARGS="--container-env-var PIP_EXTRA_INDEX_URL=$PIP_EXTRA_INDEX_URL --use-container --cached"

build(){
    echo sam build $SAM_BUILD_ARGS;
    sam build $SAM_BUILD_ARGS || return 1;
}
build
