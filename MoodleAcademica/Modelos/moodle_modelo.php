<?php

require_once "conexion.php";

class ModeloMoodle{

    /* -------------------------------------------------------------------------- */
    /*                        MOSTRAR CONTENIDO TABLA ALUMNAS                     */
    /* -------------------------------------------------------------------------- */

    static public function modeloMostrarAlumnas($nombreTabla){
        
        $stmt = Conexion::conectar()->prepare("SELECT * FROM $nombreTabla");

        $stmt -> execute();

        return $stmt -> fetch();

        $stmt -> close();

        $stmt = null;
    }
}