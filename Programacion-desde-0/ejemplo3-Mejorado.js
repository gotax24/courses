let balance = 2000;

function deposit(value) {
  balance += value;
  return true;
}

function withdraw(value) {
  if (value > balance) {
    return false;
  }
  balance -= value;
  return true;
}

function performAction(action) {
  if (action === "1") {
    let value = parseInt(prompt("Digite el valor a depositar"));
    return deposit(value);
  }

  if (action === "2") {
    let value = parseInt(prompt("Digite el valor a retirar"));
    return withdraw(value);
  }

  return false;
}

function main() {
  while (true) {
    let action = prompt("¿Que desea hacer?\n1.Depositar\n2.Retirar\n3.Salir");
    if (action === "3") {
      break;
    }

    let result = performAction(action);
    if (result === false) {
      alert("La accion no se pudo realizar");
    } else {
      alert("Accion realizada, nuevo saldo = " + balance);
    }
  }
}
