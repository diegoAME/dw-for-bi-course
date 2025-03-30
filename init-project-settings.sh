#!/bin/bash

# DOCKER

# Verifica si Docker está instalado
docker --version &>/dev/null
if [ $? -ne 0 ]; then
    echo "Docker no está instalado. Por favor, instálalo antes de continuar."
    exit 1
fi

# Verifica si Docker Compose está instalado
docker compose version &>/dev/null
if [ $? -ne 0 ]; then
    echo "Docker Compose no está instalado. Por favor, instálalo antes de continuar."
    exit 1
fi

# Verifica si existe el archivo docker-compose.yml
if [ ! -f "docker-compose.yml" ]; then
    echo "No se encontró el archivo docker-compose.yml en el directorio actual."
    exit 1
fi

# Ejecuta Docker Compose
echo "Iniciando servicios con Docker Compose..."
docker compose up -d

# Verifica el estado de los contenedores
echo "Estado de los contenedores:"
docker compose ps

#PYTHON SETTINGS
python3 -m venv dw-for-bi-course-env  
source dw-for-bi-course-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt