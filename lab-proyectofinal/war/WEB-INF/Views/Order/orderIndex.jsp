<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.Order"%>
<%   
List<Order> orders= (List<Order>)request.getAttribute("orders"); 
%>
<html>
<head>
<title>Pedidos</title>
<link rel='stylesheet' href="/CSS2/bootstrap.min.css">
</head>
<body>
<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>

	<div class="container">
			<h4>
			<b>Registro de Pedidos</b>
		</h4>
	<%  if (orders.size() > 0) { %>
	<table class="table">
		<tr>
			<td>Nombre</td>
			<td>Ruc</td>
			<td>Email</td>
			<td>Producto</td>
			<td>Cantidad</td>
			<td>Descripción</td>
			<td>Estado</td>
			<td></td>
			<td></td>
			
		</tr>
		<%  for (int i = 0;i<orders.size();i++) { %>
		<%  Order  a = (Order)orders.get(i);   %>
		<tr>
			<td><%= a.getName() %></td>
			<td><%= a.getRuc() %></td>
			<td><%= a.getEmail()       %></td>
			<td><%= a.getProduct()       %></td>
			<td><%= a.getNumber()       %></td>
			<td><%= a.getDetails()       %></td>
			<td><%= a.getStatus() %></td>
			<td><a href="/orders/view?orderId=<%= a.getIdOrder()%>">Ver</a>
			</td>
			<td><a href="/orders/edit?orderId=<%= a.getIdOrder()%>">Modificar</a>
			</td>
			<td><a href="/orders/delete?orderId=<%= a.getIdOrder()%>">Borrar</a>
			</td>
		</tr>

		<%   }     %>
	</table>
	<%   }       
else { %>
	<span class="heading">No hay pedidos realizados</span>
	<% } %>
	<p />
</div>
</body>
</html>
