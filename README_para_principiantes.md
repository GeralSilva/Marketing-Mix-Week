# Guía para principiantes: Cómo está creada y cómo mantener el sitio web de Marketing Mix Week

Este documento explica, paso a paso y en lenguaje de programación, cómo está construido y cómo mantener TODO el sitio. Aquí encontrarás qué hace cada archivo y carpeta, cómo editar contenido y cómo desplegar.

---

## 1) ¿Qué es este sitio?
Es un sitio web estático hecho con **HTML**, estilos de **Bootstrap**, íconos de **Font Awesome** y **Google Fonts**. Contiene varias páginas (por ejemplo `index.html` y `congreso.html`), imágenes organizadas en carpetas.

---

## 2) Mapa del proyecto (qué hay y para qué sirve)
- `index.html`: página principal del sitio (Marketing Mix Week, blog oficial). Tiene navbar, carrusel (con imágenes `img/Banner-01.png`, etc.), tarjetas y secciones informativas.
- `congreso.html`: página del "I Congreso de Actualización en Marketing". Incluye carrusel, agenda por día con tablas, líneas temáticas, QR y modal de justificación.
- `Versiones/`: contiene páginas históricas
  - `2021.html`, `2022.html`, `2023.html`.
  - `img-2022/` y `img-2023/`: imágenes de esos años.
- `img/`: imágenes generales del sitio (banners, fechas del congreso, etc.). Ejemplos: `Banner-01.png`, `Banner-02.png`, `Banner-03.png`, `Banner-01-Congreso.png`, `Fechas-clave-Congreso.png`.
- `img-dias/`: imágenes organizadas por día del congreso
  - `lunes/`, `martes/`, `miercoles/`, `jueves/`, `viernes/`: cada carpeta con muchas imágenes (`.jpg`/`.jpeg`).
- `imag-congreso/`: colección adicional de imágenes (`1.jpg` a `14.jpg`).
- Recursos sueltos:
  - `logo.png`: logo del sitio usado en el navbar.
  - `images.png`: favicon del sitio.
  - `QRcongreso.png`: imagen del QR para inscripción.
  - `proximamente.png`: recurso gráfico adicional.
  - Imágenes sueltas por día (ej.: `Lunes-10.jpg`, `Martes-11.jpeg`, `Miercoles-12.jpeg`, `Jueves-13.jpeg`, `Viernes-14.jpeg`).
- Archivos de despliegue y soporte:
  - `.git/`: carpeta interna de Git (control de versiones). No la edites; la maneja Git.
- Documentación:
  - `README.md`: guía general del proyecto.
  - `README_para_principiantes.md`: esta guía para principiantes.
  - `ESTRUCTURA.txt`: inventario completo de todas las carpetas y archivos.

> Nota: para ver la lista completa y actualizada de archivos, abre `ESTRUCTURA.txt`.

---

## 3) Cómo abrir y ver el sitio
- Método rápido: doble clic en `index.html` o `congreso.html` para abrir en tu navegador.
- Método recomendado (si usas VS Code): instala la extensión **Live Server** y haz clic en "Go Live" para ver cambios al instante.

Requisitos:
- Conexión a internet (Bootstrap, Font Awesome y Google Fonts se cargan por CDN).

---

## 4) Estructura de páginas y cómo editarlas
Las páginas usan componentes similares: navbar, carrusel, secciones (tarjetas), tablas y botones.

- Navbar (`<nav class='navbar ...'>`): contiene el logo y enlaces. Edita los `<a class='nav-link'>` para cambiar rutas de menú.
- Carrusel (`#heroCarousel`): cada slide es un `<div class='carousel-item'>`. Las imágenes de fondo están definidas en CSS:
  - En `index.html`: `img/Banner-01.png`, `img/Banner-02.png`, `img/Banner-03.png`.
  - En `congreso.html`: `img/Banner-01-Congreso.png`, `img/Banner-02-Congreso.png`, `img/Banner-03-Congreso.png`.
  Cambia la ruta `url('...')` en el CSS si reemplazas imágenes.
- Tarjetas (`.info-card`): bloques con título `<h3>` y texto `<p>`. Úsalas para presentar información.
- Tablas (agenda por día): dentro de `<tbody> ... </tbody>` cada conferencia es un `<tr>`. Edita hora, título, conferencistas y enlaces a YouTube (`href='https://...'`).
- Secciones temáticas (bloques colapsables): usan `.thematic-line` y `.thematic-content` con `onclick="toggleContent('ID')"`. Asegúrate de que cada `id` sea único.
- QR e imágenes: actualiza `src='./QRcongreso.png'` o las rutas en `img/` según corresponda.
- Modal de justificación (en `congreso.html`): el botón del carrusel abre el modal `#justificacionModal`. Edita el texto dentro de `<div class='modal-body'>`.

---

## 5) JavaScript interactivo básico
La función al final de `congreso.html`:
```js
function toggleContent(id) {
  const content = document.getElementById(id);
  const isVisible = content.classList.contains('show');
  document.querySelectorAll('.thematic-content').forEach(el => el.classList.remove('show'));
  if (!isVisible) content.classList.add('show');
}
```
- Úsala para mostrar/ocultar bloques. Requiere un `id` único y clase `thematic-content` en el bloque.

Bootstrap también aporta interactividad (navbar, carrusel, modal) mediante `bootstrap.bundle.min.js`.

---

## 6) Buenas prácticas al editar
- Haz cambios pequeños y prueba en el navegador.
- Respeta las etiquetas: si abres `<div>`, ciérralo con `</div>`.
- Mantén rutas correctas (mayúsculas/minúsculas y carpetas).
- No borres los enlaces a Bootstrap/Font Awesome a menos que los reemplaces por locales.
- Si algo se rompe, deshaz el último cambio.

---

## 7) Despliegue (visión general)

> Si no necesitas despliegue, puedes alojar los archivos en cualquier hosting estático (GitHub Pages, Netlify, Vercel, etc.).

---

## 8) Dónde están las imágenes
- Banners y recursos generales: `img/`.
- Imágenes por día del congreso: `img-dias/(lunes|martes|miercoles|jueves|viernes)/`.
- Imágenes del congreso varias: `imag-congreso/`.
- Históricos de versiones: `Versiones/img-2022/`, `Versiones/img-2023/`.

Para reemplazar una imagen, coloca el archivo en la carpeta correcta y actualiza el atributo `src` (o la `background-image` en CSS).

---

## 9) Lista completa de archivos
Para no saturar esta guía, la lista completa está en `ESTRUCTURA.txt`, generada para este proyecto. Ábrela si necesitas localizar cualquier recurso específico.

---

## 10) Próximas mejoras sugeridas
- Separar los estilos del `<style>` en un archivo `styles.css`.
- Unificar imágenes redundantes y estandarizar nombres.
- Agregar una página de documentación interna enlazada desde el navbar (opcional).

---

## 11) Continuidad
Documenta cambios relevantes en `NOTAS.txt` (fecha, qué cambiaste y por qué). Así facilitas el trabajo de quien continúe.

Con esta guía y `ESTRUCTURA.txt` tendrás todo lo necesario para mantener y evolucionar el sitio completo.