<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link  rel="stylesheet" type="text/css" href="/css/bootstrap.css">
 
<style>
p {
	color: black;
	font-family: Verdana;
}

body {
	background-color: LightSteelBlue
}
</style>

</head>
<body>
	<header class="container"> <h3><a href="/inicio" ><span class="label label-danger">Inicio </span></a></h3> </header>
	
	<div class="container">
		<div class="row">
			<div>
				<h3 class="titulo text-center">INSERTAR RECURSO </h3>
				<form id="form1" class="form-horizontal" action="/resources/add"
					method="POST">
					<div class="form-group">
						<label class="text" control-label">URL de Recurso</label>
						<div class="col-sm-14">
							<input class="form-control" placeholder="Ingrese URL del Recurso " autofocus name="url"
								type="text" required>
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-primary btn-block" id="enviar" type="submit">Agregar Recurso</button>
					</div>
				</form>
				<div class="text-center">

					<div id="cargando" style="display: inline-block"></div>
					<div id="resultado"></div>
				</div>
			</div>
		</div>
	</div>
	<br>
<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
	</body>
</html>