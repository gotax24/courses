/**Crea una función crearContadorConPaso que acepte un número paso y devuelva una función que incremente el contador por ese paso cada vez que se invoque. */

const crearContadorConPaso = (paso) => {
  let contador = paso;

  return function () {
    return (contador += contador);
  };
};

const contador = crearContadorConPaso(5);

console.log(contador());
console.log(contador());
