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
        <title>CESS</title>
    </head>
    <body>
        <%
            String id=request.getParameter("id");
            Conexion con= new Conexion();
            PreparedStatement pst;
            ResultSet rs;
            pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes="+id);
            rs=pst.executeQuery();
            while(rs.next()){
                %>
                <h2>Datos del paciente</h2>
                <form action="" method="post">
                    <input type="text" name="nombre" value="<%=rs.getString("Nombre")%>">
                    <input type="text" name="apellidoP" value="<%=rs.getString("Apellido_P")%>">
                    <input type="text" name="apellidoM" value="<%=rs.getString("Apellido_M")%>">
                    <input type="text" name="edad" value="<%=rs.getString("Edad")%>">
                    <input type="text" name="tele" value="<%=rs.getString("telefono")%>">
                    <input type="submit" value="Guardar">
                    <a href="pruebas.jsp">Regresar</a>
                </form>
                <%
            }

            String nombre,apellidop,apellidom,edad,tele;
            nombre=request.getParameter("nombre");//Obtengo el parametro del texbox
            apellidop=request.getParameter("apellidoP");
            apellidom=request.getParameter("apellidoM");
            edad=request.getParameter("edad");
            tele=request.getParameter("tele");
            if(nombre!=null){
                pst = con.getConexion().prepareStatement("update Pacientes set Nombre='"+nombre+"',Apellido_P='"+apellidop+"',Apellido_M='" + apellidom +"',Edad='"+edad+"',telefono='"+tele+"' where idPacientes='"+id+"'");
                pst.executeUpdate();
                response.sendRedirect("pruebas.jsp");
               
            }
        %>
        
    </body>
</html>
