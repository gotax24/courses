// Comentario de una linea se considera una buena practica dejar un espacio

// Comentario de bloque
// lo que puede hacer varias
// lineas ctrl+k+c asi se hace automatico

/**hay tres tipos de datos
 * numbre = numero enteros y decimales
 * string = cualquier texto y " " <= y esto tambien se considera un string pero vacio
 * boolean = true y false ya sabemos para que funciona
 */

//Arreglo : los arreglo tienen indice y valor
let a = ["jose", "Juan", "Yal"];

//Objeto : los objetos tienen atributos y valor
let b = {
  nombre: "Ernesto",
  apellido: "Bracho",
};

let valor = typeof 50; //typeof es un operador que permite saber de que tipo es la variable
console.log(valor);

// null o nulo significa que no existe el dato

// Asignacion
let c = "hola";

// Reasignacion
c = "gg";

//Asignacion por referencia osea una variable es igual a otra
let d = c;

// Cosntante son valores fijos como nombres fecha de nacimiento nacionalidad etc
// Por buenas practicas las constante se declara en snake case como el ejemplo
const NOMBRE_PERSONA = "Ernesto";

//para hacer potencia es doble astericos **

//template string se usa para escribir string con variables con opeciones variables etc se representa con (` `)

let template = `hola mi nombre es: ${NOMBRE_PERSONA} `;

console.log(template);

/*
Signo de comparacion
== es igual a (compara solo valor)
=== es identico a (Compara valor y tipo)
!= diferente que
!== exactamente diferente 
(Con los comparadores de arriba se puede comparar taanto valores como string )

*/

//Operadores ternarios  ahi lo que hace es preguntar si es true o false con el simbolo ? al siguiente es el valor que debe tomar g si es verdad
// si no lo es hace lo que esta despues de :

let e = 10;
let f = 20;

let g = e < f ? "Es verdadd" : "Es falso ";

// NaN => not a number significa que no es un numero

//FUNCIONES
//declarar funcioon
function saludar() {
  console.log("Hola, buenos dias");
}

//llamado a la funcion
saludar();

//Funciones con parametro
function saludarConNombre(nombre) {
  if (typeof nombre === "string") {
    console.log(`Hola ${nombre}, buenos dias`);
  } else {
    console.log("Eso no es un nombre");
  }
}

saludarConNombre("Raul");

// funciones con retorno cuando se retorna la funcion se convierte en un dato
function nombreCompleto(nombre, apellido) {
  let nombreCompleto = `${nombre}  ${apellido}`;
  return nombreCompleto;
}

nombreCompleto("Ernesto", "Bracho");

//funciones de primera clase
//Seria una funcion dentro de una variable

let nombreConApellido = nombreCompleto("Rosme", " Pirela");

console.log(nombreConApellido);

//funciones anonima
let suma = function (a, b, c) {
  return a + b + c;
};

let resultado = suma(4, 5, 4);

console.log(resultado);

//autollamar una funcion es con parentesi

/*
(function (a , b , c){
  console.log( a + b+ c )
}(4,5,4)) ya no se usa
*/

//funciones como constante
//las funciones deben ser constante
const resta = function (a, b, c) {
  return a - b - c;
};

let resultado1 = resta(10, 20, 30);

console.log(resultado1);

//funciones de flechas
// no es necesario poner el return ya que lo hace solo, ya por defecto ratorna un valor
const sumar = (a, b) => a + b;
const restar = (a, b) => a - b;

console.log(sumar(74, 6));

// si al funcion recibe un parametro se puede borrar los parentesis , si no tinene
const saludo = (nombre) => `hola ${nombre} , buenos dias `;

console.log(saludo("Ernesto"));

// si se necesita poner mas de una linea de codigo

//Arrays
let amigos = ["Randy", "Martin", "Erick"];
console.log(amigos);

//agregar datos
amigos.push("otto");
console.log(amigos);

//quitar el ultimo elemento y no necesita dato
amigos.pop();
console.log(amigos);

//partir el array en dos array, genera un nuevo arreglo y lo guarda un variable
let particion = amigos.slice(0, 2);
console.log(amigos);
console.log(particion);

// for vs forEach
for (let i = 0; i < amigos.length; i++) {
  console.log(amigos[i]);
}

// el forEach necesita como parametro una funcion,
// un dato es que forEach no devuelve ningun elemento solo se usa para hacele algo a los elementos (mostrar modificar etc)

amigos.forEach((amigo) => console.log(amigo));
let dato = amigos.forEach((amigo) => console.log(amigo));
console.log(dato); //indefinido

// metodo map
//El metodo map devuelve un array con el resultado del codigo que se puede guardar en una variable
// mantiene el original y devuelve uno nuevo y von el resultado del codigo en este ejemplo es hola amigo

let mapa = amigos.map((amigos) => `Hola ${amigos}`);
console.log(mapa);

//metodo filter
// como dice su nombre funciona como un filtro y lo guarda en un array nuevo el resultado
let numeros = [10, 54, 84, 90, 80];

let filtro = numeros.filter((num) => num > 20);
console.log(filtro);

//metodo find
//funciona para encontrar un valor, sin embargo sin embargo siempre sera el primer
//dato que cupla con la condicion y devuelve ese dato
let encontrar = numeros.find((num) => num > 39);
console.log(encontrar);

//metodo includes
//Funciona para encontrar exactamente igual al que se esta buscando
//devuelve un boleano
let verdad = numeros.includes(54);
console.log(verdad);

//metodo some
//funciona para preguntar si al menos uno cumple con una condicion
// funciona para encontrar datos que no van en el array como en este caso string
let preguntar = numeros.some((num) => num < 0);
console.log(preguntar);

//metodo every
// funciona para comparar o validar todos los elementos cumple con una condicion
let preguntar2 = numeros.every((num) => typeof num === "string");
console.log(preguntar2);

//manipulacion de texto
let texto = "Ernesto jose bracho ragno";

let prueba = texto.slice(3, 10); //borra una parte del texto en este caso de la posicion 0 hasta al 2
//primero borra del 0 a 2 y de ahi parte del 10
console.log(prueba);

//funciona para cortar el texto lo que esta adentro del parentesis no lo incluye
//y devuelve un array
// si se hace asi ("") va a separar todo por letra
let prueba2 = texto.split(" ");
console.log(prueba2);

let prueba3 = texto.search(); //funciona para expresiones regulares (investigar)

let prueba4 = texto.toLocaleUpperCase();
console.log(prueba4);

let prueba5 = texto.toLocaleLowerCase();
console.log(prueba5);

let prueba6 = texto.toLowerCase();
console.log(prueba6);

let prueba7 = texto.toUpperCase();
console.log(prueba7);

//Objetos
let alumno = {
  nombre: "Ernesto",
  edad: 24,
  suscriptor: false,
  pais: "chile",
};

//para acceder a un atributo especifico
console.log(alumno.pais)
console.log(alumno["edad"])

//para acceder a todos los valores de mi objeto
let valores = Object.values(alumno)
console.log(valores)

//para saber que atributos tiene mi objeto
let atributos = Object.keys(alumno)
console.log(atributos)

// math y date
// math nos permite tener valores matematicos y date de fecha
const valor1 = Math.random()*10

const valor2 = new Date ()
console.log(valor2)