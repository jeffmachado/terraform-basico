#!/bin/bash

sudo apt update
sudo apt install -y docker.io

sudo update-rc.d custom_startup defaults
sudo systemctl enable custom_startup

sudo yum update -y
sudo yum install -y docker
sudo systemctl status docker
sudo systemctl start docker
sudo chmod +x /etc/rc.d/rc.local

### Ouuuu

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository \
# "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
# $(lsb_release -cs) \
# stable"

# ## Instalando o Git e Docker
# sudo apt-get update
# sudo apt-get install -y \
# apt-transport-https \
# ca-certificates \
# curl \
# gnupg-agent \
# software-properties-common \
# docker-ce \
# containerd.io