<html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Dashboard</title>
        <script src="../../script/script.js"></script>
        <link rel="stylesheet" href="../css/styled.css"></link>
        <style>
        </style>
      </head>
      <body>
        <!-- Sidebar -->
        <aside>
          <div class="sidebar-title">
            <h2 class="sidebar-brand">Dash-Menu</h2>
          </div>
          <ul class="sidebar-list">
            <li>
              <a href="../../html/add_new_boss_form.html">
                <span>Add Boss</span>
              </a>
            </li>
            <li>
              <a href="../../html/modify_boss_form.html">
                <span>Modify Boss</span>
              </a>
            </li>
            <li>
              <a href="../../html/delete_boss_form.html">
                <span>Delete Boss</span>
              </a>
            </li>
          </ul>
        </aside>
        <!-- End Sidebar -->


      </body>
    </html>


<?php 

require_once("../ServerConexion/BDConexion.php");

try {

    $rutaXq = "../xquery/insert.xq";
    $fichero = fopen($rutaXq, "r"); // Abrimos el fichero $rutaXq en modo lectura "r"
    $xq = fread($fichero, filesize($rutaXq)); // Leemos el contenido del fichero y lo guardamos en la variable $xq
    fclose($fichero); // Cerramos el fichero
    
    // create session
    $session = new Session();    
    // open database
    $session->execute("open saga"); // open y el nombre de la base de datos en el servidor BaseX
    // xquery
    $query = $session->query($xq);
	// Retrieve the submitted form data
	//$query->bind('$id', $_GET['id']);
	$query->bind('$juego', $_GET['juego']);
	$query->bind('$nombre', $_GET['nombre']);
	$query->bind('$genero', $_GET['genero']);
	$query->bind('$lore', $_GET['lore']);
	$query->bind('$arma1', $_GET['arma1']);
	$query->bind('$arma2', $_GET['arma2']);
	$query->bind('$imagen', $_GET['imagen']);
	$query->bind('$localizacion', $_GET['localizacion']);
	
    // execute result
    $result = $query->execute();
    // close query
    $query->close();
    // close session
    $session->close();

    // Show the result
    echo $result;
	echo '<script>
	window.onload = function() {
		alert("Operation completed successfully");
		window.location.href = "./Transformations/dashboard.php"; // Replace with your target page
	};
</script>';
} catch(Exception $e) {

    echo $e->getMessage();

}

?> 