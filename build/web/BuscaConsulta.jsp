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
        <title>CESS</title>
                <style>
                    head,body{
               background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
            
            input[type=text] {
                width: 50%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit] {
                width: 100px;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #145a32 ;
                transition: 0.4s;
            }

            
            #buscar{
                background: #e1edfa ;
                margin-top: 10px;
                margin-bottom: 30px;
                margin-right: 150px;
                margin-left: 100px;
                border-radius: 5px;
                text-align: left;
            }

            #label{
                padding: 5px;
            }            

            a{
                text-decoration: none;
                color:  white;
            }

            #boton1:hover{
                background: #2e86c1;
                transition:0.3s;
            }

            #link{
                text-decoration: none;
                padding: 3px;
                display: inline-block;
                background:  #1798cc ;
                font-weight:700; 
                color: white;
                border-radius: 3px;
            }

            #link:hover{
                text-decoration: none;
                padding: 3px;
                display: inline-block;
                background:#10688c;
                font-weight:700; 
                color: white;
                border-radius: 3px;
                transition: 0.3s;
            }

            form{
                text-align: center;
            }
            #contiene_tabla{
                margin-left: 15%;
                position: relative;
                margin-right: 15%;
            }
            #tabla{
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
                margin-top: 5%;
            }
            #tabla td, #tabla th{
                border: 1px solid #ddd;
                padding: 8px;
                position: relative;
                text-align: center;
            }

            #tabla tr:nth-child(even){background-color: #f2f2f2;}

            #tabla tr:hover {background-color: #ddd;}

            #tabla th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #54adfc;
                color: white;
            }
            </style>
    </head>
    <body>
        <a id="link" href="CessAdmin.jsp">Regresar</a>
        <div id="buscar">
            <form action="" method="post">
                <label id="label">Nombre</label>
                <input type="text" name="nombre">
                <input type="submit" value="Buscar">                
            </form>
        </div>
        <% //Busqueda por nombre del usuario a buscar
          String nombre=request.getParameter("nombre");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"'");
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
