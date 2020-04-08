<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Alumna;

class AlumnaController extends Controller
{
    public function index() {

        /* Instanciamos en blog toda la información que hay en la tabla blog (es como un fetchAll nativo) */
        $alumna = Alumna::all();

        /* Enviamos ya a la vista todo lo que estoy almacenando en el controlador view(ruta archivo de la pagina, array que almacena toda la información traida)*/
        return view("/alumna", array("alumna" => $alumna));

        /* Hay que especificar en la ruta que estoy usando un método get (web.php) -> Route::get(ruta de la url donde quiero que se aplique el método get, nombre del controlador@nombre del método)
        Lo anterior se especifica dentro del archivo web.php -> Route::get('/', 'BlogController@traerBlog');*/
    }
}
