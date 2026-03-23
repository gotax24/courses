<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <?php $name = 'Ernesto';
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
  ?>
  <h1>Hola <?= $name; ?></h1>

  <h2>Completas</h2>
  <ul>
    <?php 
      foreach ($tareasCompletas as $key => $value) {
        echo "<li>" . $value['title'] . "</li>";
      }
    ?> 

    <?php foreach ($tareasCompletas as $tarea): ?>
      <li><?= $tarea['title'] ?></li>
      <?php endforeach ?>
    <li>Estudiar</li>
    <li>PHP</li>
  </ul>
  <h2>Incompletas</h2>
  <ul>
    <li>Estudiar</li>
    <li>Nodejs</li>
  </ul>
</body>

</html>