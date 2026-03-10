const getNumber = () => {
  let number1 = parseFloat(document.getElementById("number-1").value);
  let number2 = parseFloat(document.getElementById("number-2").value);

  if (isNaN(number1) || isNaN(number2)) {
    alert("algunos de los campos estan erroneos");
    return null;
  }
  return { number1, number2 };
};

const readonly = (result) => {
  const p = document.getElementById("result");

  return (p.innerHTML = result);
};

const plus = () => {
  let numbers = getNumber();
  let result = numbers.number1 + numbers.number2;

  readonly("El resultado es= " + result);
};

const subtraction = () => {
  let numbers = getNumber();
  let result = numbers.number1 - numbers.number2;

  readonly("El resultado " + result);
};

const split = () => {
  let numbers = getNumber();
  let result = numbers.number1 / numbers.number2;

  readonly("El resultado es= " + result);
};

const multiplication = () => {
  let numbers = getNumber();
  let result = numbers.number1 * numbers.number2;

  readonly("El resultado es= " + result);
};

const hider = () => {
  let numbers = getNumber();

  if (numbers.number1 > numbers.number2) {
    readonly(
      "El mayor es = " + numbers.number1 + " y el menor = " + numbers.number2
    );
  } else {
    readonly(
      "El mayor es = " + numbers.number2 + " y el menor = " + numbers.number1
    );
  }
};

const cousin = () => {
  let number = parseFloat(document.getElementById("number-1").value);

  if (number <= 1) {
    readonly(`El numero ${number} no es primo `);
  } else if (number === 2 || number === 3) {
    readonly(`El numero ${number} es primo `);
  } else if (number % 2 === 0 || number % 3 === 0) {
    readonly(`El numero ${number} no es primo `);
  } else {
    for (let i = 5; i * i <= number; i += 6) {
      if (number % i === 0 || number % (i + 2) === 0) {
        readonly(`El numero ${number} no es primo ${i} `);
      }
    }

    readonly(`El numero ${number} es primo  `);
  }
};

const fac = () => {
  let number = parseFloat(document.getElementById("number-1").value);
  let result = 1;

  for (let i = 1; i <= number; i++) {
    result *= i;
  }

  readonly(`El factorial de ${number} es ${result}`);
};

const par = () => {
  let number = parseFloat(document.getElementById("number-1").value);

  if (number % 2 === 0) {
    readonly(`El ${number} es par`);
  } else {
    readonly(`El ${number} es impar`);
  }
};

//--------------------------------------------------------------------------------------------------------------------------------------------------------------

const result = (text) => {
  let result = document.getElementById("result-2");

  return (result.innerHTML = text);
};

const reverse = () => {
  let text = document.getElementById("text");
  let aray = [];

  for (let i = 0; i < text.value.length; i++) {
    aray.push(text.value[i]);
  }
  let resultado = aray.reverse();

  result(`El resultado es ${resultado}`);
};

let resultado = 0;
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9];

for (let i = 0; i < array.length; i++) {
  resultado += array[i];
}

console.log("El resultado de la suma del array es = " + resultado);

const palindromo = () => {
  let text = document.getElementById("text");
  let array = [];
  let reverso = [];

  for (let i = 0; i < text.value.length; i++) {
    array.push(text.value[i]);
  }

  let letra1 = JSON.stringify(array);

  reverso.push(array.reverse());
  let letra2 = JSON.stringify(reverso[0]);

  if (letra1 === letra2) {
    result(`La palabra ${text.value.bold()} es un Palíndromo `);
  } else {
    result(`La palabra ${text.value.bold()} no es un Palíndromo`);
  }
};

const duplicado = () => {
  let text = document.getElementById("text").value;
  let array = [];

  for (let i = 0; i < text.length; i++) {
    array.push(text[i]);
  }

  const sinDuplicados = Array.from(new Set(array));
  result(`El resultado sin duplicados es ${sinDuplicados}`);
};

const ordenar = () => {
  let text = document.getElementById("text").value;
  let array = [];

  for (let i = 0; i < text.length; i++) {
    array.push(text[i]);
  }

  array.sort();

  result(`El resultado ya ordenados es = ${JSON.stringify(array)}`);
};

const contador = () => {
  let text = document.getElementById("text").value;

  const palabras = text.split(/\s+/).filter((palabra) => palabra !== "");

  result(
    `La cantidad de palabras es = ${palabras.length} y la cantidad de letras ${text.length}`
  );
};

// Programa para generar la serie de Fibonacci hasta n términos
const numero = 10;
let n1 = 0,
  n2 = 1,
  siguienteTermino;
console.log("Serie de Fibonacci:");
for (let i = 1; i <= numero; i++) {
  console.log(n1);
  siguienteTermino = n1 + n2;
  n1 = n2;
  n2 = siguienteTermino;
}

// Función para imprimir un árbol de Navidad
const printTree = (height) => {
  for (let i = 0; i < height; i++) {
    let stars = "*".repeat(2 * i + 1); // Genera la línea de estrellas
    let spaces = " ".repeat(height - i - 1); // Genera los espacios necesarios
    console.log(spaces + stars + spaces); // Imprime la línea con espacios y estrellas
  }

  // Agrega el tronco del árbol
  let trunk = " ".repeat(height - 1) + "*" + " ".repeat(height - 1);
  console.log(trunk);
};

// Llamar a la función para imprimir un árbol de altura 5
printTree(10);

document.getElementById("button").addEventListener("click", () => {
  event.preventDefault();

  let nombre = document.getElementById("nombre").value;
  let apellido = document.getElementById("apellido").value;
  let edad = parseInt(document.getElementById("edad").value);
  let profesion = document.getElementById("profesion").value;

  const person = {
    name: nombre,
    lastName: apellido,
    age: edad,
    profession: profesion,
  };

  let see = document.getElementById("see");

  see.innerHTML = `La persona agregada: 
  Nombre: ${person.name}
  Apellido: ${person.lastName}
  Edad: ${person.age}
  Profesion: ${person.profession}`;
});
