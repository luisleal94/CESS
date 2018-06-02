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
    /*if(usuario.equals("")){
        response.sendRedirect("index.jsp"); 
    }*/
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/EstiloAdmin.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">  
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="titulo">
            <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left: 30%; color: #00A99D;">CENTRO DE ESTUDIOS Y SERVICIOS DE SALUD</p>
        </div>
        <h1>Hola Administrador</h1>
        <div class="salir">
            <label><% out.println(usuario.toUpperCase());%> </label><br>
            <a class="link" href="out">Cerrar sesión</a> 
        </div>
    </body>
</html>
