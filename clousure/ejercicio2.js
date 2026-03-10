/**Crea una función saludoPersonalizado que acepte un nombre como argumento y devuelva una función que, cuando se invoque, salude usando ese nombre. */

const saludar = function(){
    const msj = 'Hola '

    return function(nombre){
        return console.log(msj + nombre)
    }
}

const saludo = saludar()

saludo('Ernesto')