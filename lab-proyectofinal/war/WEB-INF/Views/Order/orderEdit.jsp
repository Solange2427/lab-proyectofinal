<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page  import="javax.jdo.PersistenceManager" %>
<%@page import="java.util.List"%>
<%@ page import="controller.PMF"%>
<%@page import="model.entity.Product"%>
<%@page import="model.entity.Order"%>

<%   Order order = (Order)request.getAttribute("order"); %> 
<!DOCTYPE html>
<html>
<head>
<title>Cambios</title>
<link rel="stylesheet" type="text/css" href="/CSS2/bootstrap.min.css">
<script type="text/javascript">
function validar(f) {
   var msg = "Todos los campos son obligatorios";
  if(f.name.value == "" || f.details.value ==""){
      alert(msg);
  return false;
  }
  else if(/^\s+|\s+$/.test(f.name.value)){
	  alert("Ingrese un nombre")
	  return false;
  }
 
  else if(/^\s+|\s+$/.test(f.details.value)){
	  alert("Ingrese algunos detalles")
	  return false;
  }
  }
</script>
 <style type="text/css">
  body {
   background:#ccccff;}
  </style>
</head>
<body>
<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>
	<div class="container">

<div> 
 	<%  PersistenceManager pm = PMF.get().getPersistenceManager(); %>
			<% String query = "select from " + Product.class.getName(); 
			 List<Product> arrayProducts = (List<Product>) pm.newQuery(query).execute();  
			%>
			<h3 class="text-info"><strong>Modificar Pedido</strong></h3>
<table class="table">
	<form method="post" action="/orders/edit" onsubmit="return validar(this)">

			<tr>
				<th >Nombre </th>
				<td ><input type="text" name="name" id="name" value="<%= order.getName()%>"></td>
			</tr>
			<tr>
				<th >RUC </th>
				<td ><input type="text" name="ruc" id="ruc" maxlength="11" value="<%= order.getRuc()%>"></td>
			</tr>
					
			<tr>
				<th >Producto</th>
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
				<th >Cantidad</th>

				<td ><input type="number" name="number" id="number" value="<%= order.getNumber()%>"></td>
			</tr>
			<tr>
				<th >Detalles</th>
				<td><textarea name="details" rows="4" cols="40" id="details" placeholder="Danos más detalles."><%= order.getDetails() %></textarea></td>
				<input type="hidden" name="id" value="<%=order.getIdOrder()%>" >
			</tr>
			<tr>
				<td colspan="2"><input	type="submit" value="Enviar" class="btn btn-success"></td>
			</tr>
	</form>
	</table>
</div>
</div>
</body>
</html> 