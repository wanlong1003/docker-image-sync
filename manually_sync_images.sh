#!/bin/bash
source="${IMAGENAME}:${IMAGEVERSION}"
target="${REGISTRY}/${NAMESPACE}/${IMAGENAME}:${IMAGEVERSION}"

echo "Processing  $source ---> $target"
docker pull $source
docker tag $source $target
docker push $target
echo "Complated $source ---> $target"
