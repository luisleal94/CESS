<%-- 
    Document   : historial
    Created on : 26/03/2018, 04:29:34 PM
    Author     : luis
--%>

<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession(false); //Sesion
    //Obtengo atributo
    
    String usuario=(String)sesion.getAttribute("Usuario");
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    /*if(usuario.equals("")){
        response.sendRedirect("index.jsp"); 
    }*/
    Conexion con= new Conexion();
    PreparedStatement pst;
    ResultSet rs;
    pst = con.getConexion().prepareStatement("Select * from Pacientes");
    rs=pst.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo2.css">
        <title>CESS UV</title>
    </head>
    <body >
        <a href="pruebas.jsp">Buscar historial</a>
        <a href="inicio.jsp">Inicio</a>
        <label>Nombre del paciente</label>
        <input type="text" name="nombre">
        
        <table id="tabla">
            <tr>
                <th>Fecha de Ingreso</th>
                <th>Nombre</th>
                <th>Apellido Paterno</th>
                <th>Apellido Materno</th>
                <th>Edad</th>
                <th>Telefono</th>
            </tr>
             <%  while(rs.next()){  %>
            <tr>
                <td><%=rs.getString("fecha")%></td>
                <td><%=rs.getString("Nombre")%></td>
                <td><%=rs.getString("Apellido_P")%></td>
                <td><%=rs.getString("Apellido_M")%></td>
                <td><%=rs.getString("Edad")%></td>
                <td><%=rs.getString("Telefono")%></td>
                <td>            
                    <a href="editar.jsp?id=<%=rs.getString("idPacientes")%>">Editar</a>
                    <a href="eliminar.jsp?id=<%=rs.getString("idPacientes")%>">Eliminar</a>
                    <a href="HistoriaClinica.jsp?id=<%=rs.getString("idPacientes")%>">Generar historial</a>
                </td>
            </tr>
            <% } %>  
            
        </table>
    </body>
</html>
