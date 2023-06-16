#!/bin/bash

#Installing Docker

sudo apt update -y && sudo apt upgrade -y
sudo apt install curl
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

