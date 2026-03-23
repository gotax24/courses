  <?php require('partials/header.php') ?>

  <h1>Login</h1>

  <form action="/login" method="POST">
    <div>
      <input style="margin-top: 10px;" type="text" name="email" placeholder="email">
    </div>
    <div>
      <input style="margin-top: 10px;" type="text" name="password" placeholder="password">
    </div>
    <div>
      <button style="margin-top: 10px;">Entrar</button>
    </div>
  </form>

  <?php require('partials/footer.php') ?>