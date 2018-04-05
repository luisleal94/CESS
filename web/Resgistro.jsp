<%-- 
    Document   : Resgistro
    Created on : 25/03/2018, 06:11:51 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CESS</title>
    </head>
    <body>
        <h1>Registro de usuario</h1>
        <form action="resgistrar" method="post">
            <input type="text" name="nombre" placeholder="Nombre" required=""><br>
            <input type="text" name="apellido" placeholder="Apellido" required=""><br>
            <input type="password" name="pass" placeholder="Contraseña" required=""><br>
            <input type="number" name="id" placeholder="Identiicador" required=""><br>
            <input type="submit" value="Registrar">
        </form>
    </body>
</html>
