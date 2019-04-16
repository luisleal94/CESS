<%-- 
    Document   : HistorialR
    Created on : 16/04/2019, 01:50:14 PM
    Author     : luis
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion=request.getSession(false); //Sesion
    String usuario=(String)sesion.getAttribute("Usuario");
    Conexion con= new Conexion();
    PreparedStatement pst;
    ResultSet rs;
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    String id=(String)request.getAttribute("id");//El que obtengo del serlevt 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo2.css">
        <link rel="stylesheet" href="css/Estadistica.css">
        <link rel="stylesheet" href="css/BuscaConsulta.css">
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }
        </style>
        <title>Recetas</title>
    </head>
    <body>
        <%  String sql="select Receta.Fecha, PERSONAL.NOMBRE, PERSONAL.APELLIDO from Receta"+
                        " inner join PERSONAL on Receta.IdMedico=PERSONAL.ID_USER where IdPaciente='"+id+
                        "' GROUP BY  Fecha,IdMedico";
            pst = con.getConexion().prepareStatement(sql);
            rs=pst.executeQuery();%>
            <div id="contiene_tabla">
                <table id="tabla">
                    <tr>
                        <th>Médico</th>
                        <th>Fecha</th>
                        <th></th>
                    </tr>
                    <% while(rs.next()){  %>
                    <tr>
                        <td><%=rs.getString("Nombre")+" "+rs.getString("Apellido")%></td>
                        <td><%=rs.getString("Fecha")%></td>
                        <td><input type="submit" id="boton" value="Mostrar" onclick=this.form.action=""> </td>
                    </tr>
                    <% } %>
                </table>                
            </div>
    </body>
</html>
