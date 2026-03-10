import producto from "./producto.js";

class tienda extends producto {
  constructor(nombre, precio, categoria) {
    super(nombre, precio, categoria);
    this.tienda = [];
  }

  agregarTienda(producto) {
    this.tienda.push(producto);
  }

  mostrarTodo(producto) {
    const div = document.getElementById("resultado");
    const ul = document.createElement("ul");

    ul.innerHTML += `
        <li>
            Nombre: ${producto.getNombre()} <br>
            Precio: ${producto.getPrecio()} <br>
            Categoria: ${producto.getCategoria()} <br>
        </li>`;

    div.appendChild(ul);
  }

  mostrarCategoria(buscar) {
    const div = document.getElementById("cate");
    const ol = document.createElement("ol");

    if (buscar === "") {
      alert("El campo esta vacio");
      return;
    }

    const encontrar = this.tienda.filter((producto) => {
      return producto.getCategoria().toLowerCase() === buscar.toLowerCase();
    });
    console.log(this.tienda);
    console.log(encontrar);

    if (encontrar.length === 0) {
      ol.innerHTML += `<li>No se encontraron productos en la categoría "${buscar}".</li>`;
    } else {
      encontrar.forEach((producto) => {
        ol.innerHTML += `
          <li>
              Nombre: ${producto.getNombre()} <br>
              Precio: ${producto.getPrecio()} <br>
              Categoria: ${producto.getCategoria()} <br>
          </li>`;
      });
    }

    div.appendChild(ol);
  }
}

document.getElementById("ver").addEventListener("click", (e) => {
  let nombre = document.getElementById("nombre").value;
  let precio = parseFloat(document.getElementById("precio").value);
  let categoria = document.getElementById("categoria").value;
  const buscar = document.getElementById("search").value;

  e.preventDefault();

  const miTienda = new tienda();

  const nuevoProducto = new producto(nombre, precio, categoria);

  miTienda.agregarTienda(nuevoProducto);
  miTienda.mostrarTodo(nuevoProducto);
  
  if(buscar !== ' '){

    miTienda.mostrarCategoria(buscar);
  }
});

document.getElementById("buscar").addEventListener("click", (e) => {
  e.preventDefault();

  const buscar = document.getElementById("search").value;

  const miTienda = new tienda();

  miTienda.agregarTienda()
  miTienda.mostrarCategoria(buscar);
});
