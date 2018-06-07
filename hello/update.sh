#!/usr/bin/env bash
set -ex

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

change1=1
change2=1
if diff index1.html index.html &>/dev/null; then
  change1=$?
fi
if diff index2.html index.html &>/dev/null; then
  change2=$?
fi
if [ $change1 -eq 0 ]; then
  cp index2.html index.html
fi
if [ $change2 -eq 0 ]; then
  cp index1.html index.html
fi
docker $(docker-machine config test) build -t ndgit/hello:next .
docker $(docker-machine config test) push ndgit/hello:next
