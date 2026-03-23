<?php

namespace App\Controllers;

use App\Models\Task;

class HomeController
{
  public function show()
  {
    $name = "Ernesto";
    $tareasCompletas = Task::where('completed', true)->get();
    $tareasIncompletas = Task::where('completed', false)->get();

    return view('index', [
      'name' => $name,
      'tareasCompletas' => $tareasCompletas,
      'tareasIncompletas' => $tareasIncompletas
    ]);
  }
}
