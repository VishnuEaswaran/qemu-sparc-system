#!/usr/bin/env bash

_IMG_NAME="ajit_br_16.04";
_AJIT_HOME="/home/ajit/";

# docker exec -w _DOT_HOME -it $_IMG_NAME /bin/bash;
docker exec -u $(id -nu) -w $_AJIT_HOME -it $_IMG_NAME /bin/bash;