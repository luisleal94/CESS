<%-- 
    Document   : CessSuper
    Created on : 1/06/2018, 10:03:46 PM
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
        if(gerarquia.equals("Admin")){
            response.sendRedirect("CessAdmin.jsp"); 
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
        <link rel="stylesheet" href="css/EstiloSuper.css">
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
        <h1>Hola super administrador</h1>
        <div class="salir">
            <label><% out.println(usuario);%> </label><br>
            <a class="link" href="out">Cerrar sesión</a> 
        </div>
                    
        <div class="container3">
        <img src="img/admin.png" width="268" height="289" alt="Avatar" class="image3">
            <a href="Personal.jsp"><div class="overlay3">
              <div class="text3">Agregar Personal CESS</div>
            </div></a>
        </div>
   
        <div class="container5">
            <img src="img/person.png" width="268" height="289" alt="Avatar" class="image5">
                <a href="MostrarPersonal.jsp"><div class="overlay5">
                  <div class="text5">Listado de Personal</div>
                </div></a>
        </div>
                    
        <div class="container2">
        <img src="img/busqueda.png" width="268" height="289" alt="Avatar" class="image2">
            <a href="pruebas.jsp"><div class="overlay2">
              <div class="text2">Pacientes</div>
            </div></a>
        </div>
            
        <div class="container4">
            <img src="img/consulta.png" width="268" height="289"; alt="Avatar" class="image4">
            <a href="Consulta.jsp"> <div class="overlay4">
              <div class="text4">Consulta</div>
            </div></a>
        </div>
            
    </body>
</html>
