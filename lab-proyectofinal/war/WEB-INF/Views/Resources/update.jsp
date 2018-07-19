<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Resource"%>
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
				<h3 class="titulo text-center">MODIFICAR </h3>

				<%
				Resource rec = (Resource)request.getAttribute("recurso");
				%>
				<form id="form1" class="form-horizontal" action="/resources/update"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input type="text" hidden name="id" value=<%= rec.getId() %>>
							<input class="form-control" placeholder="Ingrese URL del Recurso"
								name="url" type="text" required=""
								value=<%= rec.getUrl() %>>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Estado</label>
						<div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<% if (!rec.isEstado()) {%>
								<option <%="selected"%>>INACTIVO</option>
								<% } else {%>
								<option value="false">INACTIVO</option>
								<% }%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<a href="/resources" class="btn btn-danger btn-block">CANCELAR</a></div>
						<div>
						<button class="btn btn-primary btn-block" id="enviar" type="submit">MODIFICAR
							DATOS</button>
</div>
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