<%-- 
    Document   : Personal
    Created on : 4/06/2018, 11:43:39 AM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>CESS</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="css/Personal.css">	
        <script type="text/javascript" src="js/Validacion.js"></script>
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
</head>
<body>
        <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left:44%; color: #00A99D;">Registro</p>
     <a id="link" href="CessSuper.jsp">Regresar</a>
	<div id="contenido">
		<form id="formulario" action="registrarPersonal" method="post">
                    <input class="input1" type="text" name="user" placeholder="Nombre de Usuario" required>
		    <input class="input1" type="text" name="nombre" placeholder="Nombre" required>
		    <input class="input1" type="text" name="apellido" placeholder="Apellidos" required><br>
		    <input class="input1" type="password" name="pass" placeholder="Contraseña" required>
		    <input class="input1" type="text" name="tele" placeholder="Teléfono" onkeyUp="return Telefono(this)" required><br>		   
		    <input class="input1" type="text" name="Especialidad" placeholder="Especialidad" required><br>
                    <input class="input1" type="text" name="Cedula" placeholder="Cedula O Pre Cedula" required><br>
		   	<div>
				<input type="radio" id="super" name="gerar" value="Super" checked>
				<label for="super" class="label">Super Usuario</label>
				<input type="radio" id="admin" name="gerar" value="Admin">
				<label for="admin" class="label">Administrador</label> 
				<input type="radio" id="user" name="gerar" value="usuario">
				<label for="user" class="label">Médico</label>
			</div> 
		    <div class="boton">
		      <input class="enter1" type="submit" value="Registrar">
                      <a href="CessSuper.jsp" class="enter2" style="text-align:center">Regresar</a>
		    </div>
	  	</form>
	</div>
</body>
</html>
