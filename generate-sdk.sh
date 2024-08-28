#!/usr/bin/env bash

set -eu

OPENAPI_SCHEMA="$1"

exec docker run --rm \
    -v "$(pwd):/local" \
    openapitools/openapi-generator-cli \
    generate \
    -i "/local/${OPENAPI_SCHEMA}" \
    -g typescript-axios \
    -o /local/src \
    --additional-properties=useSingleRequestParameter=true
