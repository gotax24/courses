/**Crea una función crearMensaje que acepte un mensaje inicial y devuelva una función que, cuando se invoque con un nuevo mensaje, concatene el mensaje inicial con el nuevo mensaje. */

const crearMensaje = function () {
  const frase = " te voy a decir la verdad te quiero cojer";

  return function (mensaje) {
    return mensaje + frase;
  };
};

const mensaje = crearMensaje();

console.log(mensaje('Yaldriani'));
