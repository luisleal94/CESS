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
        <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left:39%; color: #00A99D;">Datos del Paciente</p>
        <br><br>
        <div id="contenido">
            
        <%
            //String id=request.getAttribute("id").toString();
            String id=request.getParameter("id");
            Conexion con= new Conexion();
            PreparedStatement pst;
            ResultSet rs;
            pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes="+id);
            rs=pst.executeQuery();
            while(rs.next()){
                %>
                <form id="formulario" action="" method="post">                    
                    <label>Nombre</label> <input class="input1" type="text" name="nombre" value="<%=rs.getString("Nombre")%>">
		    <label>Apellido Paterno</label><input class="input1" type="text" name="apellidoP" value="<%=rs.getString("Apellido_P")%>">
                    <label>Apellido Materno</label><input class="input1" type="text" name="apellidoM" value="<%=rs.getString("Apellido_M")%>">
                    <label>Edad</label><input class="input1" type="text" name="edad" value="<%=rs.getString("Edad")%>">
                    <label>Teléfono</label><input class="input1" type="text" name="tele" value="<%=rs.getString("telefono")%>">
		    <label>Ocupación</label><input class="input1" type="text" name="ocupa" value="<%=rs.getString("Ocupacion")%>">
                    <label>Estado Civil</label><input class="input1" type="text" name="Estado" value="<%=rs.getString("EstadoC")%>">
                    <label>Domicilio</label><input class="input1" type="text" name="Domi" value="<%=rs.getString("Domicilio")%>">
                    <div class="boton">
		      <input class="enter1" type="submit" value="Guardar">                      
		    </div>
	  	</form>
                <%
            }

            String nombre,apellidop,apellidom,edad,tele,ocu,estado,domi;
            nombre=request.getParameter("nombre");//Obtengo el parametro del texbox
            apellidop=request.getParameter("apellidoP");
            apellidom=request.getParameter("apellidoM");
            edad=request.getParameter("edad");
            tele=request.getParameter("tele");
            ocu=request.getParameter("ocupa");
            estado=request.getParameter("Estado");
            domi=request.getParameter("Domi");
            if(nombre!=null){
                pst = con.getConexion().prepareStatement("update Pacientes set Nombre='"+nombre+"',Apellido_P='"+apellidop+"',Apellido_M='" + apellidom +"',Edad='"+edad+"',telefono='"+tele+"',"
                + "Ocupacion='"+ocu+"',EstadoC='"+estado+"',Domicilio='"+domi+"'" +"where idPacientes='"+id+"'");
                pst.executeUpdate();
                response.sendRedirect("pruebas.jsp");
               
            }
        %>            
	</div>
    </body>
</html>
