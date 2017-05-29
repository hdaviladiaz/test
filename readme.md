# Generar certificado SSL para el servidor de vault
openssl req -newkey rsa:4096 -nodes -sha512 -x509 -days 3650 -nodes -subj "/C=EC/ST=Pichincha/L=Quito/O=ThoughtWorks EC/CN=leave.thoughtworks.ec"  -out vault-server/certs/vault-cert.crt  -keyout vault-server/certs/vault-cert.key
# Generar los certificados individuales para cada miembro del equipo
# Ejecutar provision.sh
# Poner comandos para escribir/leer un secreto
# Explicar la estructura de los secretos en el vault /dev/qa/stg/prod
# Explicar como revocar certificados
