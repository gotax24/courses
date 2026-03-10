const poster = document.getElementById("poster");
const file = poster.src;

const fondo = document.getElementById("fondo");
fondo.style.backgroundImage = `url(${file})`;

const ocultar = document.getElementById("ocultar");
const menu = document.getElementById("menu");

ocultar.addEventListener("click", () => {
  menu.classList.toggle("hide"); //toggle hace lo mismo que abajo 
  /* 
    if (menu.classList.contains("hide")) {
      menu.classList.remove("hide");
    } else {
        menu.classList.add("hide");
    }
  */
});
