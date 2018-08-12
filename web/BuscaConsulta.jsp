<%-- 
    Document   : BuscaConsulta
    Created on : 29/06/2018, 11:13:29 AM
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
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/NoBack.js"></script>
        <link rel="stylesheet" href="css/BuscaConsulta.css">
        <title>CESS</title>
    </head>
    <body onload="nobackbutton();">
        <a id="link" href="CessAdmin.jsp">Regresar</a>
        <div id="buscar">
            <form action="" method="post">
                <label id="label">Nombre</label>
                <input id="Cajas" type="text" name="nombre">
                <label id="label">Apellido Paterno</label>                
                <input id="Cajas"type="text" name="apellidoP">
                <label id="label">Apellido Materno</label>                
                <input id="Cajas" type="text" name="apellidoM"><br>
                <input type="submit" value="Buscar">                
            </form>
        </div>
        <% //Busqueda por nombre del usuario a buscar
        String nombre=request.getParameter("nombre");
        String apellidoP=request.getParameter("apellidoP");
        String apellidoM=request.getParameter("apellidoM");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"' and Apellido_P='"+apellidoP+"' and Apellido_M='"+apellidoM+"'");
        rs=pst.executeQuery();
        String IdPaciente="";
        while(rs.next()){
            IdPaciente=rs.getString("idPacientes");            
        }
        
        pst = con.getConexion().prepareStatement("Select * from Consulta where IdPaciente='"+IdPaciente+"'");
        rs=pst.executeQuery();%>
        <div id="contiene_tabla">
            <table id="tabla">
                <tr>
                    <th>Fecha de Consulta</th>
                    <th>Médico Tratante</th> 
                    <th>Especialidad</th> 
                    <th>Opciones</th>
                </tr>
                 <%  while(rs.next()){  %>
                <tr>
                    <td><%=rs.getString("Fecha")%></td>
                    <td><%=rs.getString("Medico")%></td>
                    <td><%=rs.getString("Especialidad")%></td>
                    <td>         
                        <form action="" method="post">
                        <input type="text" name="IdMedico" value="<%=rs.getString("IdMedico")%>" style="display: none">
                        <input type="text" name="id" value="<%=rs.getString("IdPaciente")%>" style="display: none">
                        <input type="text" name="Fecha" value="<%=rs.getString("Fecha")%>" style="display: none">
                        <input type="submit" id="link" value="Ver" onclick=this.form.action="Inspecciona">                              
                        </form>
                    </td>
                </tr>
                <% } %>              
            </table>
        </div>        
    </body>
</html>
