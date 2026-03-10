/**Crea una función crearCuentaBancaria que devuelva un objeto con dos métodos: depositar y retirar. Ambos métodos deberían modificar el saldo de la cuenta, pero no deberían permitir que el saldo sea negativo. */

const crearCuentaBancaria = function () {
  let saldo = 0;

  return {
    depositar: (numero) => {
      return (saldo += numero);
    },

    retirar: (numero) => {
      if (numero > saldo) {
        return console.log("No tiene suficiente saldo");
      } else {
        return (saldo -= numero);
      }
    },

    leerSaldo: function () {
      return "Su saldo es: " + saldo;
    },
  };
};

const cuenta = crearCuentaBancaria();

cuenta.depositar(500);

console.log(cuenta.leerSaldo());

cuenta.retirar(400);

console.log(cuenta.leerSaldo());
