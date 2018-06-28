<%-- 
    Document   : Estadistica
    Created on : 20/06/2018, 05:19:10 PM
    Author     : luis
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Estadistica.css">
        
         <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
        <title>CESS</title>
    </head>
    <body>
        <div id="titulo">
            <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left: 30%; color: #00A99D;">Estadísticas De Consulta</p>
        </div>
        <br>
        <div  class="contieneForm" >
            <form action="#" method="post" >
                <p1>De</p1>
                <input type="date" id="fecha" name="Rango1">
                <p1>A</p1>
                <input type="date" name="Rango2">
                <input type="submit" value="Consultar">
            </form>
        </div>
        <div class="datos" >
            <% //Busqueda por nombre del usuario a buscar
               String Rango1=request.getParameter("Rango1");
                String Rango2=request.getParameter("Rango2");
                Conexion con= new Conexion();
                PreparedStatement pst;
                ResultSet rs;
                pst = con.getConexion().prepareStatement("SELECT * FROM Consulta WHERE Fecha BETWEEN '"+Rango1+"' AND '"+Rango2+"'");
                rs=pst.executeQuery();
            %>
            <div class="contiene_tabla">
                <table id="tabla">
                    <tr>
                        <th>Fecha</th>                        
                        <th>Medico</th>
                        <th>Nombre</th>
                        <th>Personal</th>
                        <th>Costo</th>
                    </tr>
                    <%while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString("Fecha")%></td>
                        <td><%=rs.getString("Medico")%></td>
                        <td><%=rs.getString("Nombre")%></td>
                        <td><%=rs.getString("Tipo")%></td>
                        <td><%=rs.getString("Costo")%></td>
                    </tr>
                    <%                
                        }
                    %>
                </table>
            </div>
        </div>
           
    </body>
</html>
