
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<% List<Product> products = (List<Product>)request.getAttribute("products"); %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
<style>
.jumbotron {
	background-color: #1bac91;
	padding: 90px 0 70px;
	color: #fcfcfc;
}

.titulo-blog {
	color: #fff;
	font-size: 50px;
}
</style>
</head>

<body>
	
<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>
	<div class="container-fluid">
		<div class="row">
			<div class="container">
					<h4>
			<b>Registro de Productos</b>
		</h4>
				<%if(products.size() >= 0){ %>
				<table class="table">
					<tr style="background: #1bac91">
						<th>ID</th>
						<th>Foto</th>
						<th>Name</th>
						<th>Precio</th>
						<th>Descripcion</th>
						<th>Total ##</th>
						<th>Actions</th>

					</tr>
					<%for(int i = 0 ; i < products.size();i++){ %>
					<% Product c = (Product)products.get(i); %>
					<tr>
						<td><a href="/products/update?id=<%=c.getId() %>"> <%= c.getId() %></a></td>
						<td>
							<div class="card">
								<div class="card">
									<img class="card-img-top" src="<%= c.getUrl() %>"
										alt="Card image cap">
								</div>
							</div>
						</td>
						<td><%= c.getNombre() %></td>
						<td><%= c.getPrecio() %></td>
						<td><%= c.getDescripcion() %></td>
						<td><%= c.getContador() %></td>
						<td><a href="/products/delete?id=<%=c.getId()%>"> Delete
						</a></td>
					</tr>
					<%} %>
				</table>
				<%} %>
			</div>

		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous">					    </script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>

</body>
</html>