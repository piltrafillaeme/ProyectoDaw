<?php 

require_once "Controladores/plantilla_controlador.php";
require_once "Controladores/moodle_controlador.php";
require_once "Modelos/moodle_modelo.php";


$plantilla = new ControladorPlantilla();
$plantilla -> controladorTraerPlantilla();
?>