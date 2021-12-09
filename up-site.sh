#!/bin/bash

sed -i "s/{{ IP_address_project_1 }}/project_1/" /skillcloud-ngsite/balance.conf
sed -i "s/{{ IP_address_project_2 }}/project_2/" /skillcloud-ngsite/balance.conf
sed -i "s/{{ IP_address_project_3 }}/project_3/" /skillcloud-ngsite/balance.conf
sed -i "s/image: site/image: site:site/" /skillcloud-ngsite/docker-compose.yml
sed -i "s/image: balance/image: balance:balance/" /skillcloud-ngsite/docker-compose.yml
docker build -t site:site -f /skillcloud-ngsite/Dockerfile-site .
docker build -t balance:balance -f /skillcloud-ngsite/Dockerfile-balance .
docker-compose up -file /skillcloud-ngsite/docker-compose.yml -d
