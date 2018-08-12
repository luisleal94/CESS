<%-- 
    Document   : pruebas
    Created on : 6/04/2018, 11:25:20 PM
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
        <script type="text/javascript" src="js/radios.js"></script>
        <link rel="stylesheet" href="css/Estadistica.css">
        <link rel="stylesheet" href="css/BuscaConsulta.css">
        <title>CESS</title>
        <style>
            head,body{
               background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
        </style>
        <script type="text/javascript" src="js/NoBack.js"></script>
    </head>
    <body onload="nobackbutton();">
        <a id="link" href="CessSuper.jsp">Menú principal</a>
        <div id="buscar">
            <form action="" method="post">
                <label id="label">Buscar por:</label>
                <div id="contiene_tabla2">                    
                        <div class="checkbox">
                            <table id="tabla2">                        
                                <tr>
                                    <td><input type="radio" id="si1" name="Tipo" value="Nombre">
                                        <label for="si1" class="label">Nombre (s)</label></td>
                                    <td><input type="radio" id="si2" name="Tipo" value="Apellido_P">
                                        <label for="si2" class="label">Apellido Paterno</label></td>  
                                    <td><input type="radio" id="si3" name="Tipo" value="Apellido_M">
                                        <label for="si3" class="label">Apellido Materno</label></td>
                                    <td><input type="radio" id="si4" name="Tipo" value="Curp">
                                        <label for="si4" class="label">CURP</label></td>
                                </tr>                       
                            </table>
                        </div>
                    </div>
                <input id="Cajas" type="text" name="dato">
                <input type="submit" value="Buscar"> 
                <div id="boton0" ><a href="historial.jsp">Mostrar tabla</a></div>
            </form>
        </div>
        
      <% //Busqueda por nombre del usuario a buscar
        //String Nombre=request.getParameter("nombre");
        String Tipo=request.getParameter("Tipo");
        String Valor=request.getParameter("dato");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        String SQL="";
        if(Tipo==null){
            SQL="Select *from Pacientes where Nombre='"+Valor+"'";
        }else{
            SQL="Select * from Pacientes where "+Tipo+"='"+Valor+"'";
        }
        System.out.println(SQL+Tipo);
        pst = con.getConexion().prepareStatement(SQL);
        rs=pst.executeQuery();
        while(rs.next()){
    %>
        <div id="datos"> 
        <h2>Datos del paciente</h2>
         <form  action="" method="post">
            <input type="text" name="Genero" value="<%=rs.getString("Genero")%>" style="display: none">
            <input type="text" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none">
            <label id="titulos">Nombre</label>
            <input type="text" name="nombre" value="<%=rs.getString("Nombre")%>" disabled style="color: #273746" ><br>
            <label id="titulos">Apellido Paterno</label>
            <input type="text" name="apellidoP" value="<%=rs.getString("Apellido_P")%>" disabled style="color: #273746"><br>
            <label id="titulos">Apellido Materno</label>
            <input type="text" name="apellidoM" value="<%=rs.getString("Apellido_M")%>" disabled style="color: #273746"><br>
            <label id="titulos">Edad</label>
            <input type="text" name="edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746"><br>
            <label id="titulos">Teléfono</label>
            <input type="text" name="tele" value="<%=rs.getString("telefono")%>" disabled style="color: #273746"><br>       
            <div id="boton1" ><a href="editar.jsp?id=<%=rs.getString("idPacientes")%>">Actualizar datos</a></div>    
            <input type="submit" id="boton1" value="Historia Clínica" onclick=this.form.action="PasarParamentros">
            <input type="submit" id="boton1" value="Consultas" onclick=this.form.action="HistoConsulta">
            <input type="submit" id="boton1" value="Eliminar" onclick=this.form.action="Eliminar">
         </form>
        </div>
        <!--Mando el parametro ID del paciente que encontre-->            
    <% } %>
    </body>
</html>
