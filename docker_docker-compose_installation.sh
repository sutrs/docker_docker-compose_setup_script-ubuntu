#!/bin/bash

###SUDO user required to install Docker & Docker-compose installation.
###Docker installation
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt update
sudo apt install docker-ce

sudo systemctl is-active docker
sudo systemctl is-enabled docker

sudo chmod 666 /var/run/docker.sock

docker version
##Add User to Docker Group
sudo usermod -aG docker $USER

###Download Docker Compose Binary
sudo curl -L "https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
(OR)

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Make Binary Executable
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
