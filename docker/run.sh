#!/usr/bin/env bash

_NAME="ajit_br_16.04";

if [[ $1 != "" ]]; then
  _TAG="$1";
else
  _TAG="1.0";
fi

_IMG_NAME="$_NAME:$_TAG";
_CONT_NAME="$_NAME";

_HOST_MOUNT_DIR="$(pwd)/../";
_CONT_MOUNT_POINT="/home/ajit/";

chown -R $USER:docker .; # change the group owner

echo "Dot: Removing any container with name '$_CONT_NAME'";
docker rm --force $_CONT_NAME;

docker run \
  -d \
  --ulimit nofile=100000:100000 \
  --name $_CONT_NAME \
  --mount type=bind,source=$_HOST_MOUNT_DIR,target=$_CONT_MOUNT_POINT \
  $_IMG_NAME;

  echo -e "\nDot: Docker container started? Status: $? (Non Zero = ERROR)";