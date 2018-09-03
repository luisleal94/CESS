<%-- 
    Document   : Carga
    Created on : 29/08/2018, 06:07:10 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            #link{
                text-decoration: none;
                padding: 3px;
                display: inline-block;
                background:  #1798cc ;
                font-weight:700; 
                color: white;
                border-radius: 3px;
            }

            #link:hover{
                text-decoration: none;
                padding: 3px;
                display: inline-block;
                background:#10688c;
                font-weight:700; 
                color: white;
                border-radius: 3px;
                transition: 0.3s;
            }
        </style>
         <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
        <title>Configuracion</title>
    </head>
    <body>
        <a id="link" href="index.jsp">Inicio</a>
        <h1>Identificación</h1>
        <div class="Centro">
            <form method="POST" action="Valida">
                <input type="text" name="User" class="texto"  placeholder="Usuario" required="true">
                <input type="password" name="Pass" class="texto" placeholder="Password" required="true">
                <input type="submit" value="Entrar" id="Boton1"> 
            </form>
           
        </div>
    </body>
</html>
