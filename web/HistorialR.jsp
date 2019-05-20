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
    String IDUSER=(String)request.getAttribute("IDUSER");
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
        <title>CESS</title>
    </head>
    <body>
        <%  String sql="select Receta.Fecha,PERSONAL.ID_USER,PERSONAL.NOMBRE, PERSONAL.APELLIDO from Receta"+
                        " inner join PERSONAL on Receta.IdMedico=PERSONAL.ID_USER where IdPaciente='"+id+
                        "' GROUP BY  Fecha,IdMedico";
        
            String sql2="select Receta.Fecha,PERSONAL.ID_USER,PERSONAL.NOMBRE , PERSONAL.APELLIDO from Receta "+
                        "inner join PERSONAL on Receta.IdMedico=PERSONAL.ID_USER where IdPaciente='"+id+
                        "'GROUP BY  Fecha,IdMedico "
                    + "union all "
                    + "select  RecetaActualizada.Fecha2,PERSONAL.ID_USER, PERSONAL.NOMBRE ,PERSONAL.APELLIDO from RecetaActualizada"
                    + "	inner join PERSONAL on RecetaActualizada.IdMedico2=PERSONAL.ID_USER "
                    + " where IdPaciente2='"+id+"' GROUP BY  Fecha2,IdMedico2";
            pst = con.getConexion().prepareStatement(sql2);
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
                        <form action="" method="post">
                            <input type="text" name="Paciente" value="<%=id%>" style="display: none">
                            <input type="text" name="IDUSER" value="<%=IDUSER%>" style="display: none">
                            <input type="text" name="Doctor" value="<%=rs.getString("ID_USER")%>" style="display: none">
                            <input type="text" name="Fecha" value="<%=rs.getString("Fecha")%>" style="display: none">
                            <td><%=rs.getString("Nombre")+" "+rs.getString("Apellido")%></td>
                            <td><%=rs.getString("Fecha")%></td>
                            <td><input type="submit" id="boton" value="Mostrar" onclick=this.form.action="HistRec"> </td>
                        </form>
                    </tr>
                    <% } %>
                </table>                
            </div>
    </body>
</html>
