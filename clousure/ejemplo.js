const micontador = function () {
  let valor = 0; // Variable cerrada dentro del closure

  return {
    incrementar: function () {
      return ++valor; // Incrementa primero, luego devuelve el valor
    },
    decrementar: function () {
      return --valor; // Decrementa primero, luego devuelve el valor
    },
    leer: function () {
      return valor; // Solo devuelve el valor actual
    },
  };
};

const a = micontador();


const arrow = function(){
  console.log(`Hola mi nombre es ${this.nombre}`)
}

const persona = {
  nombre: 'Ernesto',
  getName: arrow
}

persona.getName()