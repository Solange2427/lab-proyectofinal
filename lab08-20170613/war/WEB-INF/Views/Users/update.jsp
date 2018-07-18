<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Users"%>
<%@ page import="model.entity.Role"%>
<%@ page import="java.util.List"%>
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
<title>Formulario</title>
<style>
p {
	color: black;
	font-family: Verdana;
}
</style>

</head>
<body>
	<%
		Users usuario = (Users) request.getAttribute("usuario");
		List<Role> array = (List<Role>) request.getAttribute("array");
	%>
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
		
		       <div class="col-sm-2" > ACTIONS: <br> <a href="/users">List Users </a> </div>
			<div class="col-sm-10 col-md-6">
				<form id="form1" class="form-horizontal" action="/users/view"
					method="POST">
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input type="text" hidden name="codigo"
								value=<%=usuario.getCodigo()%>> <input
								class="form-control" placeholder="Nombre del Usuario"
								name="nombre" type="text" required=""
								value="<%=usuario.getNombre()%>">
						</div>
					</div>
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Apellido</label>
						<div class="col-sm-10">
							<input class="form-control" placeholder="Apellido del Usuario"
								name="apellido" required type="text"
								value="<%=usuario.getApellido()%>">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label text-danger">Email</label>
						<div class="col-sm-10">
							<div class="input-group ">
								<div class="input-group-addon">@</div>
								<input class="form-control" placeholder="Gmail Usuario"
									name="email" type="email" value="<%=usuario.getEmail()%>">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Rol</label>
						<div class="col-sm-10">
							<%
								if (array != null && array.size() > 0) {
							%>
							<select class="form-control" name="idRol">
								<%
									for (Role role : array) {
											if (role.getId().equals(usuario.getCodigo())) {
								%>

								<option value="<%=role.getId()%>" selected><%=role.getNombre()%></option>
								<%
									} else {
								%>
								<option value="<%=role.getId()%>"><%=role.getNombre()%></option>
								<%
									}
										}
								%>
							</select>
							<%
								}
							%>
						</div>
					</div>

					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Estado</label>
						<div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<%
									if (!usuario.isEstado()) {
								%>
								<option <%="selected"%> value="false">INACTIVO</option>
								<%
									} else {
								%>
								<option value="false">INACTIVO</option>
								<%
									}
								%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<a href="/users" class="btn btn-danger">CANCELAR</a>
						<button class="btn btn-success" id="enviar" type="submit">MODIFICAR
							DATOS</button>

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