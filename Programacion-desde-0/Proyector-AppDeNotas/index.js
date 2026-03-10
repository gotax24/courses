const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

let notes = [];

//Create
function create() {
  rl.question("Escribe tu nota: ", function (note) {
    notes.push(note);
    console.log("Nota agregada correctamente");
    menu();
  });
}

//Read
function read() {
  console.log("Este es tu listado de notas: ");
  for (let i = 0; i < notes.length; i++) {
    console.log(i + 1, notes[i]);
  }
  menu();
}

//Update
function update() {
  rl.question("Que nota quieres cambiar: ", function (number) {
    rl.question("Escribe la nueva nota: ", function (text) {
      notes[number - 1] = text;
      menu();
    });
  });
}
 
//Delete
function erase() {
  rl.question("Cual nota quieres eliminar: ", function (number) {
    let newNotes = [];
    for (let i = 0; i < notes.length; i++) {
      if (i != number - 1) {
        newNotes.push(notes[i]);
      }
    }
    notes = newNotes;
    menu();
  });
}

function menu() {
  console.log("Bienvenidos a BrachoNote");
  console.log("Menu de usuario: ");
  console.log("Elige una opcion");
  console.log("1. Crea una nota");
  console.log("2. Ver todas las notas");
  console.log("3. Editar una nota");
  console.log("4. Eliminar una nota");
  console.log("5. Salir de la app");

  rl.question("Escribe el numero de elegir ", function (number) {
    switch (number) {
      case "1":
        create();
        break;
      case "2":
        read();
        break;
      case "3":
        update();
        break;
      case "4":
        erase();
        break;
      case "5":
        console.log("Hasta luego");
        rl.close();
      default:
        console.log("Error, opcion incorrecta");
        menu()
        break;
    }
  });
}

menu();
