function cajero() {
  //Definir variable con saldo
  let saldo = 2000;

  //Bucle para realizar acciones en la cuenta bancaria
  while (true) {
    let opcion = prompt("¿Que desea hacer?\n1.Depositar\n2.Retirar\n3.Salir");

    if (opcion === "3") {
      alert("Hasta luego");
      break;
    }

    //ejecutar la accion correspondiente
    if (opcion === "1") {
      let valor = parseFloat(prompt("Digite el valor a depositar: "));
      saldo += valor;
      alert("Accion realizada correctamente. Saldo: " + saldo);
    } else if (opcion === "2") {
      let valor = parseFloat(prompt("Digite el valor a retirar :"));
      if (valor > saldo) {
        alert("No se puede realizar esa operacion. Saldo:" + saldo);
      } else {
        saldo -= valor;
        alert("Accion realizada correctamente. Saldo:" + saldo);
      }
    } else {
      alert("Opcion invalida");
    }
  }
}