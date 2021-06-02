#!/usr/bin/env bash

if [[ $1 != "" ]]; then
  _TAG="$1";
else
  _TAG="1.0";
fi

_IMG_NAME="ajit_br_16.04";
_DOCKER_GROUP=docker;
# get the gid of the docker group on the host system
_DOCKER_GID=$(getent group $_DOCKER_GROUP | awk -F: '{printf "%d", $3}');

echo "Group id of $_DOCKER_GROUP is $_DOCKER_GID";

# The user must add itself to the docker group.
# sudo usermod -aG docker $USER;
chown -R $USER:$_DOCKER_GROUP .; # change the group owner
chmod g+s .; # preserve the group change in the directory

docker build \
  --build-arg uid="$(id -u)" \
  --build-arg gid="$_DOCKER_GID" \
  --build-arg user="$(id -nu)" \
  --build-arg group="$_DOCKER_GROUP" \
  --tag $_IMG_NAME:$_TAG \
  .;
