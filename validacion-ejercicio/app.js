let boton = document.getElementById("validar");
let result = document.getElementById("resultado");
boton.addEventListener("click", () => {
    event.preventDefault()
  let name = document.getElementById("name").value;
  let email = document.getElementById("email").value;
  let passw = document.getElementById("password").value;

  if (name === "" || email === "" || passw === "") {
    if (name === "") {
      alert("EL nombre esta vacio");
    } else if (email === "") {
      alert("El correo esta vacio");
    } else {
      alert("La contraseña esta vacia");
    }
  } 
  return result.innerHTML = "Excelente ya se envio el formulario"
  
});
