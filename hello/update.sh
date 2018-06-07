#!/usr/bin/env bash
set -e
if diff index1.html index.html &>/dev/null; then
  cp index2.html index.html
fi
if diff index2.html index.html &>/dev/null; then
  cp index1.html index.html
fi
docker build -t ndgit/hello:next .
docker push ndgit/hello:next
