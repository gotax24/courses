import Usuario from "./Usuario.js";

export default class Alumno extends Usuario {
  constructor(nombres, apellidos, correo, estado, cursosTomados) {
    super(nombres, apellidos, correo, estado);
    this.cursosTomados = cursosTomados;
  }
}
