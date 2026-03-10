//Objetos litelares
const alumno = {
  //Atributos del objeto
  nombres: "Ernesto Jose",
  apellidos: "Bracho R",
  edad: 24,
  padre: {
    nombre: "Ernesto Bracho C",
    edad: 59,
  },

  //Metodos del objetos
  presentarse() {
    //Para usar los atributos del objetos se utiliza this
    console.log(
      `Hola mi nombre es ${this.nombres} ${this.apellidos} y tengo ${this.edad} años`
    );
  },
  quienEsTuPadre() {
    console.log(
      `Mi Padre es ${this.padre.nombre} y su edad es ${this.padre.edad}`
    );
  },
};

//agregar un atributo al objeto
alumno.genero = "masculino";

//Para cambiar el valor de un atributo
alumno.edad = 25;

//Para llamar a un metodo del objeto
alumno.presentarse();
alumno.quienEsTuPadre();

// funcion contructora para contruir un molde de un objeto
function User(nombres, apellidos, correo, estado) {
  (this.nombres = nombres),
    (this.apellidos = apellidos),
    (this.correo = correo),
    (this.estado = estado);
}

const a = new User("Ernesto", "Bracho", "ernesto@gail.com", true);
console.log(a);

//clases es lo mismo de arriba pero con clases
class Usuario {
  constructor(nombres, apellidos, correo, estado) {
    (this.nombres = nombres),
      (this.apellidos = apellidos),
      (this.correo = correo),
      (this.estado = estado);
  }

  //!metodo
  presentarse() {
    return `Hola mi nombre es ${this.nombres} ${this.apellidos} y este es mi correo${this.correo}`;
  }

  //!metodo getter y setter
  // GET -> Obtener
  // SET -> Dar
  // es una buena practicar tener metodos para obtener datos del objetos
  getNombres() {
    return this.nombres;
  }

  getApellidos() {
    return this.apellidos;
  }

  setApellidos(nApellidos) {
    this.apellidos = nApellidos;
  }
}

//estas son instacias del objetos
const b = new Usuario("Ernesto", "Bracho", "ernesto@gmail.com", true);
console.log(b);

b.setApellidos("Bracho Ragno");

console.log(b.presentarse());
console.log(`${b.getApellidos()}  ${b.getNombres}`);

//! Herencia
class Profesor extends Usuario {
  constructor(nombres, apellidos, correo, estado, cursosDictado, nota) {
    super(nombres, apellidos, correo, estado);
    (this.cursosDictado = cursosDictado), (this.nota = nota);
  }
}

class Alumno extends Usuario {
  constructor(nombres, apellidos, correo, estado, cursosTomados) {
    super(nombres, apellidos, correo, estado);
    this.cursosTomados = cursosTomados;
  }
}

const c = new Profesor("Ernesto", "Bracho", "ernesto@gmail.com", true, "JS y GG" , 10)
const d = new Alumno("Yal", "Ariza", "ernesto@gmail.com", true, "HTML y CSS")

console.log(c)
console.log(d)