#!/bin/bash
declare -A images
images=(
    ["postgres:latest"]="postgres:latest"
    ["mysql:latest"]="mysql:latest"
    ["redis:latest"]="redis:latest"
    ["influxdb:latest"]="influxdb:latest"
    ["mongo:latest"]="mongo:latest"
    ["dbeaver/cloudbeaver:latest"]="cloudbeaver:latest"
    ["dpage/pgadmin4:latest"]="pgadmin4:latest"
    ["mongo-express:latest"]="mongo-express:latest"
    ["gitlab/gitlab-ce:latest"]="gitlab-ce:latest"
    ["nginx:latest"]="nginx:latest"
    ["caddy:latest"]="caddy:latest"
    ["jenkins/jenkins:latest"]="jenkins:latest"
    ["minio/minio:latest"]="minio:latest"
    ["apache/kafka:latest"]="kafka:latest"
    ["mcr.microsoft.com/dotnet/sdk:8.0"]="dotnet-sdk:8.0"
    ["mcr.microsoft.com/dotnet/sdk:9.0"]="dotnet-sdk:9.0"
    ["mcr.microsoft.com/dotnet/aspnet:8.0"]="dotnet-aspnet:8.0"
    ["mcr.microsoft.com/dotnet/aspnet:9.0"]="dotnet-aspnet:9.0"
    ["node:latest"]="node:latest"
    ["ossrs/srs:latest"]="srs:latest"
    ["mikolatero/vlmcsd:latest"]="mikolatero-vlmcsd:latest"
    ["vlmcsd/vlmcsd:latest"]="vlmcsd:latest"
    ["jellyfin/jellyfin:latest"]="jellyfin:latest"
    ["elasticsearch:latest"]="elasticsearch:latest"
    ["exceptionless/exceptionless:latest"]="exceptionless:latest"
)

registry="${REGISTRY}"

for image in "${!images[@]}"; do
    target=${registry}${images[$image]}
    echo "Processing $image ---> $target"
    docker pull $image
    docker tag $image $target
    docker push $target
    echo "Complated $image ---> $target"
done
