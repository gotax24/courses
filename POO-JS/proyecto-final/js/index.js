import Cursos from "./clases/Cursos.js";
import Profesor from "./clases/Profesor.js";
import Estudiante from "./clases/Estudiante.js";

//? Imprime los cursos en el dom
function mostrarCursos(curso) {
  const element = document.getElementById("cursos");
  const hijo = document.createElement("div");
  hijo.classList.add("card");

  hijo.innerHTML = `
  <div class="img-container s-ratio-16-9 s-radius-tr s-radius-tl">
    <img src = "${curso.getPoster()}" alt="Poster del curso" >    
  </div>
  <div class="card__data s-border s-radius-br s-radius-bl s-pxy-2">
    <h3 class="t5 s-mb-2 s-center">${curso.getNombre()}</h3>
    <div class="s-center">
    <span>Clases : ${curso.getClases()}</span>
    </div>
  </div>
    `;

  element.appendChild(hijo);
}

const form = document.getElementById("form-cursos");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  const target = e.target;
  const curso = new Cursos(
    target.nombre.value,
    target.poster.value,
    target.cantidad.value
  );
  mostrarCursos(curso);
});

const profe = new Profesor(
  "Ernesto",
  "Bracho",
  "ernestobracho70gmail.com",
  true,
  ["JS", "HTML"],
  20
);
const alumno = new Estudiante("Yaldriani", "Ariza", "yal.ush@gmail.com", true, [
  "Html",
  "Css",
]);

const js = new Cursos("JS", "img/descarga.jpg", 10);

js.setIncristos([...js.getInscritos(), alumno, alumno]);
// los 3 puntos ... es un spreat operator es para obtener lo que exite en un array

//! crear un formulario para usuario (estudiante y profesor)
