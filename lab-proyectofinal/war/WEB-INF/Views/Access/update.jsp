<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.Access"%>
<%@ page import="model.entity.Role"%>
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
	background-color: LightSteelBluze
}
</style>
<title>Formulario</title>
<style>
p {
	color: black;
	font-family: Verdana;
}

body {
	background-color:   LightSteelBlue
}
</style>

</head>
<body>
<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>

	<div class="container">
		<div class="row">
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
</body>
</html>