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
            .Centro{
                background: rgba(95, 152, 235,0.2);
                height:500px;
                margin-left: 20%;
                margin-right:25%;
                border-radius: 20px;
                
            }
            #Boton1{
                width: 80%;
                height:50px;
                margin-left:10%;
                margin-top: 10%;
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
        <title>Configuracion</title>
    </head>
    <body>
        
            <h1>PRIMEROS PASOS</h1>
        <div class="Centro">
            <form method="POST" enctype="multipart/form-data" action="Importar">
                <input type="file" name="Archivo" class="file">
                <button id="Boton1">Cargar base de datos</button>
            </form>
           
        </div>
    </body>
</html>
