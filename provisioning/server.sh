#!/bin/bash
#SELF SIGNED SSL CERTIFICATE FOR VAULT
openssl req -newkey rsa:4096 -nodes -sha512 -x509 -days 3650 \
        -nodes -subj "/C=EC/ST=Pichincha/L=Quito/O=ThoughtWorks EC/CN=leave.thoughtworks.ec" \
        -out vault-server/certs/vault-cert.crt  -keyout vault-server/certs/vault-cert.key

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

#GENERATING SSH KEY
mkdir ../gocd/ssh/key
ssh-keygen -t rsa -C "gocd@thoughtworks.com" -f ../gocd/ssh/key

echo "######################################################"
echo "Don't forget to relog/reboot before provisioning vault"
echo "######################################################"
