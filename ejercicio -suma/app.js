let resultado = document.getElementById("result");
const sum = () => {
  let numberA = parseFloat(document.getElementById("numberA").value);
  let numberB = parseFloat(document.getElementById("numberB").value);
  return (resultado.value = numberA + numberB);
};

const res = () => {
  let numberA = parseFloat(document.getElementById("numberA").value);
  let numberB = parseFloat(document.getElementById("numberB").value);
  return (resultado.value = numberA - numberB);
};

const div = () => {
  let numberA = parseFloat(document.getElementById("numberA").value);
  let numberB = parseFloat(document.getElementById("numberB").value);
  return (resultado.value = numberA / numberB);
};

const mult = () => {
  let numberA = parseFloat(document.getElementById("numberA").value);
  let numberB = parseFloat(document.getElementById("numberB").value);
  return (resultado.value = numberA * numberB);
};
