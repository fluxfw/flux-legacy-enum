#!/usr/bin/env sh

set -e

if [ -z `command -v copy-from-docker-image` ]; then
    echo "Please install flux-docker-utils"
    exit 1
fi

if [ -n "$CI_REGISTRY" ] && [ -n "$CI_PROJECT_NAMESPACE" ]; then
    image="$CI_REGISTRY/$CI_PROJECT_NAMESPACE/flux-legacy-enum"
else
    image="docker-registry.fluxpublisher.ch/flux-enum/legacy"
fi

tag="$1"
if [ -z "$tag" ]; then
    tag="latest"
fi

(cd "`dirname "$0"`/.." && copy-from-docker-image "$image:$tag" /flux-legacy-enum/libs libs)