#!/usr/bin/env bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

docker -D stack deploy --resolve-image always -c stack.yml dsdnext