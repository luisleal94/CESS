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
    //Obtengo atributo
    HttpSession sesion=request.getSession(false);
    String usuario=(String)sesion.getAttribute("Usuario");
    if(usuario!=null){
        response.sendRedirect("index.jsp"); 
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/BuscaConsulta.css">
        <title>JSP Page</title>
        <style>
            head,body{
               background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>
    <body>
        <a id="link" href="index.jsp">Salir</a>
        <div id="buscar">
            <form action="" method="post">
                <label id="label">Username</label>
                <input type="text" name="user">
                <input type="submit" value="Buscar">               
            </form>
        </div>
        <div id="datos">
      <% //Busqueda por nombre del usuario a buscar
          String user=request.getParameter("user");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        pst = con.getConexion().prepareStatement("Select * from PERSONAL where Username='"+user+"'");
        rs=pst.executeQuery();
       
        while(rs.next()){
    %>
         <h2>Datos</h2>
         <form  action="" method="post">        
            <input type="text" name="user" value="<%=rs.getString("Username")%>" style="display: none">
            <input type="text" name="id" value="<%=rs.getString("ID_USER")%>" style="display: none">
            
            <label id="titulos">Nombre (s)</label>
            <input type="text" name="nombre" value="<%=rs.getString("NOMBRE")%>" disabled style="color: #273746" ><br>
            <label id="titulos">Apellidos</label>
            &emsp;<input type="text" name="apellidoP" value="<%=rs.getString("APELLIDO")%>" disabled style="color: #273746"><br>
            <label id="titulos">Username</label>
            <input type="text" name="username" value="<%=rs.getString("Username")%>" disabled style="color: #273746"><br>
            <label id="titulos">Nueva Contraseña</label>
            <input type="password" name="contra" style="color: #273746" required ><br>            
            <input type="submit" id="boton1" value="Cambiar contraseña" onclick=this.form.action="CabiaContra">
                    
         </form>
        </div>
        <!--Mando el parametro ID del paciente que encontre-->            
    <% } %>
    </body>
</html>
