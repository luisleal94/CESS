<%-- 
    Document   : ConsultasH
    Created on : 27/06/2018, 08:20:18 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controlador.Conexion"%>
<!DOCTYPE html>
<%
    //Obtengo atributo
    HttpSession sesion=request.getSession(false); //Sesion    
    String usuario=(String)sesion.getAttribute("Usuario");
    String gerarquia="";
    String cedula="";
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }else{
        gerarquia=(String)sesion.getAttribute("Gerarquia");
        cedula=(String)sesion.getAttribute("Cedula");
        System.out.println("Geraquia:"+gerarquia);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
         <link rel="stylesheet" href="css/HistoConsulta.css">
         <script type="text/javascript" src="js/NoBack.js"></script>
        <title>CESS</title>
    </head>
    <body onload="nobackbutton();">
        <div id="contien_link">
            <a id="link" href="historial.jsp">Regresar</a>
        </div>
        <div class="titulo"><h1>Consultas Realizadas</h1></div>        
        <% //Busqueda por ID del usuario a buscar
                    String id=request.getAttribute("id").toString();//El que obtengo del serlevt                   
                    System.out.println("Id obtenido:"+id);                   
                    Conexion con= new Conexion();
                    PreparedStatement pst;
                    ResultSet rs;        
                    pst = con.getConexion().prepareStatement("Select * from Consulta where IdPaciente='"+id+"'");
                    rs=pst.executeQuery();
        %>
        <div class="contiene_tabla">
        <table class="tabla">
            <tr>
                <th>Fecha</th>                
                <th>Medico</th>  
                <th>Especialidad</th>
                <th></th>
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
                    <input type="submit" id="link" value="Mostrar" onclick=this.form.action="Inspecciona">
                    <input type="submit" id="link3" value="Eliminar" onclick=this.form.action="EliminaCon">
                    </form>
                </td>
            </tr>
            <% } %>  
            
        </table>
        </div>                                   
    </body>
</html>
