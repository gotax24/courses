<?php
require_once __DIR__ . '/Model.php';

#[AllowDynamicProperties]

class Task extends Model
{
  /**
   * public function __constructor(
   * public $title,
   * public $complete = false
   * ){}
   */

  public function complete()
  {
    $this->completed = true;
  }

  public function setColor($color)
  {
    $this->color = $color;
  }
}


