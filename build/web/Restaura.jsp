<%-- 
    Document   : Restaura
    Created on : 2/09/2018, 05:22:07 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String User=(String)request.getAttribute("User");
    if(User==null){
        response.sendRedirect("index.jsp"); 
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            h1{
                text-align: center;
                color: #063452;
            }
            .Centro{
                background: rgba(95, 152, 235,0.2);
                height:350px;
                margin-left:30%;
                margin-right:30%;
                border-radius: 20px;
                display: inline-block;
                padding: 10px;
            }
            .texto{
                width:80%;
                height:50px;
                margin: 10px;
                margin-left:30px;
            }
            #Boton1{
                width: 80%;
                height:50px;
                margin-left:10%;
                margin-top: 5%;
                border:none;
                background:  #1fc442;
                color: white;
                border-radius: 5px;
                cursor: pointer;
            }
            
        </style>
         <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
        <title>Configuración</title>
    </head>
    <body>
        <div class="Centro">
            <form method="POST" enctype="multipart/form-data" action="Importar">
                <input type="file" name="Archivo" class="file" required>
                <button id="Boton1">Cargar base de datos</button>
            </form><br>
            <form method="POST" enctype="multipart/form-data" action="ImportarCIE10">
                <input type="file" name="Archivo" class="file" required>
                <button id="Boton1">Cargar tabla</button>
            </form>
        </div>
    </body>
</html>
