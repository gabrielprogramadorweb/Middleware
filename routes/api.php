<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Rotas para Categorias
Route::get('/categorias', 'ControladorCategoria@indexJson');

// Rotas RESTful para Produtos
Route::resource('/produtos', 'ControladorProduto')->except(['create', 'edit']);

// Rotas personalizadas para Produtos
Route::get('/api/produtos', 'ControladorProduto@index');
Route::post('/api/produtos', 'ControladorProduto@store');
Route::put('/api/produtos/{id}', 'ControladorProduto@update');
Route::delete('/api/produtos/{id}', 'ControladorProduto@destroy');
