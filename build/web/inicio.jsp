<%-- 
    Document   : inicio
    Created on : 25/03/2018, 06:39:25 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Obtengo atributo
    HttpSession sesion=request.getSession(false);
    String usuario=(String)sesion.getAttribute("Usuario");
    String gerarquia=(String)sesion.getAttribute("Gerarquia");
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    else{
        if(gerarquia.equals("Admin")){
            response.sendRedirect("CessAdmin.jsp"); 
        }
        if(gerarquia.equals("Super")){
            response.sendRedirect("CessSuper.jsp"); 
        }
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
         <link rel="stylesheet" href="css/estilo2.css">
         <script type="text/javascript" src="js/Validacion.js"></script>
         <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }
		#popup {
   visibility: hidden;
   opacity: 0;
   margin-top: -300px;
}

#popup:target {
   visibility:visible;
   opacity: 1;
   background-color: rgba(0,0,0,0.8);
   position: fixed;
   top:0;
   left:0;
   right:0;
   bottom:0;
   margin:0;
   z-index: 999;
   transition:all 0.8s;
}
.popup-contenedor {
   position: relative;
   margin:2% auto;
   padding:30px 50px;
   background-color: #fafafa;
   color:#333;
   border-radius: 3px;
   width:50%;
}
a.popup-cerrar {
   position: absolute;
   top:3px;
   right:3px;
   background-color: #333;
   padding:7px 10px;
   font-size: 20px;
   text-decoration: none;
   line-height: 1;
   color:#fff;
}

#titulo{
    background: black;
}

.salir{
    background: orange;
    padding: 5px;
    width: 10%;
    text-align: center;
    margin-left:87%;
    border-radius: 5px;
    color: white;
    font-weight: 700;
}

.salir:hover{
    background:  #e74c3c;
    padding: 5px;
    width: 10%;
    text-align: center;
    margin-left:87%;
    border-radius: 5px;
    color: white;
    text-decoration: none;
}
.link{
    text-decoration: none;
    color: white;
}
        </style>
    </head>
    <body>
        <div id="titulo">
            <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left: 30%; color: #00A99D;">CENTRO DE ESTUDIOS Y SERVICIOS DE SALUD</p>
        </div>
        <div class="salir">
            <label><% out.println(usuario);%> </label><br>
            <a class="link" href="out">Cerrar sesión</a> 
        </div>
<div class="container">
  <img src="img/agregarpaciente.png" width="268" height="289" alt="Avatar" class="image">
  <div class="overlay">  
   <a href="#popup" class="popup-link" style="text-decoration:none" id="text" >Agregar Paciente</a>
  </div>
</div>
<div class="container1">
    <img src="img/person.png" width="268" height="289" alt="Avatar" class="image1">
    <a href="BuscaConsulta.jsp"><div class="overlay1">
    <div class="text1">Historial de Consultas</div>
    </div></a>
</div>
<div class="container3">
  <img src="img/historial.png" width="268" height="289"; alt="Avatar" class="image3">
  <a href="Receta.jsp"><div class="overlay3">
    <div class="text3">Receta Médica</div>
  </div></a>
</div>
<div class="container4">
  <img src="img/consulta.png" width="268" height="289"; alt="Avatar" class="image4">
  <a href="Consulta.jsp"> <div class="overlay4">
    <div class="text4">Consulta</div>
  </div></a>
</div>        
    <div class="modal-wrapper" id="popup">
       <div id="contenido">
		<form id="formulario" action="registrarP" method="post">
		    <input class="input1" type="text" name="nombre" placeholder="Nombre" required>
		    <input class="input1" type="text" name="apellido1" placeholder="Apellido Paterno" required><br>
		    <input class="input1" type="text" name="apellido2" placeholder="Apelllido Materno" required>
		    <input class="input1" type="text" name="edad" placeholder="Edad" onkeyUp="return Edad(this)" required><br>
                    <input class="input1" type="text" name="telefono" placeholder="Telefono"  onkeyUp="return Telefono(this)" required>
		    <input class="input1" type="text" name="domicilio" placeholder="Domicilio" required ><br>
                    <label>Estado Civil</label>
                    <select name="estado_civil">
                        <option value="Soltero">Soltero</option>
                        <option value="Casado">Casado</option>
                        <option value="Viudo">Viudo</option>
                        <option value="Union Libre">Union Libre</option>
                        <option value="Divorciado">Divorciado</option>
                    </select>             
		    <input class="input1" type="text" name="ocupacion" placeholder="Ocupación" required><br>
		    <input class="input1" type="text" name="curp" placeholder="CURP" required><br>
		   	<div>
				<input type="radio" id="hombre" name="sexo" value="Masculino" checked>
				<label for="hombre" class="label">Masculino</label>
				<input type="radio" id="Mujer" name="sexo" value="Femenino">
				<label for="Mujer" class="label">Femenino</label> 
			</div> 
		    <div class="boton">
		      <input class="enter1" type="submit" value="Registrar">
		      <a class="enter2" style="text-align:center" href="#">Salir</a>
		    </div>
	  	</form>
	</div>
   </div>
    </body>
</html>
