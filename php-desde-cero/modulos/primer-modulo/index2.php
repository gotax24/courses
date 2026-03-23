<?php
//Para concatenar string es con un .

//tipos de datos
$name = 'Yal'; //string 
$quantity = 14; //integer
$price = 9.99; //float
$paymentStatus = true; //bool
$startDate    =   null; //null

//para escribir variables dentro de un string
echo "Hola {$name}";

echo "  Hola mundo soy " . $name . "  ";
var_dump($quantity);
var_dump($name);

$taskCompleted = true;

if ($taskCompleted) {
  echo "Tarea completada";
} else {
  echo "Tarea incompleta";
}

$price = 10.50;

if ($price > 10) {
  echo 'No Comprar';
} else {
  echo 'Comprar';
}

$names = [
  'Luis',
  'Jesus',
  'Ernesto',
  'Pedro',
];

$ages = [
  22,
  18,
  17,
  20,
];

//array asociativos
$players = [
  'portero' => 'Bravo',
  'Goat' => 'Messi',
  'Entrenador' => 'Ernesto Bracho'
];

$players2 = [
  'Porteros' => [
    'Portero 1',
    'Portero 2',
    'Portero 3',
  ],
  'Goat' => 'Messi'
];


echo $players['Goat'];
echo $players2['Porteros'][2]; //tambien se puede hacer al reves

$itemsNumber = count($names);

for ($i = 0; $i < $itemsNumber; $i++) {
  echo $i . " ";
  echo $names[$i] . "<br>";
}

//primero el array 
//segundo es el indice
//tercero el valor del items
foreach ($names as $key => $nam) {
  echo $nam;
}

//si no se usa el index 
foreach ($ages as $value) {
  echo $value;
}

//die mata los procesos tardes
function dd($value) {
  return die(var_dump($value));
}

//dd($name);

echo '<br><br>';

$tasks = [
  [
    'title' => 'Hola',
    'completed' => true
  ],
  [
    'title' => 'perra',
    'completed' => false
  ]
];

$tareasCompletas = array_filter($tasks, function($task){
  return $task['completed'];
});

$tareasIncompletas = array_filter($tasks, function ($task) {
  return !$task['completed'];
});

echo '<h2>Tareas completas</h2>';
foreach($tareasCompletas as $tarea){
  echo $tarea['title'];
}
echo '<h2>Tareas incompleta</h2>';
foreach($tareasIncompletas as $tarea){
  echo $tarea['title'] ;
}

//muestra el mensaje y termina el script ahi no sigue avanzando
die('hola');
