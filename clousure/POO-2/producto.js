export default class producto {
  constructor(nombre, precio, categoria) {
    this.nombre = nombre;
    this.precio = precio;
    this.categoria = categoria;
  }

  getNombre() {
    return this.nombre;
  }

  getPrecio() {
    return this.precio;
  }

  getCategoria() {
    return this.categoria;
  }

  setNombre(nNombre) {
    this.nombre = nNombre;
  }
  
  setPrecio(nPrecio) {
    this.precio = nPrecio;
  }

  setCategoria(nCategoria) {
    this.categoria = nCategoria;
  }
}
