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
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    /*if(usuario.equals("")){
        response.sendRedirect("index.jsp"); 
    }*/
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/estilo2.css">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Bienvenido usuario</h1>
        <label><% out.println(usuario);%> </label><br>
        <a href="out">Cerrar sesión</a>  
        
        <input type="checkbox" id="activaventana" name="activaventana">
        <label for="activaventana" id="label">Registrar Paciente</label>
        <label id="label"><a href="pruebas.jsp" style="text-decoration:none; color: white">Historial clinico</a></label>
        <label id="label">Consulta médica</label>
        <label id="label">Odontologia</label>
        <label id="label">Nutricion</label>
        <label id="label">Bioanálisis</label>
        
        <div class="VentModal">
            <div class="contenido">
                <form id="formulario" action="registrarP" method="post">
                    <input class="input1" type="text" name="nombre" placeholder="Nombre" required>
                    <input class="input1" type="text" name="apellido1" placeholder="Apellido Paterno" required>
                    <input class="input1" type="text" name="apellido2" placeholder="Apelllido Materno" required>
                    <input class="input1" type="number" name="edad" placeholder="Edad" required>
                    <input type="text" name="telefono" placeholder="Telefono" required>
                    <div class="boton">
                    <input class="enter1" type="submit" value="Registrar">
                    <label class="enter2" for="activaventana" id="cierramodal" style="text-align:center">Salir</label>
                    </div>
                </form>
            </div>
	</div>    
    </body>
</html>
