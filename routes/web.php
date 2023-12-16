<?php

use Illuminate\Support\Facades\Route;
use PhpParser\Node\Stmt\Echo_;

// use App\Http\Middleware\PrimeiroMiddleware;

Route::get('/usuarios', 'UsuarioControlador@index')->middleware('primeiro', 'segundo');

Route::get('/terceiro', function(){
     return 'Passou pelo terceiro middleware';
})->middleware('terceiro:joao');