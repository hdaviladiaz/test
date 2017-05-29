#!/bin/bash
#INSTALL DOCKER
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo service docker restart
sudo usermod -aG docker $(whoami)

#INSTALL DOCKER-COMPOSE
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -y python-pip
sudo pip install docker-compose

#INSTALLING CA-CERTIFICATES
sudo apt-get install -y ca-certificates
sudo cp vault-server/certs/vault-cert.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates

echo "######################################################"
echo "Don't forget to relog/reboot before provisioning vault"
echo "######################################################"
