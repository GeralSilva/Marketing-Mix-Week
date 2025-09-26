#!/bin/bash

# Script de despliegue para Azure VM - Marketing Mix Week
# Ejecutar como: bash deploy-azure.sh

echo "=== Iniciando despliegue de Marketing Mix Week en Azure VM ==="

# Actualizar sistema
echo "Actualizando sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar Docker
echo "Instalando Docker..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Instalar Docker Compose
echo "Instalando Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Agregar usuario al grupo docker
sudo usermod -aG docker $USER

# Instalar Git
echo "Instalando Git..."
sudo apt install -y git

# Crear directorio para la aplicación
echo "Configurando directorio de aplicación..."
sudo mkdir -p /opt/marketing-mix-week
sudo chown $USER:$USER /opt/marketing-mix-week
cd /opt/marketing-mix-week

# Clonar repositorio
echo "Clonando repositorio..."
git clone https://github.com/GeralSilva/Marketing-Mix-Week.git .

# Configurar firewall
echo "Configurando firewall..."
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable

# Construir y ejecutar contenedor
echo "Construyendo y ejecutando aplicación..."
sudo docker-compose up -d --build

# Verificar estado
echo "Verificando estado del contenedor..."
sudo docker-compose ps

# Mostrar logs
echo "Mostrando logs recientes..."
sudo docker-compose logs --tail=20

echo "=== Despliegue completado ==="
echo "La aplicación está disponible en: http://$(curl -s ifconfig.me)"
echo "Para ver logs: sudo docker-compose logs -f"
echo "Para reiniciar: sudo docker-compose restart"
echo "Para detener: sudo docker-compose down"