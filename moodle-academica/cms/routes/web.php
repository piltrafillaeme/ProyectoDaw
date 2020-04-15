<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    /* return view('welcome'); */
    return view('inicio');
});

Route::get('/profesor', function () {
    /* return view('welcome'); */
    return view('profesor');
});

Route::get('/temas', function () {
    /* return view('welcome'); */
    return view('temas');
});



Route::view('/profesor', 'paginas.plistas');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/temas', 'TemasController@index')->name('temas');

Route::resource('/alumna', 'AlumnaController');
Route::resource('/profesor', 'ProfesorController');
Route::resource('/profesor/plistas', 'plistasController');
