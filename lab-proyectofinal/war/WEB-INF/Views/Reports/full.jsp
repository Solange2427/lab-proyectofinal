<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.Access"%>
<%@page import="model.entity.AccessAuxiliar"%>
<%@page import="model.entity.Report"%>
<%@page import="model.entity.Users" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>INFORME CANTIDAD USUARIO-PEDIDOS</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
<style>
.jumbotron{
	background-color:#1bac91;
	padding:90px 0 70px;
	color:#fcfcfc;
}
.titulo-blog{
	color:#fff;
	font-size:50px;
}

p {
	color: black;
	font-family: Verdana;
}

body {
	background-color: LightSteelBlue
}
</style>

<script>
            $(document).ready(function(){
                $('.btn-danger').click(function(){
                    var a = confirm("Estas Seguro de Eliminar");
                    if(!a){
                        return false;
                    }
                });
                
            });
            
        </script>
</head>
<body>


    
    
<div class="container-fluid">
<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>

<div class="row">
       <div class="container">
		<div class="table-responsive  ">
			 <table class="table">
			<thead class="thead-dark">
				<tr>
					<th>ID Usuario</th>
					<th>Gmail</th>
					<th># PEDIDOS</th>
					<th>MONTO ACUMULADO</th>
					<th>FECHA FINAL</th>
				
					<th></th>
				</tr>
				</thead>
				<% 
					List<Users> array = (List<Users>)request.getAttribute("arrayUsers");
				
					if(array.size() > 0) {
						
						for(Users r:array){
				%>
				<tr>
					<td><%= r.getCodigo() %></td>
					<td><%= r.getEmail() %></td>
					
					<td><%= r.getCantidadPedidos() %></td>
					<td><%= r.getMontoAdquirido() %></td>
					<td><%= r.getFechaUltimoPedido() %></td>
					
				</tr>
				<% }
				} %>

			</table>
			<div class="text-center">
				<a href="/reports" class="btn btn-block btn-primary">VOLVER A INDICE DE PEDIDOS</a> <br>
			</div>

		</div>

	</div>
	</div> 
    		
</div>

	<script src="/js/jquery-3.3.1.slim.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">					    </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
</body>

</html>