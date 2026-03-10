let boton = document.getElementById("boton");
let resultado = document.getElementById("result");
let contador = 0;

boton.addEventListener("click", () => {
  contador++;
  resultado.innerHTML = contador;
});