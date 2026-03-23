<?php

namespace App\Controllers;

use App\Core\Auth;

class AuthController
{

  public function show()
  {
    view('login-form');
  }

  public function login()
  {
    Auth::tryLogin($_POST['email'], $_POST['password']);

    if (Auth::check()) {
      redirect('/');
      exit();
    }

    redirect('/login-form');
    exit();
  }

  public function logout()
  {
    Auth::logout();

    redirect('/login-form');
    exit();
  }
}
