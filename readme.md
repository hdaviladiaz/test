Bienvenidos al repositorio de infraestructura
====================================
***
Para realizar el provisionamiento del servidor de secretos es necesario tener una máquina con una instalación fresca de Ubuntu Server 16.04. A continuación se detallan los requisitos necesarios antes de comenzar la configuración del servidor de Ubuntu.

# Provisionamiento del servidor
---
#### 1. Generar certificado SSL para el servicio de vault
El servicio de Vault es ofrecido a partir de un API REST que puede ser consumida por el cliente de la linea de comandos (CLI) o mediante un cliente REST. Como parte del proceso de asegurar el transporte es necesario que el servicio de Vault utilice SSL para las conexiones HTTP. Para ello vamos a generar un certificado SSL autofirmado que configuraremos para que sea utilizado por Vault.
```bash
openssl req -newkey rsa:4096 -nodes -sha512 -x509 -days 3650 \
        -nodes -subj "/C=EC/ST=Pichincha/L=Quito/O=ThoughtWorks EC/CN=leave.thoughtworks.ec" \
        -out vault-server/certs/vault-cert.crt  -keyout vault-server/certs/vault-cert.key
```
> **Note:**
> - Este comando creará el certificado y su llave privada en la carpeta ./vault-server/certs/
> - Asegúrate de guardar de forma segura la llave privada del certificado y no subirla al repositorio

#### 2. Generar los certificados individuales para cada miembro del equipo
```bash
openssl req -newkey rsa:4096 -nodes -sha512 -x509 -days 3650 -nodes -subj “/C=EC/ST=Pichincha/L=Quito/O=ThoughtWorks EC/CN=<member-name-lastname>”  -out vault-server/users/certs/<member-name>.crt  -keyout vault-server/users/certs/<member-name>.key
```
#### 3. Ejecutar aprovisionamiento
#### 3.1 Requerimientos
- python 2.7.x o superior
- pip
- ansible
- git (instalar desde el binario)
- Acceso al repositorio de infraestructura
- Contraseña de ansible-vault

#### 3.2 Instalación en MAC OSX
```bash
brew install python 
sudo easy_install pip
pip install ansible 
```
#### 3.3 Ejecutar el aprovisionamiento con Ansible
```bash
ansible-playbook playbook.yml  -u <usuario-remoto> -k --ask-vault-pass
```
> **Note:**
> Se presupone que se conoce el usuario y la contraseña del usuario remoto de la máquina a aprovisionar. Es necesario que este usuario tenga permisos para hacer sudo sin solicitar contraseña

#### 4. Poner comandos para escribir/leer un secreto
#### 5. Explicar la estructura de los secretos en el vault /dev/qa/stg/prod
#### 6. Explicar como revocar certificados

# Configuración de los clientes
---
### 1. Instalacion de Vault en Mac
```bash
  brew install vault
  sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ./vault-server/certs/vault-cert.crt
```
