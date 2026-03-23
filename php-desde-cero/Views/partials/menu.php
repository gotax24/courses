<nav>
   <a href="/">Inicio</a>
   <a href="contact">Contacto</a>
   <a href="about">Nosotros</a>
   <a href="services">Servicios</a>
   <?php if (App\Core\Auth::check()): ?>
     <span><?= $_SESSION['name'] ?></span>
     <?php endif ?>
     <form action="/logout" method="POST">
       <button>Salir</button>
     </form>
 </nav>