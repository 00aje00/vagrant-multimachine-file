#!/bin/bash
# THIS SCRIPT SETS UP THE STAGE FOR CONTAINER OCHESTRATION BY INSTALLING THE DOCKER ENGINE
# BUT YOU CAN REPLACE THE COMMANDS WITH WHATEVER YOUR HEART DESIRES.

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -y -qq

sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y -qq

#The following fails on docker-ce-cli, "package not found"
#sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#It looks like this is all that's needed...maybe
sudo apt-get install -y docker-ce

sudo usermod -aG docker vagrant

#sudo service docker start



