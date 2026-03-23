<?php
class Model{
  /* forma vieja de hacerlo   
  public $title;
  public $completed;
  
  //este metodo siempre se crea cuando hacer un new metodo viejo
  public function __construct($title , $completed = false) {
    $this->title = $title;
    $this->completed = $completed;
  }
  */

  //(Constructor propertypromotion) forma nueva
  //public function __construct(
    //public $title = '',
    //public $completed = false
  //) {}

  public function buildString()
  {
    $me = new ReflectionClass($this);
    $properties = $me->getProperties();

    foreach ($properties as $value) {
      var_dump($value->name);
    }

    return "Titulo: {$this->title} \n Completo: " . ($this->completed ? 'Si' : 'No');
  }

  public function isComplete()
  {
    $this->completed = true;
  }

  public function save($name)
  {
    $file = fopen($name, 'w');
    fwrite($file, $this->buildString());
    fclose($file);
  }
}