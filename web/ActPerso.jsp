<%-- 
    Document   : eliminar
    Created on : 27/03/2018, 03:30:22 PM
    Author     : luis
--%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion=request.getSession(false);
    String usuario=(String)sesion.getAttribute("Usuario");
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    else{
        String gerarquia=(String)sesion.getAttribute("Gerarquia");
        if(gerarquia.equals("Admin")){
            response.sendRedirect("CessAdmin.jsp"); 
        }
        if(gerarquia.equals("usuario")){
            response.sendRedirect("inicio.jsp"); 
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Personal.css">
        <title>CESS</title>
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
    </head>
    <body>
        <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left:39%; color: #00A99D;">Datos del Usuario</p>
        <a id="link" href="MostrarPersonal.jsp">Regresar</a>
        <div id="contenido">
            
        <%
            //String id=request.getAttribute("id").toString();
            String id=request.getParameter("id");
            Conexion con= new Conexion();
            PreparedStatement pst;
            ResultSet rs;
            pst = con.getConexion().prepareStatement("Select * from PERSONAL where ID_USER="+id);
            rs=pst.executeQuery();
            while(rs.next()){
                %>
                <form id="formulario" action="ActualizaPer" method="post">                    
                    <input class="input1" type="text" name="Id" value="<%=rs.getString("ID_USER")%>" style="display: none;">
                    <label>Nombre</label> <input class="input1" type="text" name="nombre" value="<%=rs.getString("NOMBRE")%>">
		    <label>Apellidos</label><input class="input1" type="text" name="apellido" value="<%=rs.getString("APELLIDO")%>">
                    <label>Teléfono</label><input class="input1" type="text" name="tele" value="<%=rs.getString("telefono")%>">
		    <label>Cédula</label><input class="input1" type="text" name="cedula" value="<%=rs.getString("Cedula")%>">
                    <label>Username</label><input class="input1" type="text" name="username" value="<%=rs.getString("Username")%>">
                    <label>Especialidad</label><input class="input1" type="text" name="especialidad" value="<%=rs.getString("Especialidad")%>">
                    <div>
			<input type="radio" id="super" name="gerar" value="Super" checked>
			<label for="super" class="label">Super Usuario</label>
			<input type="radio" id="admin" name="gerar" value="Admin">
			<label for="admin" class="label">Administrador</label> 
			<input type="radio" id="user" name="gerar" value="usuario">
			<label for="user" class="label">Médico</label>
			</div> 
                    <div class="boton">
		      <input class="enter1" type="submit" value="Guardar">
                      <a class="enter1" href="Renueva.jsp">Cambiar contraseña</a>
		    </div>
	  	</form>
                <%  }    %>            
	</div>
    </body>
</html>
