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
    else{
        String gerarquia=(String)sesion.getAttribute("Gerarquia");       
        if(gerarquia.equals("usuario")){
            response.sendRedirect("inicio.jsp"); 
        }
    }
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
        <script type="text/javascript" src="js/NoBack.js"></script>
        <title>CESS UV</title>
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>
    <body onload="nobackbutton();">
        <div id="contien_link">
            <a id="link2" href="inicio.jsp">Inicio</a>
            <a id="link2" href="pruebas.jsp">Buscar historial</a>
        </div>
        <div id="contiene_tabla">
        <table id="tabla">
            <tr>
                <th>Fecha de Ingreso</th>
                <th>Nombre</th>
                <th>Apellido Paterno</th>
                <th>Apellido Materno</th>
                <th>Edad</th>
                <th>Telefono</th>
                <th>Opciones</th>
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
                    <form action="" method="post">
                    <input type="text" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none">
                    <input type="text" name="Genero" value="<%=rs.getString("Genero")%>" style="display: none">
                    <a id="link" href="editar.jsp?id=<%=rs.getString("idPacientes")%>">Editar</a>
                    <a id="link" href="eliminar.jsp?id=<%=rs.getString("idPacientes")%>">Eliminar</a>
                    <input type="submit" id="link" value="Consultas" onclick=this.form.action="HistoConsulta">
                    <input type="submit" id="link" value="Historia Clínica" onclick=this.form.action="PasarParamentros">
                    </form>
                </td>
            </tr>
            <% } %>  
            
        </table>
        </div>
    </body>
</html>
