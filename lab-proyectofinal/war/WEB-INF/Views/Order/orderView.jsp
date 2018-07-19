<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Order"%>
<%
	Order a = (Order) request.getAttribute("order");
%>
<html>
<head>
<title>Pedido</title>
<link rel='stylesheet' href="/CSS2/bootstrap.min.css">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: #ccccff;
	font-family: Verdana, Arial, sans-serif;
}

#menuV h4 {
	font-family: arial, sans-serif;
	font-weight: 400;
	height: 40px;
	background: #16A5C7;
	width: 100%;
	color: white;
	line-height: 50px;
}
</style>
</head>
<body>
	<header class="container">
		<h3>
			<a href="/inicio"><span class="label label-danger">Inicio
			</span></a>
		</h3>
	</header>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<table class="table">

					<tr>
						<th>ID</th>
						<td><%=a.getIdOrder()%></td>
					</tr>
					<tr>

						<th>Nombre</th>
						<td><%=a.getName()%></td>
					</tr>
					<tr>
						<th>RUC</th>
						<td><%=a.getRuc()%></td>
					</tr>
					<tr>
						<th>Email:</th>
						<td>Email: <%=a.getEmail()%></td>

					</tr>
					<tr>
						<th>Producto</th>
						<td><%=a.getProduct()%></td>
					</tr>
					<tr>
						<th>Cantidad</th>
						<td><%=a.getNumber()%></
					<tr>
					<tr>
						<th>Detalles</th>
						<td><%=a.getDetails()%></td>

					</tr>
					<tr>
						<th>Create </th>
						<td><%=a.getCreateDescripcion()%> </td>
					</tr>
					<tr>
						<th>Estado</th>
					    <td><%=a.getStatusDescripcion()%></td>
					</tr>

	
				</table>
			</div>
			
		</div>
		<a class="btn btn-success" href="/bills/add?ordeId?<%=a.getIdOrder()%>">GENERAR FACTURA</a>
		<a class="btn btn-info" href="/bills/add?ordeId?<%=a.getIdOrder()%>">INFORME</a>			
	</div>
</body>
</html>
