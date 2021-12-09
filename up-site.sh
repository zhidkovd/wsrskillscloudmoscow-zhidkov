#!/bin/bash

sed -i "s/{{ IP_address_project_1 }}/project_1/" /wsr-skillcloud-moscow/balance.conf
sed -i "s/{{ IP_address_project_2 }}/project_2/" /wsr-skillcloud-moscow/balance.conf
sed -i "s/{{ IP_address_project_3 }}/project_3/" /wsr-skillcloud-moscow/balance.conf
sed -i "s/image: site/image: site:site/" /wsr-skillcloud-moscow/docker-compose.yml
sed -i "s/image: balance/image: balance:balance/" /wsr-skillcloud-moscow/docker-compose.yml
docker build -t site:site -f /wsr-skillcloud-moscow/Dockerfile-site .
docker build -t balance:balance -f /wsr-skillcloud-moscow/Dockerfile-balance .
docker-compose up -file /wsr-skillcloud-moscow/docker-compose.yml -d
