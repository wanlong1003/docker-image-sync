#!/bin/bash
registry="${REGISTRY}"
namespace="${NAMESPACE}"
image_name="${IMAGENAME}"
image_version="${IMAGEVERSION}"

source="${image_name}:${image_version}"
target="${registry}/${namespace}/${image_name}:${image_version}"

echo "$registry"
echo "$namespace"
echo "$image_name"
echo "$image_version"

echo "Processing  $source ---> $target"
docker pull $source
docker tag $source $target
docker push $target
echo "Complated $source ---> $target"
