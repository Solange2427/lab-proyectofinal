<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.entity.Order"%> 
<%   
Order a = (Order)request.getAttribute("order"); 
%> 
<html> 
<head> 
<title>Pedido</title> 
 <style type="text/css">
  body {
  margin:0;
   padding:0;
   background:#ccccff;
   font-family: Verdana, Arial, sans-serif;
    }
  
 #menuV h4{
 	font-family:arial, sans-serif;
 	font-weight: 400;
 	height: 40px;
 	background: #16A5C7;
 	width: 100%;
 	color:white;
 	line-height:50px;
 }
  </style>
</head> 
<body>  
<div >
<h1>REY DE REYES</h1>
 <ul>
	<li><a href="/roles"/>Roles</a>	</li>
	<li><a href="/users"/>Users</a>	</li>
	<li><a href="/resources"/>Resources</a>	</li>
	<li><a href="/access"/>Access</a>	</li>
	<li><a href="/orders"/>Pedidos</a>	</li>
	<li><a href="/users/login"/>Login</a> </li>
	<li><a href="/users/logout"/>Logout</a>	</li>
 </ul>  
</div>
<div id="menuV">
	<h4 >Acciones</h4>
	 <ul>
	    <li><a href="/orders/edit?orderId=<%= a.getIdOrder()%>">Editar Orden</a> </li>
        <li><a href="/orders/delete?orderId=<%= a.getIdOrder()%>">Borrar</a></li>
        <li><a href="/orders">Lista de Pedidos</a> </li>
        <li><a href="/orders/add"/>Crear nuevo Pedido</a></li>
        <li><a href="/bills/add?orderId=<%=a.getIdOrder()%>">Generar factura</a></li>
        
    </ul>
</div>
<div align="center">
 <table>
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
</div>       
</body> 
</html> 