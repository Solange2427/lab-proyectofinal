<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%> 
<%@ page import="model.entity.Order"%> 
<%   
List<Order> orders= (List<Order>)request.getAttribute("orders"); 
%>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<style>
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
       <div class="col-sm-2" > ACTIONS: <br> <a href="/orders/add"> Add Order </a> </div>
        <div class="col-sm-10 ml-auto">	
     
    <%  if (orders.size() > 0) { %>  
<table class="table">
     <tr     >       
        <td       style="color:       #1bac91;       font-weight:  bold;">Nombre</td>       
        <td       style="color:       #1bac91;       font-weight:  bold;">Ruc</td>       
        <td       style="color:       #1bac91;       font-weight:  bold;">Email</td> 
        <td       style="color:       #1bac91;       font-weight:  bold;">Producto</td> 
        <td       style="color:       #1bac91;       font-weight:  bold;">Cantidad</td> 
		<td       style="color:       #1bac91;       font-weight:  bold;">Descripción</td>
		<td       style="color:       #1bac91;       font-weight:  bold;">Estado</td> 
		<td>	</td>
		<td>	</td>
		<td>	</td>
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
            <td><a href="/orders/view?orderId=<%= a.getIdOrder()%>">Ver</a> </td>
            <td><a href="/orders/edit?orderId=<%= a.getIdOrder()%>">Modificar</a> </td>
            <td><a href="/orders/delete?orderId=<%= a.getIdOrder()%>">Borrar</a> </td>
     </tr> 
   
     <%   }     %>       
 </table>       
     <%   }       
else { %> 
<span class="heading">No hay pedidos realizados</span> 
<% } %> 
      </div></div></div> 
       
       
          
</body> 
</html> 