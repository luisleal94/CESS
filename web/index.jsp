<%-- 
    Document   : index
    Created on : 25/03/2018, 01:46:05 PM
    Author     : luis
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<%
    //Posiblemente se tenga que borrar
    HttpSession sesion=request.getSession(false);
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CESS</title>
    <link rel="stylesheet" href="css/estilos.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 
    <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }
          </style>
</head> 
<body>
    <div class="contenedor-form">
        <div class="toggle">
            <!--<span> Crear Cuenta</span>-->
        </div>
        
        <div class="formulario">
            <h2 style="text-align: center">Iniciar Sesión</h2><br>
                 <form action="sesion" method="post">            
                    <input type="text" name="Usuario" placeholder="&#128100; Usuario" required>
                    <input type="password" name="pass" placeholder="&#128273; Contraseña" required>
                    <input type="submit" value="Iniciar sesión">
                </form>
            </div>
        
       <!--<div class="formulario">
                <h2>Cuenta Personal CESS</h2>
                <form action="resgistrar" method="post">
                <input type="text" name="nombre" placeholder="Nombre" required>
                <input type="text" name="apellido" placeholder="Apellido" required>
                <input type="password" name="pass" placeholder="Contraseña" required>
                <input type="submit" value="Registrarse">
                </form>              
            </div>-->
    </div>
    <script src="js/jquery-3.1.1.min.js"></script>    
    <script src="js/main.js"></script>
</body>
</html>

