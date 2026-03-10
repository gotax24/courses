/**Crea una función crearContador que devuelva un objeto con dos métodos: incrementar y leer. El método incrementar debería aumentar un contador privado, y leer debería devolver el valor actual del contador. */

const crearContador = function(){
    let valor = 0

    return {
        incrementar: function(){
            return valor++
        },


        leer: function(){
           return valor
        }
    }
}

const funcion = crearContador()
funcion.incrementar()
funcion.incrementar()
console.log(funcion.leer())