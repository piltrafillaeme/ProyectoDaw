<h1>Hola, soy la plantilla</h1>

<?php 

$alumnas = ControladorMoodle::controladorMostrarAlumnas();
echo "<pre class='bg-white'>"; print_r($alumnas); echo "</pre>";

?>