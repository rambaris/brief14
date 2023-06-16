#!/bin/bash

#Installing Docker

sudo apt update -y && sudo apt upgrade -y
sudo apt install curl
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#Creating container

sudo wget https://hub.docker.com/layers/axelronny/nginx1/latest/images
sudo docker build  -t nginx1 .
sudo docker run -d -p 80:80 --name test-docker-nginx axelronny/nginx1