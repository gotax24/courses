const list = [];

const newTask = (title, dueDate) => {
  return {
    title: title,
    dueDate: dueDate,
    done: false,
  };
};

const createTask = () => {
  const title = prompt("Digite el titulo de la tarea");
  const dueDate = prompt("digite la fecha de la tarea");
  return newTask(title, dueDate);
};

const getIDTask = () => {
  const id = parseInt(prompt("Digite el ID de la tarea"), 10);
  if (isNaN(id)) {
    id = 0;
  } else if (id < 0) {
    id = 0;
  }

  return id;
};

const getIsDone = () => {
  const isDone = parseInt(
    prompt("Digite uno si ya esta hecho cualquier otro numero")
  );
  if (isDone === 1) {
    return true;
  }

  return false;
};

const processDeleteTask = () => {
  const id = getIDTask();
  if (id === 0 || id > list.length) {
    alert("Numero no valido");
    return;
  }

  list.splice(id - 1, 1);//splice metodo para borrar elementos del array
  print(list)
};

const processCreateTask = () => {
  const task = createTask();
  list.push(task);
  print(list);
};

const processEditTask = () => {
  const id = getIDTask();
  if (id === 0 || id > list.length) {
    alert("Numero no valido");
    return;
  }

  const task = createTask();
  list[id - 1] = task;
  print(list);
};

const processDoneTask = () => {
  const id = getIDTask();
  if (id === 0 || id > list.length) {
    alert("Numero no valido");
    return;
  }

  const isDone = getIsDone();
  list[id - 1].done = isDone;
  print(list);
};

const btnAdd = document.getElementById("btnAdd");
const btnEdit = document.getElementById("btnEdit");
const btnDone = document.getElementById("btnDone");
const btnDelete = document.getElementById("btnDelete");
btnAdd.addEventListener("click", processCreateTask);
btnEdit.addEventListener("click", processEditTask);
btnDone.addEventListener("click", processDoneTask);
btnDelete.addEventListener("click", processDeleteTask);
