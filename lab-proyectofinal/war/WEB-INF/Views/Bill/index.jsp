<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.Resource"%>
<%@page import="model.entity.Bills"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">

<style>
p {
	color: black;
	font-family: Verdana;
}

body {
	background-color: LightSteelBlue
}
</style>
<script>
            $(document).ready(function(){
                $('.btn-danger').click(function(){
                    var a = confirm("Estas Seguro de Eliminar");
                    if(!a){
                        return false;
                    }
                });
                
            });
            
        </script>
</head>
<body>
	<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>

	<div class="container">
			<h4>
			<b>Registro de Facturas</b>
		</h4>
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>ID Factura</th>
					<th>Nombre Cliente</th>
					<th>Fecha</th>
					<th>Monto</th>

					<th></th>
				</tr>
				<% 
					List<Bills> array = (List<Bills>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(Bills factura:array){
				%>
				<tr>
					<td><%= factura.getId() %></td>
					<td><%= factura.getNameClient() %></td>
					<td><%= factura.getTotal() %></td>
					<td><%= factura.getDate() %></td>


					<td><a href="/bills/view?id=<%= factura.getId()%>"
						class="btn btn-success btn-sm">Detalles Factura</a></td>
					
					<td><a href="/bills/delete?id=<%= factura.getId() %>"
						class="btn btn-danger btn-sm">Eliminar</a></td>

				</tr>
				<% }
				} %>

			</table>
			<div class="text-center">
				<a href="/resources" class="btn btn-primary btn-block">ACTUALIZAR</a>
				<br>
			</div>

		</div>

	</div>
	<script src="/js/jquery-3.3.1.slim.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>