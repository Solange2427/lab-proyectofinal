<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page  import="javax.jdo.PersistenceManager" %>
<%@page import="java.util.List"%>

<%@page import="model.entity.Order"%>
<%@page import="model.entity.Product"%>
<%@page import="model.entity.Users"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REPORTE FINANCIERO</title>
<!-- Bootstrap CSS -->
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">

</head>
<body>

<% Order orden= (Order) request.getAttribute("order");%>
<% Product producto= (Product) request.getAttribute("product");%>

<% Users usuario= (Users) request.getAttribute("IdLogin");%>

<% double Total = producto.getPrecio()* orden.getNumber(); %>
<% double Igv = Total*0.18; %>
<% double Inversion = (Total-Igv)*0.6; %>
<% double Saldo = (Total-Igv)*0.4; %>

<div class="text-center">
<h1>INFORME - GENERAL </h1>

<form method="post" class="form-horizontal" action="/reports/add">

<div class="form-group row">
  <label for="example-text-input" class="col-2 col-form-label">ID USUARIO</label>
  <div class="col-5">
    <input class="form-control" type="text" name="id" value="<%=usuario.getCodigo() %>" readonly required>
  </div>
</div>





<div class="form-group row">
  <label for="example-text-input" class="col-2 col-form-label">Nombre Cliente</label>
  <div class="col-5">
    <input class="form-control" type="text" name="cliente" value="<%=orden.getName() %>" readonly required>
  </div>
</div>
<div class="form-group row">
  <label for="example-search-input" class="col-2 col-form-label">Ruc - Cliente</label>
  <div class="col-5">
    <input class="form-control" type="text" name="ruc" value="<%=orden.getRuc() %>" readonly required>
  </div>
</div>
<div class="form-group row">
  <label for="example-email-input" class="col-2 col-form-label">Id Pedido</label>
  <div class="col-5">
    <input class="form-control" type="text" name="idPedido" value="<%=orden.getIdOrder() %>" readonly required>
  </div>
</div>
<div class="form-group row">
  <label for="example-url-input" class="col-2 col-form-label">Fecha - Pedido</label>
  <div class="col-5">
    <input class="form-control" type="text" name="fechaPedido" value="<%=orden.getCreate() %>" readonly required>
  </div>
</div>
<div class="form-group row">
  <label for="example-tel-input" class="col-2 col-form-label">Monto a Invertir</label>
  <div class="col-5">
    <input class="form-control" type="number" name="inversion" value="<%=Inversion%>" readonly required>
  </div>
</div>
<div class="form-group row">
  <label for="example-password-input" class="col-2 col-form-label">IGV</label>
  <div class="col-5">
    <input class="form-control" type="number" name="igv" value="<%=Igv%>" readonly required>
  </div>
</div>
<div class="form-group row">
  <label for="example-number-input" class="col-2 col-form-label">Monto Total</label>
  <div class="col-5">
    <input class="form-control" type="number" name="total" value="<%=Total%>" readonly required>
  </div>
</div>
<div class="form-group row">
  <label for="example-datetime-local-input" class="col-2 col-form-label">Ganancia Estimada</label>
  <div class="col-5">
    <input class="form-control" type="number" name="saldo" value="<%=Saldo%>" readonly required>
  </div>
</div>
<div class="form-group row">
  <label for="example-date-input" class="col-2 col-form-label">Fecha de Entrega</label>
  <div class="col-5">
    <input class="form-control" type="date" name=fechaFinal value="2018-07-17" id="example-date-input">
  </div>
</div>

<div class="text-right">
						<button class="btn btn-primary btn-block" id="enviar" type="submit">CREAR INFORME</button>
					</div>

</form>

</div>
</body>
<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

</html>