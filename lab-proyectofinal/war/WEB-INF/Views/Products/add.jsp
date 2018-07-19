<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
<style>
.jumbotron{
	background-color:#1bac91;
	padding:90px 0 70px;
	color:#fcfcfc;
}
.breadcrumb{
	background-color:#C0FCD1;
}
.titulo-blog{
	color:#fff;
	font-size:50px;
}
</style>
</head>

<body>

<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>



     	
<div class="container-fluid">
        
       <div class="container">	
    			<form method="post" action="/products/add">
        			<div class="form-group">
            			<label for="nombre">Nombre:</label>
              			<input class="form-control" name="nombre" type="text" placeholder="Nombre:" required> 
            		</div>
            		<div class="form-group">
            			<label for="precio">Precio:</label>
              			<input class="form-control" name="precio" type="number" placeholder="Precio:" required> 
            		</div>
            		<div class="form-group">
						<label for="descripcion">Descripcion: (Palabras Clave)</label>
						<textarea class="form-control" name="descripcion" placeholder="Escribe la descripcion de tu producto" required></textarea>
					</div>
					<div class="form-group">
    					<label for="url">Seleccione la imagen de su Producto</label>
              			<input class="form-control" name="url" type="utl" placeholder="URL:" required> 
  					</div>
                		<input class="btn btn-outline-success" type="submit" value="Enviar">
                		
        		</form>
        </div> 
    		
</div>
</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">					    </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

</body>
</html>