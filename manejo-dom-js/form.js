const user = document.getElementById("username");

user.addEventListener("click", saludar);

//user.onclick = saludar //para agregar eventos pero ya no se utiliza (se asigna la funcion sin parentesis porque si no se ejecuta)

function saludar() {
  const p = document.createElement("p");
  const form = document.getElementById("formulario");
  p.innerText = "esto esta creado por un click";
  form.appendChild(p);
  user.removeEventListener('click', saludar) //para eliminar un evento listener
}
