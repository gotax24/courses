<?php

namespace App\Controllers;

use App\Core\App;
use App\Models\Task;

class TaskController
{
  public function create()
  {
    App::get('database')->create('task', [
      'title' => $_POST['title'] ?? 'Sin titulo',
      'color' => $_POST['color'] ?? '#ea7676ec',
      'completed' => $_POST['completed'] ?? 0
    ]);


    return redirect('/');
  }

  public function toggle($taskId)
  {
    $task = Task::find($taskId);
    $task->update([
      'completed' => $_POST['completed']
    ]);

    return redirect('/');
  }

  public function delete($taskId)
  {
    $task = Task::find($taskId);
    $task->delete();

    return redirect('/');
  }
}
