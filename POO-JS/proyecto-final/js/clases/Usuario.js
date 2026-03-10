export default class Usuario {
  constructor(nombres, apellidos, correo, estado) {
    (this.nombres = nombres),
      (this.apellidos = apellidos),
      (this.correo = correo),
      (this.estado = estado);
  }

  presentarse() {
    return `Hola mi nombre es ${this.nombres} ${this.apellidos} y este es mi correo${this.correo}`;
  }

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
