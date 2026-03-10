const convertir = () => {
  let number = parseFloat(document.getElementById("masa").value);

  let unidad1 = document.getElementById("unidad1");
  let unidad1Value = parseFloat(unidad1.value);

  let unidad2 = document.getElementById("unidad1");
  let unidad2Value = parseFloat(unidad2.value);

  let span = document.getElementById("resultado");
  let resultado = 0;
  
  if (unidad1Value > unidad2Value) {
    resultado = number / unidad2Value;

    span.innerHTML = resultado;
  } else {
    resultado = number * unidad2Value;

    span.innerHTML = resultado;
  }
};
