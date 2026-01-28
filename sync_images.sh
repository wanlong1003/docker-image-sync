#!/bin/bash
declare -A images
images=(
    ["postgres:latest"]="postgres:latest"
    ["mysql:latest"]="mysql:latest"
    ["redis:latest"]="redis:latest"
    ["influxdb:latest"]="influxdb:latest"
    ["mongo:latest"]="mongo:latest"
    ["docker.elastic.co/elasticsearch/elasticsearch:8.17.0"]="elasticsearch:8.17.0"
    
    ["docker.elastic.co/kibana/kibana:8.17.0"]="kibana:8.17.0"
    ["dbeaver/cloudbeaver:latest"]="cloudbeaver:latest"
    ["dpage/pgadmin4:latest"]="pgadmin4:latest"
    ["mongo-express:latest"]="mongo-express:latest"
    ["redis/redisinsight:latest"]="redisinsight:latest"
    
    ["gitlab/gitlab-ce:latest"]="gitlab-ce:latest"
    ["nginx:latest"]="nginx:latest"
    ["caddy:latest"]="caddy:latest"
    ["jenkins/jenkins:latest"]="jenkins:latest"
    ["openproject/openproject:16"]="openproject:16"
    
    ["minio/minio:latest"]="minio:latest"
    ["rustfs/rustfs:latest"]="rustfs:latest"
    ["apache/kafka:latest"]="kafka:latest"
    ["rabbitmq:latest"]="rabbitmq:latest"
    ["exceptionless/exceptionless:latest"]="exceptionless:latest"
    
    ["mcr.microsoft.com/dotnet/sdk:8.0"]="dotnet-sdk:8.0"
    ["mcr.microsoft.com/dotnet/sdk:9.0"]="dotnet-sdk:9.0"
    ["mcr.microsoft.com/dotnet/aspnet:8.0"]="dotnet-aspnet:8.0"
    ["mcr.microsoft.com/dotnet/aspnet:9.0"]="dotnet-aspnet:9.0"
    ["node:latest"]="node:latest"
    
    ["ossrs/srs:latest"]="srs:latest"
    ["mikolatero/vlmcsd:latest"]="mikolatero-vlmcsd:latest"
    ["vlmcsd/vlmcsd:latest"]="vlmcsd:latest"
    ["jellyfin/jellyfin:latest"]="jellyfin:latest"
    ["ollama/ollama:latest"]="ollama:latest"
    ["registry:latest"]="registry:latest"
    ["consul:latest"]="consul:latest"
    ["deliters/subsonic:latest"]="subsonic:latest"
    ["gitea/gitea:latest"]="gitea:latest"
    ["gitea/act_runner:latest"]="gitea-act_runner:latest"
    ["gitea/runner-images:latest"]="gitea-runner-images:latest"
    ["gitea/runner-images:ubuntu-latest"]="gitea-runner-images:ubuntu-latest"
    ["gitea/runner-images:ubuntu-24.04"]="gitea-runner-images:ubuntu-24.04"
    ["gitea/runner-images:ubuntu-22.04"]="gitea-runner-images:ubuntu-22.04"
    ["ghcr.io/jeffvli/feishin:latest"]="feishin:latest"
    ["kaneo/kaneo:latest"]="kaneo:latest"

    ["postman/newman:latest"]="newman:latest"
    ["hoppscotch/hoppscotch:latest"]="hoppscotch:latest"

    ["scalarapi/aspire-api-reference:latest"]="baoor/scalarapi-aspire-api-reference:latest"
)

for image in "${!images[@]}"; do
    target=${REGISTRY}/${NAMESPACE}/${images[$image]}
    echo "Processing $image ---> $target"
    docker pull $image
    docker tag $image $target
    docker push $target
    echo "Complated $image ---> $target"
done
