#!/bin/bash
#SETUP VAULT
docker-compose create
docker-compose up -d
sudo apt-get install unzip
wget https://releases.hashicorp.com/vault/0.7.2/vault_0.7.2_linux_amd64.zip
unzip *.zip
sudo mv vault /usr/local/bin
export VAULT_ADDR="https://leave.thoughtworks.ec:8200"
vault init > keys.txt
for i in $(awk  '/Unseal/ {print $4}' keys.txt); do vault unseal "$i"; done
awk  '/Initial Root/ {print $4}' keys.txt | xargs vault auth
vault auth-enable cert
vault policy-write leave-team ./vault-server/policies/default-team-policy.hcl
for i in `ls ./vault-server/users/certs/*.crt`; do
	filewithextension=$(basename "$i")
	filename="${filewithextension%.*}"
  vault write auth/cert/certs/$filewithextension display_name="$filename" policies=leave-team certificate=@$i ttl=3600;
done
rm vault_0.7.2_linux_amd64.zip*
echo '######################################################'
echo '       Don’t forget to securely safe keys.txt'
echo '######################################################'
