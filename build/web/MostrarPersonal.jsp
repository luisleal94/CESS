<%-- 
    Document   : MostrarPersonal
    Created on : 4/06/2018, 09:06:01 PM
    Author     : luis
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Obtengo atributo
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
    
    Conexion con= new Conexion();
    PreparedStatement pst;
    ResultSet rs;
    pst = con.getConexion().prepareStatement("Select * from PERSONAL where Username<>'"+usuario+"'");
    rs=pst.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Personal.css">
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>
        <title>CESS</title>
    </head>
    <body>
        <a id="link" href="CessSuper.jsp">Regresar</a>
        <div id="contiene_tabla">
        <table id="tabla">
            <tr>
                <th>Usuario</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Teléfono</th>
                <th>Gerarquia</th>
                <th>Cédula</th>
                <th>Especialidad</th>
                <th></th>
            </tr>
             <%  while(rs.next()){  %>
            <tr>
                <td><%=rs.getString("Username")%></td>
                <td><%=rs.getString("NOMBRE")%></td>
                <td><%=rs.getString("APELLIDO")%></td>
                <td><%=rs.getString("telefono")%></td>
                <td><%=rs.getString("Gerarquia")%></td>
                <td><%=rs.getString("Cedula")%></td>                
                <td><%=rs.getString("Especialidad")%></td>
                <td>         
                  <form action="" method="post">
                    <input type="text" name="id" value="<%=rs.getString("ID_USER")%>" style="display: none">
                    <a id="link" href="ActPerso.jsp?id=<%=rs.getString("ID_USER")%>">Editar</a>
                    <a id="link" href="EliminaPer.jsp?id=<%=rs.getString("ID_USER")%>">Eliminar</a>                                     
                    </form>
                </td>
            </tr>
            <% } %>  
            
        </table>
        </div>
    </body>
</html>
