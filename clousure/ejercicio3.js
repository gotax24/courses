/**Escribe una función crearMultiplicador que acepte un número como argumento y devuelva una función que multiplique cualquier número por ese valor. */

//Crear un curry para la multiplicaion
const curry = function(funcion){
    return function(numero1){
        return function(numero2){
            return funcion(numero1,numero2)
        }
    }
}

const multiplicar = (num,num2) =>  {
    return num * num2
}

const crearMultiplicacion = curry(multiplicar)

console.log(crearMultiplicacion(4)(2))