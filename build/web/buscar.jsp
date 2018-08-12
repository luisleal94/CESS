<%-- 
    Document   : buscar.jsp
    Created on : 4/04/2018, 10:27:52 AM
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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo2.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 
        <title>JSP Page</title>
    </head>
    <body>
        <a href="historial.jsp">Regresar</a>
        <form action="" method="post">
            <p>Nombre</p>
            <input name="nombre" type="text">
            <input type="submit" value="Bucar">            
        </form>
        
    <% String nombre=request.getParameter("nombre");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"'");
        rs=pst.executeQuery();
        while(rs.next()){
    %>
         <h2>Datos del paciente</h2>
         <form action="" method="post">
            <label id="titulos">Nombre</label>
            <input type="text" name="nombre" value="<%=rs.getString("Nombre")%>" disabled style="color: #273746" >
            <label id="titulos">Apellido Paterno</label>
            <input type="text" name="apellidoP" value="<%=rs.getString("Apellido_P")%>" disabled style="color: #273746">
            <label id="titulos">Apellido Materno</label>
            <input type="text" name="apellidoM" value="<%=rs.getString("Apellido_M")%>" disabled style="color: #273746">
            <label id="titulos">Edad</label>
            <input type="text" name="edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746">
            <label id="titulos">Telefono</label>
            <input type="text" name="tele" value="<%=rs.getString("telefono")%>" disabled style="color: #273746">       
        </form>
    <% } %>
    </body>
</html>
