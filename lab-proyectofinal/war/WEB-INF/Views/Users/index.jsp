<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.Users"%>
<%@page import="model.entity.Role"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
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
	<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>


	<div class="container-fluid">
		<h4>
			<b>Registro de Datos de Usuarios</b>
		</h4>
		<div class="table-responsive  ">
		
			<table class="table">
			<thead class="thead-dark">
				<tr>
				<th>ID</th>
				<th>ID rol</th>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Email</th>
					<th>Rol</th>
					
					<th>Estado</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
				<thead>
				<%
					List<Users> array = (List<Users>) request.getAttribute("array");
					List<Role> arrayRole = (List<Role>) request.getAttribute("arrayRol");
					if (array.size() > 0) {
						int i = 0;
						Role rol;
						for (Users usuario : array) {
							rol = arrayRole.get(i);
				%>
				<tr>
			        <td><%=usuario.getCodigo()%></td>
			         <td><%=usuario.getIdRol()%></td>
					<td><%=usuario.getNombre()%></td>
					<td><%=usuario.getApellido()%></td>
					<td><%=usuario.getEmail()%></td>
					<td><%=rol.getNombre()%></td>
					<td><%=usuario.getEstadoDescripcion()%></td>

					<td><a href="/users/update?id=<%=usuario.getCodigo()%>"
						class="btn btn-block btn-primary"> EDITAR </a></td>
					<td><a href="/users/delete?id=<%=usuario.getCodigo()%>"
						class="btn btn-block btn-danger"> DELETE </a></td>
				</tr>
				<%
					i++;
						}
					}
				%>

			</table>
			<div class="text-center">
				<a href="/users" class="btn btn-primary btn-block">ACTUALIZAR</a> <br>
			</div>

		</div>

	</div>
	<script src="/js/jquery-3.3.1.slim.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>