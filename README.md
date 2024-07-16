# Gitea Deployment
Automatización con Ansible para instalar Docker, Docker Compose y desplegar Gitea en ubuntu-noble-24.04-amd64-server-20240701.1, con proxy Traefik. Scripts y playbooks configurados para AWS.

# Despliegue de Gitea con Ansible y Docker

Este repositorio contiene los playbooks de Ansible necesarios para desplegar Gitea utilizando Docker en un servidor Linux basado en Debian. También se incluye la configuración de Traefik como proxy para gestionar múltiples servicios en la misma máquina.

## Requisitos previos

- Acceso SSH al servidor
- Ansible instalado en la máquina local desde donde se ejecutarán los playbooks
- Conocimientos básicos de Docker y Ansible

## Configuración inicial

1. Clona este repositorio en tu máquina local:

   ```bash
   git clone https://github.com/tu-usuario/ansible-gitea-deployment.git
   cd ansible-gitea-deployment

2. Modifica el archivo hosts con la dirección IP del servidor y la ruta de la clave SSH:

   ```bash
   [servers] gitea_server ansible_host=tu-ip-server ansible_user=ubuntu ansible_ssh_private_key_file=/ruta/a/tu/clave-aws.pem

3. Asegúrate de tener Docker Compose instalado en el servidor. Si no está instalado, ejecuta el siguiente script en el servidor para instalarlo automáticamente:

   ```bash
   #!/bin/bash

   # Script para instalar Docker Compose si no está instalado

   if ! command -v docker-compose &> /dev/null; then
   echo "Docker Compose no está instalado. Instalando Docker Compose..."

   # Instalación de Docker Compose desde la URL específica

    sudo curl -L https://github.com/docker/compose/releases/download/v2.28.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

   echo "Docker Compose instalado correctamente."
   else
   echo "Docker Compose ya está instalado. Continuando..."
   fi

  ***Guarda este script como install_docker_compose.sh y ejecútalo en el servidor si es necesario:***

       sudo bash install_docker_compose.sh

4. Una vez instalado Docker Compose, se puede proceder con la ejecución del playbook de Ansible para desplegar Gitea y configurar Traefik como proxy.
