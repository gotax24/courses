const art3 = document.getElementById("art-3"); //! Para obtener mediante el id
const arts = document.getElementsByClassName("articulo"); //! Para obtener mediante la clase y te regresa un objeto
const articulo = document.getElementsByTagName("article"); //! Para pbtener mediante la etiqueta
const artll = document.getElementsByName(""); //! Para obtener mediante el name del input
const art1 = document.querySelector(".art"); // como el nombre dice funciona para obtener mediante selectores de css
//  me devuelve el primer elemento que encuentre
const artAll = document.querySelectorAll(".art"); // Para obtener todos los elementos con la clase llamada

//-----------------------------------------------------------------------------------------------------------

//para obtener los hijos de una etiqueta
//const div = document.querySelector("galeria"); //guardo el padre en una variable
//div.getElementsByClassName("art"); // desde la variable puedo hacer un getElem....

//Para crear elementos

function newArticle() {
  let div = document.getElementById("galeria");
  let elemento = document.createElement("article");
  const newH2 = document.createElement("h2");
  const newP = document.createElement("p");

  const nodoP = document.createTextNode("Descripcion del articulo 4");

  newH2.innerText = "Titulo del articulo 4"; //para agregar texto
  newP.appendChild(nodoP); //para agregar un nodo

  elemento.id = "art-4";
  elemento.classList.add("articulo");

  elemento.appendChild(newH2);
  elemento.appendChild(newP);

  div.appendChild(elemento);
}
const time = setTimeout(() => {
  alert("hola");
}, 3000);
clearTimeout(time);

screen; //para saber el tamaño de la pantalla

const mycontador = setInterval(newArticle, 2000);
clearInterval(mycontador);
/**
 * prompt para un pop up para recibir informacion
 * confirm como dice el nombre para asegurarse de una accion en la app
 * timeout es para ejecutar una funcion despues de determinado tiempo de intervalo
 */

/*
!Eventos
?onclick 
?onmouseenter cuando el mouse entra 
?onmouseleave cuando el mouse sale
?onmousemove cuando el mouse se mueve
?onchange cuando el elemento cambie
?onkeydown para el teclado cuando se presiona una tecla del mismo
?onscroll cuando la pagina hace scrool hacia arriba o abajo
?onfocus cuando un input esta enfocado
?onsubmit para enviar formulario
*/
