<?php require('partials/header.php') ?>
<h1>Hola <?= $name; ?></h1>

<h2>Completas</h2>
<ul>
  <?php foreach ($tareasCompletas as $tarea): ?>
    <li style="color: <?= $tarea->color ?>;">
      <?= $tarea->title ?>
      <form style="display: inline;" action="/tasks/toggle/<?= $tarea->id ?>" method="POST">
        <input type="hidden" name="completed" value="0">
        <button>✔</button>
      </form>
      <form onsubmit="return confirm('Estas seguro de eliminar la tarea');" 
      style="display: inline;" action="/tasks/delete/<?= $tarea->id ?>" method="POST">
  
        <button>eliminar</button>
      </form>
    </li>
  <?php endforeach ?>
</ul>
<h2>Incompletas</h2>
<ul>
  <?php foreach ($tareasIncompletas as $tarea): ?>
    <li style="color: <?= $tarea->color ?>;">
      <?= $tarea->title ?>
      <form style="display: inline;" action="/tasks/toggle/<?= $tarea->id ?>" method="POST">
        <input type="hidden" name="completed" value="1">
        <button>👀</button>
      </form>
      <form onsubmit="return confirm('Estas seguro de eliminar la tarea');" 
      style="display: inline;" action="/tasks/delete/<?= $tarea->id ?>" method="POST">
        <button>eliminar</button>
      </form>
    </li>
  <?php endforeach ?>
</ul>

<form action="/tasks/create" method="POST">
  <input type="text" name="title">
  <input type="color" name="color">
  <input type="radio" name="completed">
  <button type="submit">Guardar</button>
</form>

<?php require('partials/footer.php') ?>