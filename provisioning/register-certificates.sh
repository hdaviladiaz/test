export VAULT_ADDR="https://leave.thoughtworks.ec:8200"
for i in `ls ./vault-server/users/certs/*.crt`; do
        filewithextension=$(basename "$i")
        filename="${filewithextension%.*}"
  vault write auth/cert/certs/$filewithextension display_name="$filename" policies=leave-team certificate=@$i ttl=3600;
done
