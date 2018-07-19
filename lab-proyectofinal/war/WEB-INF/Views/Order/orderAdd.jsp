<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="java.util.List"%>
<%@ page import="controller.PMF"%>
<%@page import="model.entity.Product"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rey de Reyes</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="/CSS2/bootstrap.min.css">
<script type="text/javascript">
	function validar(f) {
		var msg = "Todos los campos son obligatorios";
		if (f.name.value == "" || f.product.value == ""
				|| f.details.value == "") {
			alert(msg);
			return false;
		} else if (/^\s+|\s+$/.test(f.name.value)) {
			alert("Ingrese un nombre")
			return false;
		}

		else if (/^\s+|\s+$/.test(f.product.value)) {
			alert("Ingrese el tipo de producto")
			return false;
		} else if (/^\s+|\s+$/.test(f.details.value)) {
			alert("Ingrese algunos detalles")
			return false;
		}
	}
</script>
<style>
.jumbotron {
	background-color: #C0FCD1;
}

.breadcrumb {
	background-color: #C0FCD1;
}
</style>
</head>
<body>
<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>
	<div class="container">

		<div>
			<div id="formulario">
				<%
					PersistenceManager pm = PMF.get().getPersistenceManager();
				%>
				<%
					String query = "select from " + Product.class.getName();
					List<Product> arrayProducts = (List<Product>) pm.newQuery(query).execute();
				%>
				<h2 class="text-info"><strong>Formulario de Pedido</strong></h2>
				<form method="post" action="/orders/add"
					onsubmit="return validar(this)"> 
					<table class="container">

						<tr>
							<td>Nombre <br>(Receptor)
							</td>
							<td><input type="text" name="name" id="name"></td>
						</tr>
						<tr>
							<td>RUC</td>
							<td><input type="text" name="ruc" id="ruc" maxlength="11"></td>
						</tr>

						<tr>
							<td>Producto</td>
							<td><select name="product">
									<%
										if (arrayProducts.size() > 0) {
											for (Product prod : arrayProducts) {
									%>
									<option value=<%=prod.getId()%>><%=prod.getNombre()%></option>

									<%
										}
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td>Cantidad</td>

							<td><input type="number" name="number" id="number"
								value="100"></td>
						</tr>
						<tr>
							<td>Detalles</td>
							<td><textarea name="details" rows="4" cols="40" id="details"
									placeholder="Danos más detalles."></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Crear"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
</body>
</html>