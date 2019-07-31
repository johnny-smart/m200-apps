#!/bin/sh

# docker-compose run tools

docker-compose run --rm tools ash -c 'cfgldr -scommip $(getent hosts scomm | cut -d" " -f1) -nummod ${PBX_MODULE} -r smp_conf.bin'
docker-compose run --rm tools ash -c 'cfgcpl -p smp_conf.bin | xz > cfg_$(date +\%Y\%m\%d_\%H\%M).smp.xz'
# docker-compose run --rm tools cfgcpl -p smp_conf.bin > /srv/upload/m200.smp
