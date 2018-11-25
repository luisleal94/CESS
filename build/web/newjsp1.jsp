<%-- 
    Document   : newjsp1
    Created on : 29/09/2018, 07:16:07 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession(false); //Sesion
    String Nombre="",IdMedico="",Paciente="",Edad="";
    Nombre=(String)sesion.getAttribute("Nombre");
    IdMedico=(String)request.getAttribute("Doctor");
    Paciente=(String)request.getAttribute("Paciente");
    Edad=(String)request.getAttribute("Edad");
    System.out.println(IdMedico+" "+Paciente+" "+Edad+" "+Nombre);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
