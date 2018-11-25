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
        <script type="text/javascript" src="js/Validacion.js"></script>
        <script type="text/javascript" src="js/ValidaForm.js"></script>
        <title>CESS</title>
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
    </head>
    <body>
        <a id="link" href="historial.jsp">Regresar</a>
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
                <form id="formulario" action="ActualizaPac" method="post" onsubmit="return AnioUsuarios()">      
                    <input type="text" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none">
                    <label>Nombre</label> <input class="input1" type="text" name="nombre" value="<%=rs.getString("Nombre")%>" required>
                    <label>Apellido Paterno</label><input class="input1" type="text" name="apellidoP" value="<%=rs.getString("Apellido_P")%>" required>
                    <label>Apellido Materno</label><input class="input1" type="text" name="apellidoM" value="<%=rs.getString("Apellido_M")%>" required>
                    <label>Fecha de nacimiento</label>
                    <section class="Numero">
                        <input class="Inputfecha" type="text" id="Anio" name="Anio" value="<%=rs.getString("Anio")%>" onkeyUp="return AnioCorrec(this)" required>
                        <input class="Inputfecha" type="text" name="mes" value="<%=rs.getString("Mes")%>" onkeyUp="return Mes(this)" required>
                        <input class="Inputfecha" type="text" name="dia" value="<%=rs.getString("Dia")%>" onkeyUp="return Edad(this)" required><br>
                    </section>
                    <label>Teléfono</label><input class="input1" type="text" name="tele" value="<%=rs.getString("telefono")%>" required>
		    <label>Ocupación</label><input class="input1" type="text" name="ocupa" value="<%=rs.getString("Ocupacion")%>" required>
                    <label>Estado Civil</label><input class="input1" type="text" name="Estado" value="<%=rs.getString("EstadoC")%>" required>
                    <label>Domicilio</label><input class="input1" type="text" name="Domi" value="<%=rs.getString("Domicilio")%>" required>
                    <label>Curp</label><input class="input1" type="text" name="Curp" value="<%=rs.getString("Curp")%>" required>
                    <div class="boton">
		      <input class="enter1" type="submit" value="Guardar">                      
		    </div>
	  	</form>
                <% }  %>            
	</div>
    </body>
</html>
