<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.entity.Order"%> 
<%   
Order a = (Order)request.getAttribute("order"); 
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
		</div>
	</nav>
	
    <section class="jumbotron">
    	<div class="container">
        	<center><h1 class="titulo-blog">Papeleria <strong>Rey de Reyes</strong></h1></center>
        </div>
     </section>
     
     <div class="container-fluid">
<div class="row">
       <div class="col-sm-2" > ACTIONS: <br> <a href="/orders">List Orders </a> 
       <br> <a href="/bills">Generar Factura</a> </div>
        <div class="col-sm-9 ml-auto">	
 <table class="table">
	<tr>
	<td>ID: <%=a.getIdOrder() %></td>
	</tr>
     <tr  >     
        <td>Nombre: <%= a.getName() %></td>   
      </tr>  
       <tr  >     
        <td>RUC:  <%=   a.getRuc() %></td> 
         </tr> 
        <tr  >     
        <td>Email: <%=  a.getEmail()  %></td> 
         </tr> 
        <tr>     
        <td>Producto: <%=  a.getProduct() %></td> 
         </tr> 
          <tr>     
        <td>Cantidad: <%=  a.getNumber() %></td> 
         </tr> 
          <tr >     
        <td>Detalles: <%=  a.getDetails() %></td> 
         </tr>
          <tr >     
        <td>Create: <%=  a.getCreate() %></td> 
         </tr>
          <tr >     
        <td>Estado: <%=  a.getStatus() %></td> 
         </tr>
         
 </table>       
</div>  </div> </div>     
</body> 
</html> 