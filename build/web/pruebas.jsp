<%-- 
    Document   : pruebas
    Created on : 6/04/2018, 11:25:20 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
        <title>JSP Page</title>
    </head>
    <body>
      <a href="inicio.jsp">Regresar</a>
        <form action="" method="post">
            <a href="historial.jsp">Mostrar tabla de pacientes</a>
            <p>Nombre</p>
            <input name="nombre" type="text">
            <input type="submit" value="Bucar">            
        </form>
      
      <% //Busqueda por nombre del usuario a buscar
          String nombre=request.getParameter("nombre");
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
        
        <!--Mando el parametro ID del paciente que encontre-->
        <a href="HistoriaClinica.jsp?id=<%=rs.getString("idPacientes")%>" >Ver historial</a>
        <a href="editar.jsp?id=<%=rs.getString("idPacientes")%>">Editar</a>
        <a href="eliminar.jsp?id=<%=rs.getString("idPacientes")%>">Eliminar</a>
            
    <% } %>
    
    
    </body>
</html>
