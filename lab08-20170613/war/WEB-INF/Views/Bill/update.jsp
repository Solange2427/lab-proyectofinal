
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Order"%>
<%@ page import="model.entity.Product"%>
<%@ page import="model.entity.Bills"%>
<%@ page import="controller.PMF"%>
<%
	Bills factura = (Bills) request.getAttribute("factura");
%>

<%
	Order orden = (Order) request.getAttribute("order");
%>
<%
	Product producto = (Product) request.getAttribute("product");
%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="col-xs-6">
			<h1>
				<a href=" "><img alt="" src="logo.png" /> REY DE REYES </a>
			</h1>
			<h6>EMPRESA COMERCIALIZADORA DE PAPELERIA EN GENERAL S.A.C.</h6>
			<h6>PUNTO DE EMISION:San Camilo 308 tda.4-21 Galerias 'San
				Geronimo</h6>
		</div>
		<div class="col-xs-6 text-right">
			<div class="panel panel-default">
				<div class="panel-body">
					<DIV>
						<h4>
							<center>R.U.C. 20557079441</center>
						</h4>
					</div>
					<DIV>
						<h4>
							<center>FACTURA DE VENTA</center>
						</h4>
					</div>
					<div>
						<h4>
							<center>ELECTRONICA</center>
						</h4>
					</div>
					<h1>
						<small>Factura #001</small>
					</h1>
				</div>
			</div>
		</div>

		<hr />
	</div>
	<form method="post" action="/bills/update">
		<input type="text" hidden name="id" value=<%=factura.getId()%>>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body" c>
					<div class="col-md-6">
						<DIV>
							<h5>
								CLIENTE: <input type="text" class="form-control"
									name="nombreCliente" value="<%=factura.getNameClient()%>"
									required>
							</h5>
						</div>
						<DIV>
							<h5>
								Ruc del cliente: <input type="text" class="form-control"
									name="rucCliente" value="<%=factura.getRucClient()%>" required>
							</h5>
						</div>
					</div>
					<div class="col-md-6">
						<div>
							</h5>
							CODIGO: <input type="text" class="form-control" name="idPedido"
								value="<%=factura.getIdPedido()%>" readonly required>
						</div>
						<div>
							</h5>
							Fecha de emision: <input type="text" class="form-control"
								name="fecha" value="<%=factura.getDate()%>" readonly required>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<table class="table table-bordered">
				<thead>
					<tr class="info">
						<th>
							<h4>DESCRIPCION DEL PRODUCTO</h4>
						</th>
						<th>
							<h4>CANTIDAD</h4>
						</th>
						<th>
							<h4>PRECIO</h4>
						</th>
						<th>
							<h4>Sub-Total</h4>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>

						<td><input type="text" class="form-control"
							name="nombreProducto" value="<%=factura.getNameProduct()%>"
							readonly required></td>
						<td><a href="#"> <input type="text" class="form-control"
								name="cantidad" value="<%=factura.getQuantityProduct()%>"
								readonly required></a></td>
						<td class=" text-right "><input type="text"
							class="form-control" name="precio"
							value="<%=factura.getPriceProduct()%>" readonly required></td>
						<td class=" text-right "><input type="text"
							class="form-control" name="subtotal" value=" 00.0 S/" readonly
							required></td>

					</tr>
					<tr>
						<td>-----------------------------------------------------</td>
						<td><a href="#"> </a></td>
						<td class="text-right"></td>
						<td class="text-right "></td>

					</tr>
					<tr>
						<td>-----------------------------------------------------</td>
						<td><a href="#"> </a></td>
						<td class="text-right "></td>
						<td class="text-right"></td>

					</tr>
				</tbody>
			</table>
		</div>

		<div class="container">
			<div class="row text-right">
				<div class="col-xs-3 col-xs-offset-7">
					<strong> <%
 	double igv = factura.getTotal() * 0.18;
 %> <%
 	double subtotal = factura.getTotal() - igv;
 %>

						<div>Sub Total:</div>
						<div>Impuestos (IGv 18%):</div>
						<div>Total:</div>
					</strong>
				</div>
				<div class="col-xs-2">
					<strong>
						<div>
							<input type="text" class="form-control" name="subtotal"
								value="<%=subtotal%>" readonly required>
						</div>
						<div>
							<input type="text" class="form-control" name="ig"
								value="<%=igv%>" readonly required>
						</div>
						<div>
							<input type="text" class="form-control" name="total"
								value="<%=factura.getTotal()%>" readonly required>
						</div>

					</strong>
				</div>
			</div>
		</div>
		<button class="btn btn-block btn-primary" id="enviar" type="submit">Modificar</button>
	</form>



	<!-- Librería jQuery requerida por los plugins de JavaScript -->
	<script src="http://code.jquery.com/jquery.js"></script>

	<!-- Todos los plugins JavaScript de Bootstrap (también puedes
         incluir archivos JavaScript individuales de los únicos
         plugins que utilices) -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
</body>
</html>