# Despliegue de Marketing Mix Week en Azure VM

Esta guía te ayudará a desplegar el proyecto Marketing Mix Week en una máquina virtual de Azure.

## 📋 Prerrequisitos

- Cuenta de Azure activa
- Conocimientos básicos de Azure Portal
- Cliente SSH (PuTTY, Terminal, etc.)

## 🚀 Paso 1: Crear Máquina Virtual en Azure

### 1.1 Crear VM desde Azure Portal

1. Inicia sesión en [Azure Portal](https://portal.azure.com)
2. Busca "Virtual Machines" y haz clic en "Create"
3. Configura los siguientes parámetros:

**Básicos:**
- **Subscription:** Tu suscripción de Azure
- **Resource Group:** Crear nuevo o usar existente
- **Virtual machine name:** `mmw-server`
- **Region:** Selecciona la más cercana
- **Image:** Ubuntu Server 22.04 LTS
- **Size:** Standard_B2s (2 vCPUs, 4 GB RAM) - mínimo recomendado

**Administrador:**
- **Authentication type:** SSH public key
- **Username:** `azureuser`
- **SSH public key:** Genera una nueva o usa existente

**Networking:**
- **Public IP:** Crear nueva
- **NIC network security group:** Advanced
- **Configure network security group:** Crear nuevo con reglas:
  - SSH (22) - Tu IP
  - HTTP (80) - Any
  - HTTPS (443) - Any

4. Revisa y crea la VM

### 1.2 Conectar a la VM

```bash
# Conectar via SSH
ssh azureuser@<IP_PUBLICA_DE_TU_VM>
```

## 🛠️ Paso 2: Despliegue Automático

### Opción A: Script Automático (Recomendado)

```bash
# Descargar y ejecutar script de despliegue
wget https://raw.githubusercontent.com/GeralSilva/Marketing-Mix-Week/main/deploy-azure.sh
chmod +x deploy-azure.sh
bash deploy-azure.sh
```

### Opción B: Despliegue Manual

#### 2.1 Actualizar sistema e instalar dependencias

```bash
# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Agregar usuario al grupo docker
sudo usermod -aG docker $USER
newgrp docker
```

#### 2.2 Clonar y desplegar proyecto

```bash
# Instalar Git
sudo apt install -y git

# Crear directorio y clonar proyecto
sudo mkdir -p /opt/marketing-mix-week
sudo chown $USER:$USER /opt/marketing-mix-week
cd /opt/marketing-mix-week
git clone https://github.com/GeralSilva/Marketing-Mix-Week.git .

# Construir y ejecutar
docker-compose up -d --build
```

## 🔧 Paso 3: Configuración del Firewall

```bash
# Configurar UFW
sudo ufw allow 22/tcp   # SSH
sudo ufw allow 80/tcp   # HTTP
sudo ufw allow 443/tcp  # HTTPS
sudo ufw --force enable
```

## ✅ Paso 4: Verificación

### 4.1 Verificar contenedores

```bash
# Ver estado de contenedores
docker-compose ps

# Ver logs
docker-compose logs -f
```

### 4.2 Probar aplicación

1. Obtén la IP pública de tu VM desde Azure Portal
2. Abre en navegador: `http://<IP_PUBLICA>`
3. Verifica que cargue la página principal
4. Prueba las rutas:
   - `http://<IP_PUBLICA>/Versiones/2021.html`
   - `http://<IP_PUBLICA>/Versiones/2022.html`
   - `http://<IP_PUBLICA>/Versiones/2023.html`

## 🔄 Comandos de Gestión

```bash
# Ir al directorio del proyecto
cd /opt/marketing-mix-week

# Ver estado
docker-compose ps

# Ver logs en tiempo real
docker-compose logs -f

# Reiniciar aplicación
docker-compose restart

# Detener aplicación
docker-compose down

# Actualizar código y reiniciar
git pull origin main
docker-compose down
docker-compose up -d --build

# Ver uso de recursos
docker stats
```

## 🌐 Paso 5: Configurar Dominio (Opcional)

### 5.1 Configurar DNS

1. En tu proveedor de dominio, crea un registro A:
   - **Name:** @ (o subdominio deseado)
   - **Value:** IP pública de tu VM
   - **TTL:** 300

### 5.2 Configurar HTTPS con Let's Encrypt

```bash
# Instalar Certbot
sudo apt install -y certbot python3-certbot-nginx

# Obtener certificado SSL
sudo certbot --nginx -d tu-dominio.com

# Renovación automática
sudo crontab -e
# Agregar línea:
0 12 * * * /usr/bin/certbot renew --quiet
```

## 📊 Monitoreo y Mantenimiento

### Logs importantes

```bash
# Logs de la aplicación
docker-compose logs mmw-web

# Logs del sistema
sudo journalctl -u docker

# Uso de disco
df -h

# Uso de memoria
free -h
```

### Backup

```bash
# Crear backup del proyecto
tar -czf mmw-backup-$(date +%Y%m%d).tar.gz /opt/marketing-mix-week
```

## 🚨 Solución de Problemas

### Problema: Contenedor no inicia

```bash
# Verificar logs
docker-compose logs

# Reconstruir imagen
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

### Problema: No se puede acceder desde internet

1. Verificar reglas de firewall en Azure NSG
2. Verificar UFW en la VM
3. Verificar que el contenedor esté corriendo en puerto 80

### Problema: Sitio no actualiza

```bash
# Actualizar código
cd /opt/marketing-mix-week
git pull origin main
docker-compose restart
```

## 💰 Estimación de Costos Azure

**VM Standard_B2s (2 vCPUs, 4 GB RAM):**
- Costo aproximado: $30-50 USD/mes
- Incluye: Compute + Storage + Bandwidth

**Optimización de costos:**
- Usar Standard_B1s para menor tráfico
- Configurar auto-shutdown durante horarios no laborales
- Monitorear uso con Azure Cost Management

## 📞 Soporte

Si encuentras problemas:

1. Revisa los logs: `docker-compose logs`
2. Verifica conectividad: `curl -I http://localhost`
3. Consulta documentación de Azure
4. Contacta al administrador del proyecto

---

**¡Listo!** Tu aplicación Marketing Mix Week está ahora desplegada en Azure y accesible desde internet.