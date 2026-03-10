const user = {
  nombre: "Yaldriani",
  edad: 23,
  dedua: 0,
};

let request = [];
let costRequest = 0;

const showMenu = () => {
  console.log(`CODIGO - NOMBRE PRODUCTO - PRECIO`);
  //una forma de escribir for para los array solamente
  for (let e of product) {
    console.log(`${e.codigo} - ${e.producto} - $${e.precio}`);
  }
};

const pickProduct = (cod) => {
  if (typeof cod === "boolean" || typeof cod === "number" || !cod)
    return "Ingrese una cadena de texto";

  const search = products.find((e) => e.codigo === cod);
  if (!search) return "El producto no existe";

  request.push(search);
  console.log("Su podructo fue agregado a su pedido. Su pedido es: ");
  return seeRequest();
};

const seeRequest = () => request;

const calculateCost = () => {
  let cost = 0;

  for (e of request) {
    cost += e.precio;
  }
  costRequest = cost;

  return costRequest;
};

const finalizarPedido = () => {
  calculateCost();
  user.dedua = costRequest;

  request = [];
  costRequest = 0;

  return `${user.nombre}, debes pagar $${user.dedua} dolares.`;
};

const pagarDeuda = (montoEntregado) => {
  if (typeof montoEntregado === "number") {
    if (montoEntregado < user.dedua) {
      return `No te alcanza para pagar tu pedido`;
    } else if (montoEntregado === user.dedua) {
      user.dedua = 0;
      return `Tu pedido fue cancelado`;
    } else {
      console.log(
        `Tu pedido ha sido cancelado y tu cambio es de $${
          montoEntregado - user.dedua
        }`
      );
			user.deuda = 0
      return "Deuda saldada";
    }
  } else {
    retunr`Dato erroneo, ingrese un numero `;
  }
};
