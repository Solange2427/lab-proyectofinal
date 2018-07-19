
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.entity.Order"%>
<%@ page import="model.entity.Product"%>
<%@ page import="controller.PMF" %>
	
	<% Order orden= (Order) request.getAttribute("order");%>
	<% Product producto= (Product) request.getAttribute("product");%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
  <body>

<div class="container">
    <div class="col-xs-6" >
<h1><a href=" "><img alt="" src="logo.png" /> REY DE REYES </a></h1><h6>EMPRESA COMERCIALIZADORA DE PAPELERIA EN GENERAL S.A.C.</h6>
<h6>PUNTO DE EMISION:San Camilo 308 tda.4-21 Galerias 'San Geronimo</h6>
</div>
<div class="col-xs-6 text-right">
<div class="panel panel-default">
  <div class="panel-body">
  	<DIV><h4><center>R.U.C. 20557079441</center></h4></div>
  	<DIV><h4><center>FACTURA DE VENTA </center></h4></div>
  		<div><h4><center>ELECTRONICA</center></h4></div>
  		<h1><small>Factura #001</small></h1>
  </div>
</div>
</div>
 
<hr />
</div>
<form method="post" action="/bills/add">
<div class="container">
<div class="panel panel-default">
  <div class="panel-body" c>
  	<div class="col-md-6"><DIV><h5>CLIENTE: <input type="text" class="form-control" name="nombreCliente" value="<%=orden.getName()%>" readonly required></h5> </div>
  	<DIV><h5>Ruc del cliente: <input type="text" class="form-control" name="rucCliente" value="<%=orden.getRuc() %>" readonly required></h5></div></div>
  		<div class="col-md-6"><div></h5>CODIGO: <input type="text" class="form-control" name="idPedido" value="<%=orden.getIdOrder()%>" readonly required></div>
  		<div></h5>Fecha de emision:</div></div>
  </div>
</div>
</div>

<div class="container">
<table class="table table-bordered">
	<thead  >
		<tr class="info" >
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
		<tr >
		<td ><input type="text" class="form-control" name="nombreProducto" value="<%=producto.getNombre()%>" readonly required></td>
		<td><a href="#"> <input type="text" class="form-control" name="cantidad" value="<%=orden.getNumber() %>" readonly required></a></td>
		<td class=" text-right "><input type="text" class="form-control" name="precio" value="<%=producto.getPrecio() %>" readonly required></td>
		<td class=" text-right "><input type="text" class="form-control" name="subtotal" value=" 00.0 S/" readonly required></td>
		
		</tr>
		<tr>
		<td>  -----------------------------------------------------  </td>
		<td><a href="#">    </a></td>
		<td class="text-right">  </td>
		<td class="text-right ">   </td>
		
		</tr>
		<tr>
		<td>  -----------------------------------------------------  </td>
		<td><a href="#">      </a></td>
		<td class="text-right "> </td>
		<td class="text-right">  </td>
		
		</tr>
	</tbody>
</table>
</div>
 
<div class="container">
 <div class="row text-right">
<div class="col-xs-3 col-xs-offset-7"><strong>
<div>Sub Total:</div>
<div>Impuestos (IGv 18%):</div>
<div>Total:</div>
</strong></div>
<div class="col-xs-2"><strong>
<div>0.00 S/</div>
<div>0.00 S/</div>
<div>0.00 S/</div>

</strong></div>
</div>
</div>
<div >
        <button type="submit" class="btn btn-primary btn-block">EMITIR FACTURA</button>
      </div>
</form>





<h2>Imprimir una zona específica con jQuery</h2>
  <p><a href="javascript:void(0)" id="imprime">Imprime</a></p>
 
  <div id="myPrintArea">
    Zona que se imprimirá
  </div>

<script type="text/javascript">
$(document).ready(function() {
    $("#imprime").click(function () {
        $("div#myPrintArea").printArea();
    })
});
</script>






    <!-- Librería jQuery requerida por los plugins de JavaScript -->
    <script src="http://code.jquery.com/jquery.js"></script>
 
    <!-- Todos los plugins JavaScript de Bootstrap (también puedes
         incluir archivos JavaScript individuales de los únicos
         plugins que utilices) -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </body>
</html>