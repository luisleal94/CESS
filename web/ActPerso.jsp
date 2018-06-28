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
        <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left:44%; color: #00A99D;">Datos del Paciente</p>
        <a id="link" href="CessSuper.jsp">Regresar</a>
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
                <form id="formulario" action="" method="post">                    
                    <label>Nombre</label> <input class="input1" type="text" name="nombre" value="<%=rs.getString("NOMBRE")%>">
		    <label>Apellido</label><input class="input1" type="text" name="apellido" value="<%=rs.getString("APELLIDO")%>">
                    <label>Teléfono</label><input class="input1" type="text" name="tele" value="<%=rs.getString("telefono")%>">
		    <label>Cédula</label><input class="input1" type="text" name="cedula" value="<%=rs.getString("Cedula")%>">
                    <label>Username</label><input class="input1" type="text" name="username" value="<%=rs.getString("Username")%>">
                    <label>Especialidad</label><input class="input1" type="text" name="especialidad" value="<%=rs.getString("Especialidad")%>">
                    <div class="boton">
		      <input class="enter1" type="submit" value="Guardar">                      
		    </div>
	  	</form>
                <%
            }

            String nombre,apellido,tele,cedula,user,especialidad;
            nombre=request.getParameter("nombre");//Obtengo el parametro del texbox
            apellido=request.getParameter("apellido");           
            tele=request.getParameter("tele");
            cedula=request.getParameter("cedula");
            user=request.getParameter("username");
            especialidad=request.getParameter("especialidad");
            if(nombre!=null){
                pst = con.getConexion().prepareStatement("update PERSONAL set NOMBRE='"+nombre+"',APELLIDO='"+apellido+"',telefono='"+tele+"',"
                + "Cedula='"+cedula+"',Username='"+user+"',Especialidad='"+especialidad+"'" + " where ID_USER='"+id+"'");
                pst.executeUpdate();
                response.sendRedirect("MostrarPersonal.jsp");               
            }
        %>            
	</div>
    </body>
</html>
