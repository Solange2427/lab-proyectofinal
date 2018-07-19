	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import = "model.entity.*" %>
    <% Product mio = (Product) request.getAttribute("ProductObj");%>

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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/index.html"> Rey de Reyes</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button> 
		
		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item active">
    					<a class="nav-link" href="/index.html">Inicio</a>
  					</li>
  					<li class="nav-item">
      					<a class="nav-link" href="/roles" class="text-white h4">Roles</a>	
  					</li>
        			<li class="nav-item">
      					<a class="nav-link" href="/users">Users</a>	
  					</li>
        			<li class="nav-item">
      					<a class="nav-link" href="/resources">Resource</a>	
  					</li>
        			<li class="nav-item">
      					<a class="nav-link" href="/access">Access</a>	
  					</li>
  					<li class="nav-item">
   		 				<a class="nav-link" href="/products">Products</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="#">Login</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="#">Logout</a>
  					</li>
				</ul>
		</div>
	</nav>
	
    <section class="jumbotron">
    	<div class="container">
        	<center><h1 class="titulo-blog">Papeleria <strong>Rey de Reyes</strong></h1></center>
        </div>
     </section>
     

        
        
<div class="container-fluid">
<div class="row">
       <div class="col-sm-2" > ACTIONS: <br> <a href="/products">List Products </a> </div>
        <div class="col-sm-9 ml-auto">	
    			<form method="post" action="/products/edit">
    			<div class="form-group">
					<label for="nombre">Id:</label>
					<input class="form-control" name="lok" type="number" value="<%= mio.getId() %>">
				</div>
        		<div class="form-group">
            		<label for="nombre">Nombre:</label>
              		<input class="form-control" name="nombre" type="text" value="<%= mio.getNombre() %>" required> 
            	</div>
            	<div class="form-group">
            			<label for="nombre">Precio:</label>
              			<input class="form-control" name="precio" type="number" value="<%= mio.getPrecio() %>" required> 
            	</div>
            	<div class="form-group">
						<label for="descripcion">Descripcion: (Palabras Clave)</label>
						<textarea class="form-control" name="descripcion" placeholder="<%= mio.getDescripcion() %>"></textarea>
				</div>
				<div class="form-group">
    					<label for="url">Seleccione la imagen de su Producto</label>
              			<input class="form-control" name="url" type="utl" value="<%= mio.getUrl() %>" required> 
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