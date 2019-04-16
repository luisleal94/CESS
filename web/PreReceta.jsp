<%-- 
    Document   : PreReceta
    Created on : 22/08/2018, 08:16:59 AM
    Author     : luis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    //Obtengo atributo
    Calendar calender = Calendar.getInstance();
    int anio=calender.get(Calendar.YEAR);
    HttpSession sesion=request.getSession(false);
    String usuario=(String)sesion.getAttribute("Usuario");
    String gerarquia=(String)sesion.getAttribute("Gerarquia");
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }    
    else{
        if(gerarquia.equals("Super")){
            response.sendRedirect("CessSuper.jsp"); 
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/NoBack.js"></script>
        <script type="text/javascript" src="js/radios.js"></script>
        <link rel="stylesheet" href="css/BuscaConsulta.css">
        <link rel="stylesheet" href="css/Estadistica.css">
        <link rel="stylesheet" href="css/BuscaConsulta.css">
        <title>CESS</title>
    </head>
    <body onload="nobackbutton();">
        <a id="link" href="CessAdmin.jsp">Regresar</a>
        <div id="buscar">
            <form action="" method="post">
                <label id="label">Buscar paciente por:</label>
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
            </form>
        </div>
        <% //Busqueda por nombre del usuario a buscar
        request.setCharacterEncoding("UTF-8");
        String Nombre="";
        int Edad;
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
        while(rs.next()){ Nombre=rs.getString("Nombre")+" "+ rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");
        Edad=anio-Integer.parseInt(rs.getString("Anio"));
    %>
        <div id="datos"> 
        <h2>Paciente</h2>
         <form  action="" method="post">
            <input type="text" name="Tipo" value="2" style="display: none">
            <input type="text" name="Genero" value="<%=rs.getString("Genero")%>" style="display: none">
            <input type="text" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none">
            <input type="text" name="Edad" value="<%=Edad%>" style="display: none">
            <label id="titulos">Nombre</label>
            <input type="text" name="nombre" value="<%=Nombre%>" disabled style="color: #273746" ><br>
            <label id="titulos">Edad</label>
            <input type="text" name="edad" value="<%=anio-Integer.parseInt(rs.getString("Anio"))%>" disabled style="color: #273746"><br>
            <label id="titulos">CURP</label>
            <input type="text" name="tele" value="<%=rs.getString("Curp")%>" disabled style="color: #273746"><br>
            <!--<input type="submit" id="boton1" value="Generar Receta" onclick=this.form.action="PasaConsulta">-->
            <input type="submit" id="boton1" value="Recetas Médicas" onclick=this.form.action="ReceHis">
         </form>
        </div>
        <!--Mando el parametro ID del paciente que encontre-->            
    <% } %>        
    </body>
</html>