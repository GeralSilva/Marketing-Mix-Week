# 🎯 Marketing Mix Week

> Evento académico interactivo para la enseñanza y práctica de las 4P del Marketing

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-brightgreen)](https://geralsilva.github.io/Marketing-Mix-Week/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue)](https://hub.docker.com/)
[![Azure](https://img.shields.io/badge/Azure-Compatible-0078d4)](https://azure.microsoft.com/)

## 📋 Descripción

Marketing Mix Week es una plataforma web educativa diseñada para facilitar la organización y gestión de eventos académicos centrados en el marketing. El proyecto incluye múltiples versiones anuales (2021-2023) con información detallada sobre responsabilidades de instructores, actividades del evento y las 4P del Marketing.

## ✨ Características

### 🎨 Diseño Moderno
- **Interfaz responsive** compatible con dispositivos móviles
- **Diseño visual atractivo** con gradientes y animaciones
- **Iconografía profesional** con Font Awesome
- **Paleta de colores corporativa** en tonos naranjas

### 📚 Contenido Educativo
- **Las 4P del Marketing**: Producto, Precio, Plaza, Promoción
- **Responsabilidades de instructores** claramente definidas
- **Actividades del evento**: Olimpiadas y Marketing Mix Strategy
- **Múltiples versiones** para diferentes años académicos

### 🛠️ Tecnología
- **HTML5 semántico** para mejor SEO
- **CSS3 moderno** con variables y flexbox/grid
- **Bootstrap 5** para componentes responsivos
- **Optimización web** para carga rápida

## 🚀 Inicio Rápido

### Opción 1: GitHub Pages (Recomendado)

Visita directamente: [https://geralsilva.github.io/Marketing-Mix-Week/](https://geralsilva.github.io/Marketing-Mix-Week/)

### Opción 2: Desarrollo Local

```bash
# Clonar repositorio
git clone https://github.com/GeralSilva/Marketing-Mix-Week.git
cd Marketing-Mix-Week

# Abrir en navegador
# Windows
start index.html

# macOS
open index.html

# Linux
xdg-open index.html
```

### Opción 3: Servidor Local

```bash
# Con Python
python -m http.server 8000

# Con Node.js
npx serve .

# Con PHP
php -S localhost:8000
```

Luego visita: `http://localhost:8000`

## 🐳 Despliegue con Docker

### Desarrollo Local

```bash
# Construir imagen
docker build -t marketing-mix-week .

# Ejecutar contenedor
docker run -p 80:80 marketing-mix-week
```

### Producción con Docker Compose

```bash
# Ejecutar en segundo plano
docker-compose up -d

# Ver logs
docker-compose logs -f

# Detener
docker-compose down
```

## ☁️ Despliegue en Azure

Para desplegar en una máquina virtual de Azure, consulta la [Guía de Despliegue en Azure](DEPLOY-AZURE.md).

### Despliegue Rápido

```bash
# Descargar y ejecutar script automático
wget https://raw.githubusercontent.com/GeralSilva/Marketing-Mix-Week/main/deploy-azure.sh
chmod +x deploy-azure.sh
bash deploy-azure.sh
```

## 📁 Estructura del Proyecto

```
Marketing-Mix-Week/
├── 📄 index.html              # Página principal
├── 📁 Versiones/              # Versiones por año
│   ├── 📄 2021.html          # Versión detallada 2021
│   ├── 📄 2022.html          # Versión resumida 2022
│   └── 📄 2023.html          # Versión resumida 2023
├── 🐳 Dockerfile             # Configuración Docker
├── 🐳 docker-compose.yml     # Orquestación Docker
├── ⚙️ nginx.conf             # Configuración Nginx
├── 🚀 deploy-azure.sh        # Script despliegue Azure
├── 📖 DEPLOY-AZURE.md        # Guía despliegue Azure
├── 🚫 .dockerignore          # Exclusiones Docker
└── 📖 README.md              # Este archivo
```

## 🎯 Versiones Disponibles

### 📅 2021 - Versión Completa
- Información detallada del evento
- 8 responsabilidades de instructores expandidas
- Cronograma completo de actividades
- Criterios de evaluación detallados

### 📅 2022 - Versión Visual
- Diseño moderno y minimalista
- Enfoque en elementos visuales
- Información resumida y clara
- Optimizada para consulta rápida

### 📅 2023 - Versión Actualizada
- Últimas mejoras implementadas
- Diseño responsive mejorado
- Contenido actualizado
- Mejor experiencia de usuario

## 👥 Responsabilidades de Instructores

1. **Selección de Proyectos** - Preseleccionar el mejor proyecto por ficha
2. **Apoyo a Aprendices** - Preparar y apoyar en el desarrollo del proyecto
3. **Revisión de Material** - Revisar presentaciones y piezas gráficas
4. **Inscripciones** - Inscribir grupos de proyecto y aprendices competidores
5. **Jurado Especializado** - Participar como jurado según área de expertise
6. **Base de Datos** - Apoyar construcción de base de expertos y egresados
7. **Participación Activa** - Participar con sus fichas en todas las actividades
8. **Control de Asistencia** - Verificar asistencia y participación de aprendices

## 🎮 Actividades del Evento

### 🏆 Olimpiadas de Conocimiento
- Competencia diaria entre fichas
- Preguntas especializadas por cada P del marketing
- Sistema de puntuación y rankings
- Premios y reconocimientos

### 🎯 Marketing Mix Strategy
- Desarrollo de planes de marketing integrales
- Trabajo en equipos multidisciplinarios
- Presentaciones ejecutivas
- Evaluación por jurado experto

## 🛠️ Tecnologías Utilizadas

- **Frontend**: HTML5, CSS3, JavaScript
- **Framework CSS**: Bootstrap 5.3.0
- **Iconos**: Font Awesome 6.0.0
- **Contenedorización**: Docker & Docker Compose
- **Servidor Web**: Nginx Alpine
- **Despliegue**: GitHub Pages, Azure VM
- **Control de Versiones**: Git & GitHub

## 📱 Compatibilidad

### Navegadores Soportados
- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

### Dispositivos
- 📱 **Móviles**: iPhone, Android
- 📱 **Tablets**: iPad, Android tablets
- 💻 **Desktop**: Windows, macOS, Linux

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Para contribuir:

1. **Fork** el repositorio
2. **Crea** una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. **Push** a la rama (`git push origin feature/AmazingFeature`)
5. **Abre** un Pull Request

### 📋 Guías de Contribución

- Mantén el código limpio y bien documentado
- Sigue las convenciones de nomenclatura existentes
- Prueba en múltiples navegadores antes de enviar
- Actualiza la documentación si es necesario

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 👨‍💻 Autor

**Geraldine Silva**
- GitHub: [@GeralSilva](https://github.com/GeralSilva)
- Proyecto: [Marketing Mix Week](https://github.com/GeralSilva/Marketing-Mix-Week)

## 🏢 Institución

**SENA - Centro de Gestión de Mercados, Logística y Tecnologías de la Información**
- Coordinación Académica de Mercadeo e Industrias Creativas
- Programa de formación en Marketing y Ventas

## 📞 Soporte

Si encuentras algún problema o tienes sugerencias:

1. 🐛 **Reportar bugs**: [Issues](https://github.com/GeralSilva/Marketing-Mix-Week/issues)
2. 💡 **Sugerir mejoras**: [Discussions](https://github.com/GeralSilva/Marketing-Mix-Week/discussions)
3. 📧 **Contacto directo**: A través de GitHub

## 🔄 Changelog

### v2.0.0 (2024)
- ✨ Agregadas versiones 2022 y 2023
- 🐳 Configuración Docker completa
- ☁️ Soporte para despliegue en Azure
- 📱 Mejoras en diseño responsive
- 🎨 Actualización visual completa

### v1.0.0 (2021)
- 🎉 Lanzamiento inicial
- 📄 Versión 2021 completa
- 🎯 Definición de responsabilidades
- 🏆 Estructura de actividades

---

<div align="center">

**¡Gracias por usar Marketing Mix Week!** 🎯

[⭐ Dale una estrella](https://github.com/GeralSilva/Marketing-Mix-Week) si este proyecto te fue útil

</div>