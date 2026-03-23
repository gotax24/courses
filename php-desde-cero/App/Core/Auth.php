<?php

namespace App\Core;

use Users;

class Auth
{
 public static function tryLogin($email, $password)
  {
    $user = Users::where('email', $email)->first();
    if (!empty($user) && password_verify($password, $user->password)) {
      $_SESSION['email'] = $user->email;
      $_SESSION['name'] = $user->name;
      $_SESSION['id'] = $user->id;

      return true;
    }
    return false;
  }

  public static function check()
  {
    return !empty($_SESSION['id']);
  }

  public static function ifSessionStart()
  {
    if (empty(session_id())) {
      return session_start();
    }
  }

  public static function logout(){
    session_start();
    session_destroy();
  }
}
