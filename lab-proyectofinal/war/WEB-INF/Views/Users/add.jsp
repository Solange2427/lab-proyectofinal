<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="model.entity.Role"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
<link rel='stylesheet' href="/CSS/bootstrap.min.css">
 
<style>
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
	<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				
					 <h4><b>FORMULARIO-USUARIO</b></h4>
				<form id="form1" class="form-horizontal" action="/users/add"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Nombre" autofocus name="nombre"
								type="text" required="">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Apellido</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Apellido " name="apellido"
								required type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2 text-info">Correo Electronico</label>
						<div class="col-sm-10">
							<div class="input-group ">
								<div class="input-group-addon">@</div>
								<input class="form-control"
									placeholder="Ingrese Email" name="email"
									type="email" required>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Rol</label>
						<div class="col-sm-10">
							<%
							List<Role> array = (List<Role>)request.getAttribute("array");
							if(array != null && array.size() > 0){
							%>
							<select class="form-control" name="idRol">
								<% for(Role rol : array) {%>
								<option value= <%=rol.getId() %>><%=rol.getNombre()%></option>
								<%} %>
							</select>
							<% }%>
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-primary btn-block" id="enviar" type="submit">Crear Usuario</button>
					</div>
				</form>
				<div class="text-center">

					<div id="cargando" style="display: inline-block"></div>
				
					<div id="resultado"></div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
	</body>
</html>