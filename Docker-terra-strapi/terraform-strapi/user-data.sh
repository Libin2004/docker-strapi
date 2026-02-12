#!/bin/bash

apt update -y
apt install -y docker.io

systemctl start docker
systemctl enable docker

docker pull libin07/my-strapi-app

docker run -d -p 1337:1337 libin07/my-strapi-app
