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
