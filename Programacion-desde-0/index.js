let edad;

edad = 24; //ejemplo de varaible

console.log("Tu edad es : " + edad);
console.log("El siguiente año vas a tener : ", edad + 1);

// Operadores

// se puede hacer

let alumnos = 27;
alumnos = alumnos + 1; //se puede cambiar el valor de esta forma o
alumnos += alumnos; //aqui se le dice que sume otra vez alumnos es decir alumnos + alumnos

console.log(alumnos);

/* 
&& AND , Y
|| OR , O
*/
let descuento;
let pais = "Argentina";

switch (pais) {
  case "Argentina":
    descuento = 10;
    break;
  case "Bolivia":
    descuento = 30;
    break;
  case "Peru":
    descuento = 20;
    break;
}

console.log(descuento);
console.log("................................................................................")

//-------------------------------------------

// for(variable; condicion ; incremento){
//     //lo que tiene que hacer
// }



for(let tabla = 1 ; tabla <= 12 ; tabla++){
    for(let num = 1 ; num <= 12; num++){
        const resultado = tabla + " x " + num + " = " + tabla * num;
        console.log(resultado)
    }
}
console.log("-----------------------------------------------------------------------------")
for (let num = 0 ; num < 10 ; num++){
    if(num % 2 == 0){
        console.log(num)
    }
}

console.log("...............................................................................")

let edad1 = 0;
while(edad1 < 18){
  console.log("eres un niño");
  edad1++ //Esta liena es la importante
}

console.log("Ya eres un adulto");
console.log("---------------------------------------------------------------------------------")

let abecedario = ["a","b","c","d"]

//abecedario.push()//para agregar un elemento
//abecedario.shift()//para eleminiar el primer elemento
//abecedario.pop()//para eleminar el ultimo elemento

for(let i = 0; i < abecedario.length;i++){
console.log(abecedario[i])
}
console.log("---------------------------------------------------------------------------------")
abecedario.forEach( e => console.log(e)) //aqui se le dice que los elementos se van a llamar e y por cada elemento me imprima la e (IMPORTANTE)

console.log("-----------------------------------------------------------------------------------------")

function saludarSinParametro(){
  console.log("Hola comunidad EDteam")
}

function saludarConParametro(nombre){
  console.log("Hola " + nombre + " bienvenido" );
}
let nombre = "Ernesto"

saludarSinParametro();
saludarConParametro(nombre);

console.log("-----------------------------------------")

function suma(a, b){
  return a + b
}

let resultado = suma(3,4);

console.log(resultado);

console.log("--------------------------------------------------------------")

function mayor(a ,b){
  if(a > b){
    return a
  }
  return b
}

let respuesta = mayor(20,10);
let resultado1 = mayor(respuesta, 15)
let resultado2 = mayor (resultado1, 25)

 console.log(resultado2);