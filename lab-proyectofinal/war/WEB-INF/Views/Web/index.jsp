<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name='viewport'
	content='width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0,minimun-scale=1.0'>
<link rel='stylesheet' href="/CSS2/bootstrap.min.css">
<link rel='stylesheet' href="/CSS2/cargando.css">
<script type="text/javascript" src="/JS2/jQuery.js"></script>
<script type="text/javascript" src="/JS2/bootstrap.min.js"></script>
<style>
.jumbotron {
	background-color: #1bac91;
	padding: 90px 0 70px;
	color: #fcfcfc;
}

.titulo-blog {
	color: #fff;
	font-size: 50px;
}

.span6 {
	width: 460px;
	color: #1bac91;
}

.offset3 {
	margin-left: 260px;
}
</style>
</head>
<body>
	<header> 
	<nav class="navbar  navbar-static-top navbar-inverse primary"
		role="navigation">
	<div class="container">
		
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#navegacion">
			
				<span class="sr-only">Desplegar/Ocultar</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="/inicio" class="navbar-brand" id="colegio">REY DE REYES</a>
		</div>
		<!--Menu Inicia-->
		<div class="collapse navbar-collapse" id="navegacion">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Users<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/users">Users</a></li>
						<li><a href="/users/add">Users Add</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Roles<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/roles">Roles</a></li>
						<li><a href="/roles/add">Roles Add</a></li>
					</ul>
				</li>

				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Resources<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/resources">Resources</a></li>
						<li><a href="/resources/add">Resources Add</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Access<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/access">Access</a></li>
						<li><a href="/access/add">Access Add</a></li>

					</ul>
				</li>
				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Products<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/products">Products</a></li>
						<li><a href="/products/add">Products Add</a></li>
					</ul>
				</li>

				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Orders<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/orders">Orders</a></li>
						<li><a href="/orders/add">Orders Add</a></li>
					</ul>
				</li>

				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Reports<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/reports">Reports</a></li>
						<li><a href="/reports/full">Reports Full</a></li>
					</ul>
				</li>

				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Bills<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/bills">Bills</a></li>
					</ul>
				</li>

			</ul>

			<ul class="nav navbar-nav navbar-right">

				<%
					String estadoSession = (String) request.getAttribute("estado");
					String gmail = (String) request.getAttribute("gmail");
					if (estadoSession == null) {
				%>
				<li><a href="/iniciarSession">Iniciar Session</a></li>
				<%
					} else {
				%>
				<li class="dropdown">
					<!--Un submenu desplegable --> <a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><%=gmail%><span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/cerrarSession">Cerrar Session</a></li>
					</ul>
				</li>
				<%
					}
				%>

			</ul>


		</div>

	</div>
	</nav> <section class="jumbotron">
	<div class="container">
		<center>
			<h1 class="titulo-blog">
				Papeleria <strong>Rey de Reyes</strong>
			</h1>
		</center>
	</div>
	</section>

	<div class="container" id="slider">
		<div id="myCarousel" class="carousel slider" data-ride="carousel">
			<!-- Indicators, pequenas animacione que nos proporciona JQeury con la clase .carousel-slider -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!--Imagenes que ddisoinemos -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/images/img1.jpeg" alt="Img1">
				</div>
				<div class="item">
					<img src="/images/img2.jpeg" alt="Img2">
				</div>
				<div class="item">
					<img src="/images/img3.jpeg" alt="Img3">
				</div>
			</div>

			<!--Controles que nos permite <- -> dezplazar las imagenes -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<br>
</body>
</html>