<%-- 
    Document   : eliminar
    Created on : 27/03/2018, 04:32:00 PM
    Author     : luis
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CESS</title>
    </head>
    <body>
        <%
            String id=request.getParameter("id");
            Conexion con= new Conexion();
            PreparedStatement pst;
            ResultSet rs;
            pst = con.getConexion().prepareStatement("delete from Pacientes where idPacientes="+id);
            pst.executeUpdate();
            response.sendRedirect("historial.jsp");
        %>
    </body>
</html>
