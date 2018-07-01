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
        
        <title>CESS</title>
         <style>
            head,body{
               background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
            .titulo{                
                font-family: roboto;
                text-align: center;
                padding: 5px;
                color:  #212f3d ;
            }
            .contiene_tabla{
                margin-left: 15%;
                position: relative;
                margin-right: 15%;
            }
            .tabla{
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
                margin-top: 5%;
            }

            .tabla td, #tabla th{
                border: 1px solid #ddd;
                padding: 8px;
                position: relative;
                text-align: center;
            }

            .tabla tr:nth-child(even){background-color: #f2f2f2;}

            .tabla tr:hover {background-color: #ddd;}

            .tabla th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #54adfc;
                color: white;
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
            input[type=submit]{
                width: 40%;
                height: 10%;
                padding: 10px 18px;
                margin: 0px 0;
                display: inline-block;
                border: none;               
                background:none;
                color: #294c4f;
                text-align: center;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <a id="link" href="historial.jsp">Regresar</a>
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
                <th></th>
            </tr>
             <%  while(rs.next()){  %>
            <tr>
                <td><%=rs.getString("Fecha")%></td>
                <td><%=rs.getString("Medico")%></td>
                
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
