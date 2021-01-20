#!/usr/bin/sh
cd "$(dirname $0)"
docker build -f ../dockerfiles/nh.Dockerfile ../../nh
