#!/bin/bash

sudo apt update
sudo apt install docker.io

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
containerd.io