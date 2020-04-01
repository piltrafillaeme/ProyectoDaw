<?php 
class ControladorPlantilla{

    /* -------------------------------------------------------------------------- */
    /*                           Llamada a la plantilla                           */
    /* -------------------------------------------------------------------------- */

    /* Método */
    public function controladorTraerPlantilla(){
        
        /* include() se utiliza para invocar el archivo que contiene código html-php */
        include "Vistas/plantilla.php";

    }
    
}

?>