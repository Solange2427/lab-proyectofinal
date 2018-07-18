<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.Access"%>
<%@ page import="model.entity.Role"%>
<%@ page import="model.entity.Resource"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<title>Insert title here</title>
<!-- Bootstrap CSS -->
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
p {
	color: black;
	font-family: Verdana;
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
     
     
	<div class="container">
		<div class="row">
		 <div class="col-sm-2" > ACTIONS: <br> <a href="/access">List Access </a> </div>
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">MODIFICAR REGISTRO</h3>

				<%
					Access acceso = (Access) request.getAttribute("acceso");

					List<Role> arrayRole = (List<Role>) request.getAttribute("arrayRole");
					List<Resource> arrayRecurso = (List<Resource>) request.getAttribute("arrayRecurso");
				%>
				<form id="form1" class="form-horizontal" action="/access/update"
					method="POST">
					<div class="form-group">
						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Role</label>
							<div class="col-sm-9">
								<input type="text" hidden name="id" value=<%=acceso.getId()%>>
								<select class="form-control" name="role">
									<%
										if (arrayRole.size() > 0) {
											for (Role rol : arrayRole) {
												if (rol.getId().equals(acceso.getIdRole())) {
									%>
									<option value=<%=rol.getId()%> selected><%=rol.getNombre()%></option>
									<%
										} else {
									%>
									<option value=<%=rol.getId()%>><%=rol.getNombre()%></option>

									<%
										}
											}
										}
									%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Recurso</label>
							<div class="col-sm-9">
								<select class="form-control" name="recurso">
									<%
										if (arrayRecurso.size() > 0) {
											for (Resource recurso : arrayRecurso) {
												if (recurso.getId().equals(acceso.getIdRecurso())) {
									%>
									<option value=<%=recurso.getId()%> selected><%=recurso.getUrl()%></option>

									<%
										} else {
									%>
									<option value=<%=recurso.getId() + " " + acceso.getIdRecurso()%>><%=recurso.getUrl()%></option>

									<%
										}
											}
										}
									%>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Estado</label>
							<div class="col-sm-6">
								<select class="form-control" name="estado">
									<option value="true">ACTIVO</option>
									<%
										if (!acceso.isEstado()) {
									%>
									<option <%="selected"%>>INACTIVO</option>
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
							<a href="/access" class="btn btn-danger">CANCELAR</a>
							<button class="btn btn-success" id="enviar" type="submit">MODIFICAR
								ACCESO</button>

						</div>
				</form>
			</div>
		</div>
	</div>
	<br>
	<script src="/js/jquery-3.3.1.slim.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">					    </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
</body>
</html>