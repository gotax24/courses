let array = [];

const getData = () => {
  let tarea = document.getElementById("tarea").value;

  return tarea;
};

const reset = () => {
  document.getElementById("tarea").value = "";
  document.getElementById("text").value = "";
  document.getElementById("indexEditar").value = "";
  document.getElementById("indexEliminar").value = "";
};

const agregar = () => {
  let tarea = getData();

  if (tarea === "") {
    alert("El texto esta vacio");
  } else {
    array.push({ text: tarea, completed: false });
  }

  leer();
  reset();
};

const leer = () => {
  let lista = document.getElementById("lista");

  lista.innerHTML = "";

  for (let i = 0; i < array.length; i++) {
    lista.innerHTML += `<li>
        <input type="checkbox" id="check${i}" ${
      array[i].completed ? "checked" : ""
    } onclick="toggleCompleted(${i})">
        <span ${
          array[i].completed ? 'style="text-decoration: line-through;"' : ""
        }>${array[i].text}</span>
      </li>`;
  }
  console.log(array);
};

const toggleCompleted = (index) => {
  array[index].completed = !array[index].completed;
  leer();
};

const creacionInput = (id, placeholder, type) => {
  let index = document.getElementById(id) || document.createElement("input");
  index.id = id;
  index.placeholder = placeholder;
  index.type = type;

  return index;
};

const creacionButton = (text, id) => {
  let confirm = document.getElementById(id) || document.createElement("button");
  confirm.textContent = text;
  confirm.id = id;

  return confirm;
};

const editar = () => {
  let input = creacionInput(
    "indexEditar",
    "Numero que desea cambiar",
    "number"
  );
  let text = creacionInput("text", "Cambio", "text");

  let button = creacionButton("Confirmar cambio", "confirmarEditar");

  let span = document.getElementById("editarNuevo");
  if (input) span.appendChild(input);
  if (text) span.appendChild(text);
  if (button) {
    span.appendChild(button);

    button.addEventListener("click", () => {
      let index = parseInt(document.getElementById("indexEditar").value) - 1;
      if (index < 0 || index >= array.length) {
        alert("El numero no existe");
      } else {
        array[index].text = text.value;
        leer();
        reset();
      }
    });
  }
};

const eliminar = () => {
  let input = creacionInput(
    "indexEliminar",
    "Numero que desea eliminar",
    "number"
  );
  let button = creacionButton("Confirmar eliminacion", "confirmarEliminar");

  let span = document.getElementById("eliminarNuevo");
  if (input) span.appendChild(input);
  if (input) {
    span.appendChild(button);

    button.addEventListener("click", () => {
      let index = parseInt(document.getElementById("indexEliminar").value) - 1;
      if (index < 0 || index > array.length) {
        alert("El numero no existe");
      } else {
        array.splice(index, 1);
      }
      leer();
      reset();
    });
  }
};
