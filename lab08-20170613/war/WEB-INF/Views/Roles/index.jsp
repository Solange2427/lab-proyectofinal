<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.entity.Role" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- Bootstrap CSS -->
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
 
<style>
p {
	color: black;
	font-family: Verdana;
}
.jumbotron{
	background-color:#1bac91;
	padding:90px 0 70px;
	color:#fcfcfc;
}
.breadcrumb{
	background-color:#C0FCD1;
}
.titulo-blog{
	color:#fff;
	font-size:50px;
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
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/index.html"> Rey de Reyes</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button> 
		
		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item active">
    					<a class="nav-link" href="/index.html">Inicio</a>
  					</li>
  					<li class="nav-item">
      					<a class="nav-link" href="/roles" class="text-white h4">Roles</a>	
  					</li>
        			<li class="nav-item">
      					<a class="nav-link" href="/users">Users</a>	
  					</li>
        			<li class="nav-item">
      					<a class="nav-link" href="/resources">Resource</a>	
  					</li>
        			<li class="nav-item">
      					<a class="nav-link" href="/access">Access</a>	
  					</li>
  					<li class="nav-item">
   		 				<a class="nav-link" href="/products">Products</a>
  					</li>
  					<li class="nav-item">
   		 				<a class="nav-link" href="/orders">Pedido</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="/email">Login</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="/email">Logout</a>
  					</li>
  					<li class="nav-item">
    					<a class="nav-link" href="/Videos.html"> Link Videos Codigo</a>
  					</li>
				</ul>
		</div>
	</nav>
    
    <section class="jumbotron">
    	<div class="container">
        	<center><h1 class="titulo-blog">Papeleria <strong>Rey de Reyes</strong></h1></center>
        </div>
     </section>
     
<div class="container-fluid">
<div class="row">
       <div class="col-sm-2" > ACTIONS: <br> <a href="/roles/add">Add Rol </a> </div>
        
       <div class="col-sm-9 ml-auto">	
       
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
	</div>

	</div>
	<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>