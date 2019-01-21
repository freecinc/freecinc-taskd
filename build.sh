#! /bin/bash

VERSION=$(git describe --always)

docker build -t djmitche/freecinc-taskd:$VERSION --no-cache docker/
