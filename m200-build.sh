#!/bin/sh

docker build -f Dockerfile-build -t m200-build .
docker run --rm -it -v `pwd`/build:/build m200-build ash -c "cd /usr/local/bin; tar -cJvf /build/app-bin.tar.xz *"

