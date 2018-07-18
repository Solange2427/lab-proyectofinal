<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Role"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- Bootstrap CSS -->
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
 
<style>
p {
	color: black;
	font-family: Verdana;
}
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
<script type="text/javascript">
</script>
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
   		 				<a class="nav-link" href="/orders">Pedido</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="/email">Login</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="/email">Logout</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="/Videos.html"> Link Videos Codigo</a>
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
		
		<div class="col-sm-2" > ACTIONS: <br> <a href="/roles"> List Roles </a> </div>
        
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">MODIFICAR ROL</h3>

				<%
				Role rol = (Role)request.getAttribute("role");
				%>
				<form id="form1" class="form-horizontal" action="/roles/update"
					method="POST">
					<div class="form-group">
						<label class="text" col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input type="text" hidden name="id" value=<%= rol.getId() %>>
							<input class="form-control" placeholder="Ingrese nombre Role"
								name="nombre" type="text" required=""
								value=<%= rol.getNombre() %>>
						</div>
					</div>
					<div class="form-group">
						<label class="text" col-sm-2 control-label">Estado</label>
						<div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<% if (!rol.isEstado()) {%>
								<option <%="selected"%> value="false">INACTIVO</option>
								<% } else {%>
								<option value="false">INACTIVO</option>
								<% }%>
							</select>
						</div>
					</div>
					
					<div class="text-right">
						<a href="/roles" class="btn btn-block btn-danger">CANCELAR</a>
					</div>
					
					<div class="text-right">
						<button class="btn btn-block btn-primary" id="enviar" type="submit">ENVIAR</button>
					</div>
					
					
				</form>
			</div>
		</div>
	</div>
	<br>
	<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>