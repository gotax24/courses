/**Crea una función crearDescuento que acepte un porcentaje de descuento y devuelva una función que aplique ese descuento a un precio dado. */

const crearDescuento = (descuento) => {
  const decimales = descuento / 100;

  return function (precio) {
    const descuenta = precio * decimales;

    const resultado = precio - descuenta;

    return console.log(resultado);
  };
};

const descuento = crearDescuento(20);
descuento(784);
