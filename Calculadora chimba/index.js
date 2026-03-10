const numero1 = document.getElementById("numero1");
const operador = document.getElementById("operador");
const numero2 = document.getElementById("numero2");
const calcular = document.getElementById("calcular");
const pResultado = document.getElementById("pResultado");

function calculadora() {
  const operador2 = operador.value;
  const op1 = parseFloat(numero1.value);
  const op2 = parseFloat(numero2.value);
  if (
    operador2 === "+" ||
    operador2 === "-" ||
    operador2 === "*" ||
    operador2 === "/" ||
    isNaN(op1)||
    isNaN(op2)
  ) {
    let resultado;
    switch (operador2) {
      case "+":
        resultado = op1 + op2;
        break;
      case "-":
        resultado = op1 - op2;
        break;
      case "*":
        resultado = op1 * op2;
        break;
      case "/":
        resultado = op1 / op2;
        break;
    }
    pResultado.innerText = "= " + resultado;
  } else {
    alert("calculo imposible");
  }
}
