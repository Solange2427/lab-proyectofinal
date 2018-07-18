<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page  import="javax.jdo.PersistenceManager" %>
<%@page import="java.util.List"%>
<%@ page import="controller.PMF"%>
<%@page import="model.entity.Product"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<script type="text/javascript">
function validar(f) {
   var msg = "Todos los campos son obligatorios";
  if(f.name.value == ""|| f.product.value =="" || f.details.value ==""){
      alert(msg);
  return false;
  }
  else if(/^\s+|\s+$/.test(f.name.value)){
	  alert("Ingrese un nombre")
	  return false;
  }

  else if(/^\s+|\s+$/.test(f.product.value)){
	  alert("Ingrese el tipo de producto")
	  return false;
 }
  else if(/^\s+|\s+$/.test(f.details.value)){
	  alert("Ingrese algunos detalles")
	  return false;
  }
  }
</script>
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
       <div class="col-sm-2" > ACTIONS: <br> <a href="/orders">List Orders </a> </div>
        <div class="col-sm-9 ml-auto">	
			<% PersistenceManager pm = PMF.get().getPersistenceManager(); %>
				<% String query = "select from " + Product.class.getName(); 
			 List<Product> arrayProducts = (List<Product>) pm.newQuery(query).execute();  
			%>
		<form method="post" action="/orders/add" onsubmit="return validar(this)">
			<table class="table">
			<tr>
			<td colspan="2">Registro de pedido</td>
			</tr>
			<tr>
				<td >Nombre <br>(Receptor)</td>
				<td ><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td >RUC</td>
				<td ><input type="text" name="ruc" id="ruc" maxlength="11"></td>
			</tr>
		
			<tr>
				<td >Producto</td>
				<td><select name="product">
								<% if(arrayProducts.size() > 0){ 
									for(Product prod : arrayProducts){
									%>
								<option value=<%=prod.getId() %>><%=prod.getNombre() %></option>

								<%} 
									}%>
				</select></td>
			</tr>
			<tr>
				<td >Cantidad</td>

				<td ><input type="number" name="number" id="number" value="100"></td>
			</tr>
			<tr>
				<td >Detalles</td>
				<td><textarea name="details" rows="4" cols="40" id="details" placeholder="Danos más detalles."></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input	type="submit" value="Crear"></td>
			</tr>
		</table>
	</form>
	</div>
</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">					    </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
</body>
</html>