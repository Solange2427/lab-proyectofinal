<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.entity.Role" %>
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
			<b>Registro de Roles</b>
		</h4>
		<div class="table-responsive  ">
<table class="table">
  <thead class="thead-dark">
    <tr>
      
      <th scope="col">ID Rol</th>
      <th scope="col">Nombre</th>
      <th scope="col">Fecha</th>
      <th scope="col">Estado</th>
      <th scope="col">Update</th>
      <th scope="col">Delete</th>
      
    </tr>
  </thead>
  <% 
          List<Role> array = (List<Role>)request.getAttribute("array");
        
          if(array.size() > 0) {
            
            for(Role rol:array){
        %>

  
<tbody>
<tr>

<td><%=rol.getId()%></td>
<td><%=rol.getNombre()%></td>
<td><%= rol.fechaDescripcion() %></td>
<td><%= rol.estadoDescripcion() %></td>

<td><a href="/roles/update?id=<%=rol.getId()%>"class="btn btn-block btn-primary"> EDITAR </a></td>
<td><a href="/roles/delete?id=<%=rol.getId()%>" class="btn btn-block btn-danger"> DELETE </a></td>
</tr>
</tbody>




<%} 
}%>
</table>
			<div class="text-center">
			<a href="/roles" class="btn btn-block btn-primary">ACTUALIZAR</a>
			<br>
			</div>
			
		</div>

	</div>
	<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>