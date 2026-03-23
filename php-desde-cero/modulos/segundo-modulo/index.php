<?

require_once __DIR__ . '/Enmus.php';

class Task
{
  //(Constructor propertypromotion) forma nueva
  public function __construct(
    public $title,
    public $completed = false,
    public $color = 'black'
  ) {}

  /* forma vieja de hacerlo   
  public $title;
  public $completed;
  
  //este metodo siempre se crea cuando hacer un new metodo viejo
  public function __construct($title , $completed = false) {
    $this->title = $title;
    $this->completed = $completed;
  }
  */

  public function buildString()
  {
    $me = new ReflectionClass($this);
    $properties = $me->getProperties();

    foreach ($properties as $value) {
      $valueName = $value->name;
      $valueValue = $this->$valueName;
      $string = $string . "{$valueName}" . (is_bool($valueValue) ? var_export($valueValue, true) : $valueValue . "\n");
    }

    return "Titulo: {$this->title} \n Completo: " . ($this->completed ? 'Si' : 'No');
  }

  public function isComplete()
  {
    $this->completed = true;
  }

  public function save(string $name):void
  {
    if(is_null($name)){
      $me = new ReflectionClass($this);
      $filename = $me->getName();
      $name = lcfirst($filename) . ".txt";
    }

    $file = fopen($name, 'w');
    fwrite($file, $this->buildString());
    fclose($file);
  }

  public function setColors($color){
    $this->color = $color;
  }
}



//se crea el objeto
$task = new Task('Titulo', true);
//llamamos un metodo
$task->isComplete();

//un array de objetos
$tasks = [
  new Task('Titulo', true),
  new Task('Titulo 2'),
  new Task('Titulo 3', true),
  //con parametros nombrados (php8+) para no ponerlo en orden 
  new Task(completed: true, title: 'PHP'),
];

$tasks[0]->setColors(ColorsEnum::BLUE->value);
$tasks[1]->setColors(ColorsEnum::GREEN->value);
$tasks[2]->setColors(ColorsEnum::RED->value);

$completedTask = array_filter($tasks, function ($task) {
  return $task->completed;
});

$variable = new Task("Ir al supermercado");
$variable->save('task1.txt');

