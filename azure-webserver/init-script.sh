#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install curl
#Installing Docker
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#Creating container
sudo docker pull rambaris/myapppython
sudo docker run -d --name webserver -p 80:80 #Creating container
