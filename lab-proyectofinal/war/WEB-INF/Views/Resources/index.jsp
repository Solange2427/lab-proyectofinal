<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.Resource"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

	<br>
	
	<div class="container">
			<h4>
			<b>Registro de Resources</b>
		</h4>
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Codigo Recurso</th>
					<th>Recurso URL</th>
					<th>Fecha de Creacion</th>
					<th>Estado</th>
					<th>Update</th>
					<th>Delete</th>
					<th></th>
				</tr>
				<% 
					List<Resource> array = (List<Resource>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(Resource rec:array){
				%>
				<tr>
					<td><%= rec.getId() %></td>
					<td><%= rec.getUrl() %></td>
					<td><%= rec.fechaDescripcion() %></td>
					<td><%= rec.estadoDescripcion() %></td>
					
						<td><a
						href="/resources/update?id=<%= rec.getId() %>"
						class="btn btn-primary btn-sm">Editar</a> 
						</td>
						<td><a href="/resources/delete?id=<%= rec.getId() %>" class="btn btn-danger btn-sm">Eliminar</a></td>
					
				</tr>
				<% }
				} %>

			</table>
			<div class="text-center">
				<a href="/resources" class="btn btn-primary btn-block">ACTUALIZAR</a> <br>
			</div>

		</div>

	</div>
<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>