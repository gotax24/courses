/**Crea una función crearListaDeTareas que devuelva un objeto con dos métodos: agregarTarea y mostrarTareas. Cada tarea que se agregue debe almacenarse en un array privado, y mostrarTareas debe imprimir todas las tareas.. */

const crearListaDeTareas = () => {
  const tareas = [];

  return {
    agregarTareas: function (tarea) {
      tareas.push(tarea);

      return tareas;
    },

    mostrarTareas: function () {
      return console.log(tareas);
    },
  };
};

const tarea = crearListaDeTareas()

tarea.agregarTareas('Hacer este ejercicio')
tarea.mostrarTareas()