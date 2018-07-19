<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.Resource"%>
<%@page import="model.entity.Role"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<!-- Bootstrap CSS -->
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

 
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

body {
	background-color: LightSteelBlue
}
</style>

</head>
<body>
<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>


	
	<%
		List<Role> arrayRole = (List<Role>) request.getAttribute("arrayRole");
		List<Resource> arrayRecurso = (List<Resource>) request.getAttribute("arrayRecurso");
	%>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">INSERTAR RECURSO</h3>
				<form id="form1" class="form-horizontal" action="/access/add"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-3 control-label">Role</label>
						<div class="col-sm-9">
							<select class="form-control" name="role">
								<% if(arrayRole.size() > 0){ 
									for(Role rol : arrayRole){
									%>
								<option value=<%=rol.getId() %>><%=rol.getNombre() %></option>

								<%} 
									}%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-3 control-label">Recurso</label>
						<div class="col-sm-9">
							<select class="form-control" name="recurso">
								<% if(arrayRecurso.size() > 0){ 
									for(Resource recurso : arrayRecurso){
									%>
								<option value=<%=recurso.getId() %>><%=recurso.getUrl() %></option>
								<%} 
									}%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-primary btn-block" id="enviar" type="submit">Insertar Acceso</button>
					</div>
				</form>
				<div class="text-center">

					<!--Simbolo de Loading -->
					<div id="cargando" style="display: inline-block"></div>
					<!--Resultado del Ajax -->
					<div id="resultado"></div>
				</div>
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