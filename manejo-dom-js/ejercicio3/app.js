const poster = document.getElementById("poster");
const file = poster.src;

const fondo = document.getElementById("fondo");
fondo.style.backgroundImage = `url(${file})`;

