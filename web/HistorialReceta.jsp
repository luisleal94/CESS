<%-- 
    Document   : HistorialReceta
    Created on : 15/04/2019, 06:22:35 PM
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
    String Paciente=(String)request.getAttribute("Paciente");//El que obtengo del serlevt
    String Doctor=(String)request.getAttribute("Doctor");
    String Fecha=(String)request.getAttribute("Fecha");
    String IDUSER=(String)request.getAttribute("IDUSER");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
        <script type="text/javascript" src="js/NoBack.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="js/Posoble2.js"></script>
        <link rel="stylesheet" href="css/Receta.css">
        <script>
            function cambia_de_pagina(){
	        location.href="inicio.jsp";
	    }
        </script>
        <title>CESS</title>        
    </head>
    <body onload="nobackbutton();">
        <div class="cabecera" >
            <h1>UNIVERSIDAD VERACRUZANA</h1>
            <h1>SECRETARIA DE ADMINISTRACIÓN Y FINANZAS</h1>
            <h1>SISTEMA DE ATENCIÓN INTEGRAL A LA SALUD (SAISUV)</h1>
            <h1>RECETA MÉDICA</h1>
        </div>
        <a id="link" href="inicio.jsp">Menú principal</a>
        <%
            String sql="select *from Receta WHERE Fecha='"+ Fecha +"'"+
                    " and IdMedico='"+ Doctor +"' and  IdPaciente='"+ Paciente +"'"
                    + " union all "
                    + "select *from RecetaActualizada where IdPaciente2='"+Paciente+"' "
                    + "and IdMedico2='"+Doctor+"' and Fecha2='"+Fecha+"';";
            pst = con.getConexion().prepareStatement(sql);
            rs=pst.executeQuery();
            int j=0;
        %>
        <div class="medicamento">
                <div class="boton">
                    <input type="button" id="add" class="input1" value="Agregar Medicamento" onclick="Javascript:AgregaRec()">
                </div>
                <div id="myform">
                    <form method="post" action="" target="_blanck">
                        <input type="text" name="Fecha" value="<%=Fecha%>" style="display: none;">
                        <input type="text" name="ID" value="<%=Paciente%>" style="display: none;">
                        <input type="text" name="Doctor" value="<%=Doctor%>" style="display: none;">
                        <input type="text" name="IDUSER" value="<%=IDUSER%>" style="display: none;">
                        <div id="mydata">
                        <div class="tabla2">
                            <table id="Medicamentos"  border="1" cellpadding="3">
                                <tr>
                                    <th>&nbsp;</th>
                                    <th><b>Nombre</b></th>
                                    <th><b>F.farmaceutica</b></th>
                                    <th><b>Unidades (mg/ml)</b></th>                                       
                                    <th><b>Via</b></th>
                                    <th><b>Presentacion</b></th>
                                    <th><b>Pzas</b></th>
                                    <th><b>Dosis</b></th> 
                                    <th><b>cada</b></th>
                                    <th><b>días</b></th>
                                </tr
                                <% while(rs.next()){  %>
                                <tr>
                                    <input  name="<%="Id"+j%>" value="<%=rs.getInt("idReceta")%>" style="display: none;">
                                    <td><input type="button" class="boton2" value = " X " onClick="Javacsript:EliminaMed(this)"></td>
                                    <th><input type="text" name="<%="Medic"+j%>" size="7" value="<%=rs.getString("Medicamento")%>"></th>
                                    <th><input type="text" name="<%="Farm"+j%>" size="7" value="<%=rs.getString("Farmacia")%>"></th>
                                    <th><input type="text" name="<%="Unid"+j%>" size="7" value="<%=rs.getString("Unidades")%>"></th>
                                    <th><input type="text" name="<%="Admin"+j%>" size="4" value="<%=rs.getString("Administracion")%>"> </th>
                                    <th><input type="text" name="<%="Pres"+j%>" size="5" value="<%=rs.getString("Presentacion")%>"></th>
                                    <th><input type="text" name="<%="Piez"+j%>" size="5" value="<%=rs.getString("Piezas")%>"></th>
                                    <th><input type="text" name="<%="Dos"+j%>" size="5" value="<%=rs.getString("Dosis")%>"></th>
                                    <th><input type="text" name="<%="Cad"+j%>" size="5" value="<%=rs.getString("Cada")%>"></th>
                                    <th><input type="text" name="<%="Dia"+j%>" size="5" value="<%=rs.getString("Dias")%>"></th>
                                </tr>
                                <% j=j+1; } %>
                            </table>
                            <input  name="CantR" value="<%= j %>">
                        </div>
                        <input type="text" name="Valor" id="CantidadMedic" >
                        &nbsp;<br/>
                    </div>
                    <div class="boton">
                        <input type="text" id="Valor" name="Valor" style="display: none;">
                        <input type="submit" class="input1"  value="Imprimir" onclick="this.form.action='EditaRec',this.disabled=false">
                    </div>  
                </form>                   
            </div>
        </div>
    </body>
</html>
