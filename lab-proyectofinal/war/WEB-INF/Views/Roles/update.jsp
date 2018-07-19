<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Role"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
 
<style>
p {
	color: black;
	font-family: Verdana;
}

body {
	background-color: LightSteelBlue
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>
	<div class="container">
		<div class="row">
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