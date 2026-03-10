const disponible = {
  100: 3,
  50: 6,
  20: 10,
  10: 50,
  1: 50,
};

const billetes = Object.keys(disponible);

const totalDisponible = () => {
  let total = 0;
  for (let i = 0; i < billetes.length; i++) {
    total += billetes[i] * disponible[billetes[i]];
  }

  return total;
};

const procesar = (monto) => {
  if (monto > totalDisponible() || monto < 0) {
    console.log("Error, no hay suficiente dinero");
    return;
  }

  let saldoARetirar = monto;
  while (saldoARetirar > 0) {
    let contador = 0;
    for (let i = 0; i < billetes.length; i++) {
      contador = calcularBillete(saldoARetirar, billetes[i]);
      console.log(`${contador} billetes de denominacion : ${billetes[i]}`);
      saldoARetirar -= contador * billetes[i];
    }
  }
};

const calcularBillete = (saldoARetirar, denominacion) => {
  let contador = saldoARetirar / denominacion;
  if (contador > disponible[denominacion]) {
    contador = disponible[denominacion];
  }
  disponible[denominacion] -= contador;
  return contador;
};

procesar(-50000);
