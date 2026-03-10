import Usuario from "./Usuario.js";

export default class Profesor extends Usuario {
  constructor(nombres, apellidos, correo, estado, cursosDictado, nota) {
    super(nombres, apellidos, correo, estado);
    (this.cursosDictado = cursosDictado), (this.nota = nota);
  }
}
