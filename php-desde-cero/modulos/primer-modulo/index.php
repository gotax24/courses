<?php
$name = 'Ernestor';
$tasks = [
  [
    'title' => 'Hola',
    'completed' => true,
  ],
  [
    'title' => 'perra',
    'completed' => false,
  ]
];

$tareasCompletas = array_filter($tasks, function ($task) {
  return $task['completed'];
});

$tareasIncompletas = array_filter($tasks, function ($task) {
  return !$task['completed'];
});

require 'index.view.php';