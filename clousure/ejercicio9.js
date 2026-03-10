//**Crea una función crearLibro que acepte un título de libro y autor. Devuelve un objeto que tiene dos métodos: getInfo y cambiarTitulo. El método getInfo debe devolver el título y el autor del libro, mientras que cambiarTitulo debería permitir modificar el título. */

const crearLibro = (titulo, autor) => {
  const biblioteca = {
    titulo,
    autor,
  };

  return {
    getInfo: () => {
      return "Autor: " + biblioteca.autor + " Titulo: " + biblioteca.titulo;
    },

    cambiarTitulo: (tituloNew) => {
      biblioteca.titulo = tituloNew;
    },
  };
};

const libro = crearLibro('Como hacer dinero', 'Ernesto Bracho')
console.log(libro.getInfo())
libro.cambiarTitulo('Como cambiar tu vida')
console.log(libro.getInfo())
