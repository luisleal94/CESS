<%-- 
    Document   : CessAdmin
    Created on : 1/06/2018, 10:30:08 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion=request.getSession(false);
    String usuario=(String)sesion.getAttribute("Usuario");
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    else{
        String gerarquia=(String)sesion.getAttribute("Gerarquia");
        if(gerarquia.equals("Super")){
            response.sendRedirect("CessSuper.jsp"); 
        }
        if(gerarquia.equals("usuario")){
            response.sendRedirect("inicio.jsp"); 
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/EstiloAdmin.css">
        <script type="text/javascript" src="js/NoBack.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">  
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
        <title>CESS</title>
    </head>
    <body onload="nobackbutton();">
        <div id="titulo">
            <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left: 30%; color: #00A99D;">CENTRO DE ESTUDIOS Y SERVICIOS DE SALUD</p>
        </div>       
        <div class="salir">
            <label><% out.println(usuario);%> </label><br>
            <a class="link" href="out">Cerrar sesión</a> 
        </div>
        <div class="container2">
            <img src="img/busqueda.png" width="268" height="289" alt="Avatar" class="image2">
            <a href="pruebas.jsp"><div class="overlay2">
              <div class="text2">Pacientes</div>
            </div></a>
        </div>
        <div class="container1">
            <img src="img/person.png" width="268" height="289" alt="Avatar" class="image1">
            <a href="BuscaConsulta.jsp"><div class="overlay1">
              <div class="text1">Historial de Consultas</div>
            </div></a>
        </div>
            
        <div class="container3">
            <img src="img/historial.png" width="268" height="289" alt="Avatar" class="image3">
            <a href="Receta.jsp"><div class="overlay3">
              <div class="text3">Receta Médica</div>
            </div></a>
        </div>
    </body>
</html>
