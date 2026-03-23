<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <h1>Hola <?= $name; ?></h1>

  <nav>
    <a href="contact.php">Contacto</a>
    <a href="about.php">Nosotros</a>
    <a href="services.php">Servicios</a>
  </nav>

  <h2>Completas</h2>
  <ul>
    <?php foreach ($tareasCompletas as $tarea): ?>
      <li style="color: <?= $tarea->color ?>;">
        <?= $tarea->title ?>
        <form  style="display: inline;" action="/toggle-task.php" method="POST">
          <input type="hidden" name="completed" value="0">
          <input type="hidden" name="id" value="<?= $tarea->id ?>">
          <button>✔</button>
        </form>
        <form onsubmit="return confirm('Estas seguro de eliminar la tarea');" style="display: inline;" action="/delete-task.php" method="POST">
          <input type="hidden" name="id" value="<?= $tarea->id ?>">
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
        <form style="display: inline;" action="/toggle-task.php" method="POST">
           <input type="hidden" name="completed" value="1">
          <input type="hidden" name="id" value="<?= $tarea->id ?>">
          <button>👀</button>
        </form>
        <form onsubmit="return confirm('Estas seguro de eliminar la tarea');" style="display: inline;" action="/delete-task.php" method="POST">
          <input type="hidden" name="id" value="<?= $tarea->id ?>">
          <button>eliminar</button>
        </form>
      </li>
    <?php endforeach ?>
  </ul>

  <form action="/create-task.php" method="POST">
    <input type="text" name="title">
    <input type="color" name="color">
    <input type="radio" name="completed">
    <button type="submit">Guardar</button>
  </form>
</body>

</html>