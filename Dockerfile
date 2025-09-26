# Dockerfile para Marketing Mix Week
FROM nginx:alpine

# Copiar archivos del proyecto al directorio de nginx
COPY . /usr/share/nginx/html/

# Configurar nginx para servir archivos estáticos
COPY nginx.conf /etc/nginx/nginx.conf

# Exponer puerto 80
EXPOSE 80

# Comando por defecto
CMD ["nginx", "-g", "daemon off;"]