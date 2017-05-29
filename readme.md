# Provisionamiento del servidor
## Generar certificado SSL para el servidor de vault
```bash
openssl req -newkey rsa:4096 -nodes -sha512 -x509 -days 3650 \
        -nodes -subj "/C=EC/ST=Pichincha/L=Quito/O=ThoughtWorks EC/CN=leave.thoughtworks.ec" \
        -out vault-server/certs/vault-cert.crt  -keyout vault-server/certs/vault-cert.key
```
## Generar los certificados individuales para cada miembro del equipo
## Ejecutar provision.sh
## Poner comandos para escribir/leer un secreto
## Explicar la estructura de los secretos en el vault /dev/qa/stg/prod
## Explicar como revocar certificados

# Configuración de los clientes
## Instalacion de Vault en Mac
 - brew install vault
 - sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ./vault-server/certs/vault-cert.crt
