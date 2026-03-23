<?php
require 'Model.php';

class Exam extends Model
{
  public function __construct(public $topic, public $info, public $completed = false) {}
}

$exam = new Exam("Hola voy aprender php", 'Nose');
$exam->save('Exam.txt');
