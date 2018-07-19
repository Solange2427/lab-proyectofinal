<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.Users"%>
<%@page import="model.entity.Report"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap CSS -->
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
<% Report reporte= (Report) request.getAttribute("reporte");%>
<% Users usuario= (Users) request.getAttribute("usuario");%>
<table class="table">
<thead class="thead-dark">
<tr>
<th>Sets</th>
<th>Informacion</th>

</tr>
</thead>
<tr>
<td>NOMBRE CLIENTE</td>
<td><%=reporte.getNombreCliente() %></td>

</tr>
<tfoot>
<tr>
<th>FECHA DE CULMINACION </th>
<th><%=reporte.getFechaFinal() %></th>

</tr>
</tfoot>
<tbody>
<tr>
<td>RUC CLIENTE</td>
<td><%=reporte.getRucCliente() %></td>

</tr>
<tr>
<td>ID PEDIDO</td>
<td><%=reporte.getIdPedido() %></td>

</tr>
<tr>
<td>FECHA DEL PEDIDO</td>

<td><%=reporte.getFechaInicial() %></td>
</tr>
<tr>
<td>INVERSION</td>
<td><%=reporte.getInversion() %></td>

</tr>
<tr>
<td>IGV</td>
<td><%=reporte.getIgv() %></td>

</tr>
<tr>
<td>GANANCIA APROX.</td>
<td><%=reporte.getSaldo() %></td>

</tr>
<tr>
<td>MONTO TOTAL</td>
<td><%=reporte.getTotal() %></td>

</tr>
</tr>


</tbody>
</table>
</body>
<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</html>