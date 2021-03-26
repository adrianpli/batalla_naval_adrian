<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\TableroController;

Route::get('/', function () {
    return redirect()->route('bienvenida');
});

Route::get('/bienvenida',[UsuarioController::class,'bienvenida'])->name('bienvenida');
Route::get('/login',[UsuarioController::class,'login'])->name('login');
Route::post('/login',[UsuarioController::class,'verificarCredenciales'])->name('login.form');
Route::post('/editar/{correo?}',[UsuarioController::class,'editar'])->name('editar.form');
Route::post('/eliminar',[UsuarioController::class,'eliminar'])->name('eliminar.form');
Route::get('/cerrarSesion',[UsuarioController::class,'cerrarSesion'])->name('cerrar.sesion');
Route::get('/registro',[UsuarioController::class,'registro'])->name('registro');
Route::post('/registro',[UsuarioController::class,'registroForm'])->name('registro.form');


Route::prefix('/usuario')->middleware("VerificarUsuario")->group(function (){
    Route::get('/menu',[UsuarioController::class,'menu'])->name('usuario.menu');

    Route::get('/tablero/{codigo}', [TableroController::class,'detalleTablero'])->name('usuario.detalle.tablero');
    Route::get('/tablero/editar/{codigo}', [TableroController::class,'editar'])->name('usuario.editar.tablero');
    Route::get('/tablero/eliminar/{codigo}', [TableroController::class,'eliminarTablero'])->name('usuario.eliminar.tablero');

    Route::get('/crear',[UsuarioController::class,'saludo']);
    Route::get('/crear/tablero',[UsuarioController::class,'crearTablero'])->name('usuario.crear.tablero');
    Route::post('/crear/tablero',[TableroController::class,'crearTablero'])->name('usuario.registrar.tablero');
    Route::get('/crear/codigo/tablero',[TableroController::class,'crearCodigotablero'])->name('usuario.crear.tablero.codigo');
    Route::get('/peticion',[UsuarioController::class,'peticion'])->name('usuario.peticion');
    Route::get('/mistableros',[UsuarioController::class,'misTableros'])->name('usuario.mistableros');
    Route::get('/tableros',[UsuarioController::class,'tableros'])->name('usuario.tableros');
    Route::get('/historial',[UsuarioController::class,'historial'])->name('usuario.historial');
    Route::get('/agregar/barcos/tablero/{codigo?}/{conjuntoBarcos?}',[TableroController::class,'agregarBarcos'])->name('tablero.agregar.barcos');
    Route::get('/consultar/barcos/tablero/{codigo?}',[TableroController::class,'buscarBarcosTablero'])->name('tablero.consultar.barcos');
    Route::get('/tablero/tirar/posicion/{tablero?}/{posicion?}',[TableroController::class,'tirar'])->name('tablero.tirar.barco');
});



