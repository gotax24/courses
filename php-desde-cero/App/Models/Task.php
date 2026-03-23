<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Task extends Model
{
  public $timestamps = false;

  protected $color;

  public function setColor($color)
  {
    $this->color = $color;
  }

  // Si tu tabla se llama 'task' en singular (como vimos en el error), 
  // debes especificarlo, ya que Eloquent busca 'tasks' por defecto.
  protected $table = 'task';

  // Campos que permites llenar de forma masiva (ajusta según tus necesidades)
  protected $fillable = ['title', 'color', 'completed'];

  // 1. Dile a Eloquent que la clave primaria NO se autoincrementa
  public $incrementing = false;

  // 2. Dile a Eloquent que la clave primaria es un texto (string)
  protected $keyType = 'string';

  // 3. Generar el UUID automáticamente al crear
  protected static function boot()
  {
    parent::boot();

    // El evento 'creating' se ejecuta justo antes de hacer el INSERT en SQL Server
    static::creating(function ($model) {
      // Si el modelo no tiene un ID asignado, le generamos un UUID
      if (empty($model->{$model->getKeyName()})) {
        $model->{$model->getKeyName()} = (string) Str::uuid();
      }
    });
  }
}
