#!/bin/bash
set -e  
cd /var/cache/drone/src/path/to/app

# [pass tests here]
# ARREGLAR ESTO ANTES DE EJECUTARLO

wrapdocker &  
sleep 5

docker build -t docker-registry/image-name .  
docker push docker-registry/image-name
