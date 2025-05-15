#!/bin/bash
registry="${REGISTRY}"
namespace="${NAMESPACE}"
image_name="${IMAGENAME}"
images_version="${IMAGEVERSION}"

source="${image_name}:{$images_version}"
target="${registry}/${namespace}/${image_name}:${images_version}"

echo "Processing  $source ---> $target"
docker pull $source
docker tag $source $target
docker push $target
echo "Complated $source ---> $target"
