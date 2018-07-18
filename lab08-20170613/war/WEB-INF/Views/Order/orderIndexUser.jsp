<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%> 
<%@ page import="model.entity.Order"%> 
<%   
List<Order> orders= (List<Order>)request.getAttribute("orders"); 
%>  
<html> 
<head> 
<title>Pedidos</title> 
 <style type="text/css">
  body {
  margin:0;
   padding:0;
   background:#ccccff;
   font-family: Verdana, Arial, sans-serif;
    }
  #menu {
 	height: 60px;
 	width: 100%;
    background-color: #000;
    padding:0;
    margin:0;
	}
	#menu ul{
	margin-left:600px;
	}
  #menu ul li{
  list-style:none;
	float:left;
    line-height:60px;
	}

   #menu ul li a {
  	color: #fff;
 	text-decoration: none;
	padding: 10px;
 	background: #666;
 	border-radius:10px;
 	margin-left:5px;
 	-webkit-transition-duration:2s;
 	}
 	
 #menu ul li a:hover {
 background-color: #2586d7;
 color:#000;
 -webkit-transition-duration:2s;
  }
 #menu h1{
 	float:left;
 	color:#FFF;
 	line-height:20px;
 	margin-left:50px;
 }
 #menuV{
 width:180px;
 height:50px;
 background:#000;
 position: absolute;
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
<div id="menu">
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
	  <li><a href="/orders/add"/>Crear nuevo pedido</a></li>
	  </ul>
</div>     
    <%  if (orders.size() > 0) { %>  
<table padding=1 border=1>
     <tr       bgcolor="#407BA8">       
        <td       style="color:       #ffffff;       font-weight:  bold;">Nombre</td>       
        <td       style="color:       #ffffff;       font-weight:  bold;">Ruc</td>       
        <td       style="color:       #ffffff;       font-weight:  bold;">Email</td> 
        <td       style="color:       #ffffff;       font-weight:  bold;">Producto</td> 
        <td       style="color:       #ffffff;       font-weight:  bold;">Cantidad</td> 
		<td       style="color:       #ffffff;       font-weight:  bold;">Descripción</td>
		<td       style="color:       #ffffff;       font-weight:  bold;">Estado</td> 
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
       <p/>  
          
</body> 
</html> 