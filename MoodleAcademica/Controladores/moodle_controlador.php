<?php

class ControladorMoodle {

    /* -------------------------------------------------------------------------- */
    /*                        MOSTRAR CONTENIDO TABLA ALUMNAS                     */
    /* -------------------------------------------------------------------------- */

    static public function controladorMostrarAlumnas(){
        $nombreTabla = "alumna";

        $respuesta = ModeloMoodle::modeloMostrarAlumnas($nombreTabla);

        return $respuesta;
    }
}