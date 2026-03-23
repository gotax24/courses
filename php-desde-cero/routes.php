<?php

use App\Controllers\AuthController;
use App\Controllers\HomeController;
use App\Controllers\PagesController;
use App\Controllers\TaskController;
use Pecee\SimpleRouter\SimpleRouter;

SimpleRouter::get('/', [HomeController::class, 'show']);

SimpleRouter::get('about', [PagesController::class, 'about']);
SimpleRouter::get('contact', [PagesController::class, 'contact']);
SimpleRouter::get('services', [PagesController::class, 'services']);

SimpleRouter::post('tasks/create/{id}', [TaskController::class, 'create']);
SimpleRouter::post('tasks/toggle/{id}', [TaskController::class, 'toggle']);
SimpleRouter::post('tasks/delete/{id}', [TaskController::class, 'delete']);

SimpleRouter::get('login', [AuthController::class, 'show']);
SimpleRouter::post('login', [AuthController::class, 'login']);
SimpleRouter::post('logout', [AuthController::class, 'logout']);

SimpleRouter::start();
