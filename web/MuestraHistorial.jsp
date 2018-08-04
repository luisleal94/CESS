<%-- 
    Document   : HistoriaClinica
    Created on : 26/04/2018, 10:00:57 AM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
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
<!DOCTYPE html>
<html>
    <head>
	<title>CESS</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/estiloH.css">
	<script type="text/javascript" src="js/radios.js"></script>
	<script type="text/javascript" src="js/Validacion.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
    </head>
    <body>
       <!--<img src="img/uv.jpg" style="float: left; width: 80px; height: 80px;">-->
	<div id="encabezado" >
		<label id="cabeza">HISTORIAL CLÍNICO DEL PACIENTE</label>
	</div>
            <div class="datosPaciente">
                <% //Busqueda por ID del usuario a buscar
                    String id=request.getAttribute("id").toString();//El que obtengo del serlevt
                    String Genero=request.getParameter("Genero"); 
                    System.out.println("Id obtenido:"+id);
                    System.out.println("Genero: "+Genero);
                    String genero;
                    Conexion con= new Conexion();
                    PreparedStatement pst;
                    ResultSet rs;
                    pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes='"+id+"'");
                    rs=pst.executeQuery();
                     while(rs.next()){
                %>
		<label >Nombre</label>
                <input type="text" name="Nombre" value="<%=rs.getString("Nombre")%>" style="color:#063452" disabled >
                
		<label >Fecha</label>
                <input type="text" name="fecha" value="<%=rs.getString("fecha")%>" style="color:#063452" disabled>
		<label>Estado Civil</label>
                <input type="text" name="estado" value="<%=rs.getString("EstadoC")%>" style="color:#063452" disabled><br>
		<label>Ocupacion</label>
                <input type="text" name="Ocupacion" value="<%= rs.getString("Ocupacion") %>" style="color:#063452" disabled>
		<label>Domicilio</label>                
                <input type="text" name="Ocupacion" value="<%=rs.getString("Domicilio")%>" style="color:#063452" disabled>
                <label>Edad</label>  
                <input type="text" name="Edad" value="<%=rs.getString("Edad")%>" style="color:#063452" disabled>
                <input type="text" id="genero" name="sexo" value="<%=rs.getString("Genero")%>" style="display: none;">
                <%genero=rs.getString("Genero"); %>
                <% } %>  
	</div>
        <!--<div style="margin: 15px;"><a id="link" href="inicio.jsp">Inicio</a></div>-->
	<div class="formulario">
            <form class="formula" method="post" action="GuardarHist" >
                <%String ID=id;%>
                <input type="text" value="<%=id%>" name="id" style="display: none"><br>
                <input type="text" id="sexo" name="sexo" style="display: none"><br>		
                <label id="titulo1">Antecedentes Heredofamiliares</label>
                <div class="bloque" align="center">
                    <div class="contiene_tabla" align="center">
                        <table class="table">
                            <tr>
				<th></th>
				<th>Vive</th>
				<th>DM</th>
				<th>HTA</th>
				<th>Neoplasia</th>
				<th>Obesidad</th>
				<th>TBP</th>
				<th>Cardiopatías</th>
				<th>Alergias</th>
				<th>Mal formaciones</th>
				<th>Toxicomanías</th>
                                <th>Cancer</th>
                            </tr>
                            <% 
                                pst = con.getConexion().prepareStatement("select *from AbueloPa where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                            %>
                            <tr>
				<td>Abuelo Paterno</td>
                                <%if(rs.getString("Vive")!=null){ %> <td><input type="checkbox" name="AbueloP0" checked disabled><br></td> <% }
                                  else{ %><td><input type="checkbox" name="AbueloP0" disabled><br></td><%  }%>
                                <%if(rs.getString("DM")!=null){ %> <td><input type="checkbox" name="AbueloP1" checked disabled><br></td> <% } 
                                 else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
				<%if(rs.getString("HTA")!=null){ %> <td><input type="checkbox" name="AbueloP2" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
                                <%if(rs.getString("Neoplasia")!=null){ %> <td><input type="checkbox" name="AbueloP3" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP3" disabled><br></td><%  }%>
				<%if(rs.getString("Obesidad")!=null){ %> <td><input type="checkbox" name="AbueloP4" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP4" disabled><br></td><%  }%>
				<%if(rs.getString("TBP")!=null){ %> <td><input type="checkbox" name="AbueloP5" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP5" disabled><br></td><%  }%>
				<%if(rs.getString("Cardiopatias")!=null){ %> <td><input type="checkbox" name="AbueloP6" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP6" disabled><br></td><%  }%>
                                <%if(rs.getString("Alergias")!=null){ %> <td><input type="checkbox" name="AbueloP7" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP7" disabled><br></td><%  }%>  
				<%if(rs.getString("Formaciones")!=null){ %> <td><input type="checkbox" name="AbueloP8" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP8" disabled><br></td><%  }%>  
				<%if(rs.getString("Toxicomanias")!=null){ %> <td><input type="checkbox" name="AbueloP9" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  }%>  
                                <%if(rs.getString("Cancer")!=null){ %> <td><input type="checkbox" name="AbueloP10" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  } }%>
                            </tr>
                            <% 
                                pst = con.getConexion().prepareStatement("select *from AbuelaPa where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                            %>
                            <tr>
				<td>Abuela Paterna</td>
                                <%if(rs.getString("Vive")!=null){ %> <td><input type="checkbox" name="AbueloP0" checked disabled><br></td> <% }
                                  else{ %><td><input type="checkbox" name="AbueloP0" disabled><br></td><%  }%>
                                <%if(rs.getString("DM")!=null){ %> <td><input type="checkbox" name="AbueloP1" checked disabled><br></td> <% } 
                                 else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
				<%if(rs.getString("HTA")!=null){ %> <td><input type="checkbox" name="AbueloP2" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
                                <%if(rs.getString("Neoplasia")!=null){ %> <td><input type="checkbox" name="AbueloP3" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP3" disabled><br></td><%  }%>
				<%if(rs.getString("Obesidad")!=null){ %> <td><input type="checkbox" name="AbueloP4" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP4" disabled><br></td><%  }%>
				<%if(rs.getString("TBP")!=null){ %> <td><input type="checkbox" name="AbueloP5" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP5" disabled><br></td><%  }%>
				<%if(rs.getString("Cardiopatias")!=null){ %> <td><input type="checkbox" name="AbueloP6" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP6" disabled><br></td><%  }%>
                                <%if(rs.getString("Alergias")!=null){ %> <td><input type="checkbox" name="AbueloP7" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP7" disabled><br></td><%  }%>  
				<%if(rs.getString("Formaciones")!=null){ %> <td><input type="checkbox" name="AbueloP8" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP8" disabled><br></td><%  }%>  
				<%if(rs.getString("Toxicomanias")!=null){ %> <td><input type="checkbox" name="AbueloP9" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  }%>  
                                <%if(rs.getString("Cancer")!=null){ %> <td><input type="checkbox" name="AbueloP10" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  } }%>
                            </tr>
                            <% 
                                pst = con.getConexion().prepareStatement("select *from AbueloMa where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                            %>
                            <tr>
				<td>Abuelo Materno</td>
                                <%if(rs.getString("Vive")!=null){ %> <td><input type="checkbox" name="AbueloP0" checked disabled><br></td> <% }
                                  else{ %><td><input type="checkbox" name="AbueloP0" disabled><br></td><%  }%>
                                <%if(rs.getString("DM")!=null){ %> <td><input type="checkbox" name="AbueloP1" checked disabled><br></td> <% } 
                                 else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
				<%if(rs.getString("HTA")!=null){ %> <td><input type="checkbox" name="AbueloP2" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
                                <%if(rs.getString("Neoplasia")!=null){ %> <td><input type="checkbox" name="AbueloP3" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP3" disabled><br></td><%  }%>
				<%if(rs.getString("Obesidad")!=null){ %> <td><input type="checkbox" name="AbueloP4" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP4" disabled><br></td><%  }%>
				<%if(rs.getString("TBP")!=null){ %> <td><input type="checkbox" name="AbueloP5" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP5" disabled><br></td><%  }%>
				<%if(rs.getString("Cardiopatias")!=null){ %> <td><input type="checkbox" name="AbueloP6" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP6" disabled><br></td><%  }%>
                                <%if(rs.getString("Alergias")!=null){ %> <td><input type="checkbox" name="AbueloP7" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP7" disabled><br></td><%  }%>  
				<%if(rs.getString("Formaciones")!=null){ %> <td><input type="checkbox" name="AbueloP8" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP8" disabled><br></td><%  }%>  
				<%if(rs.getString("Toxicomanias")!=null){ %> <td><input type="checkbox" name="AbueloP9" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  }%>  
                                <%if(rs.getString("Cancer")!=null){ %> <td><input type="checkbox" name="AbueloP10" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  } }%>
                            </tr>
                            <% 
                                pst = con.getConexion().prepareStatement("select *from AbuelaMa where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                            %>
                            <tr>
				<td>Abuela Materna</td>
                                <%if(rs.getString("Vive")!=null){ %> <td><input type="checkbox" name="AbueloP0" checked disabled><br></td> <% }
                                  else{ %><td><input type="checkbox" name="AbueloP0" disabled><br></td><%  }%>
                                <%if(rs.getString("DM")!=null){ %> <td><input type="checkbox" name="AbueloP1" checked disabled><br></td> <% } 
                                 else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
				<%if(rs.getString("HTA")!=null){ %> <td><input type="checkbox" name="AbueloP2" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
                                <%if(rs.getString("Neoplasia")!=null){ %> <td><input type="checkbox" name="AbueloP3" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP3" disabled><br></td><%  }%>
				<%if(rs.getString("Obesidad")!=null){ %> <td><input type="checkbox" name="AbueloP4" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP4" disabled><br></td><%  }%>
				<%if(rs.getString("TBP")!=null){ %> <td><input type="checkbox" name="AbueloP5" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP5" disabled><br></td><%  }%>
				<%if(rs.getString("Cardiopatias")!=null){ %> <td><input type="checkbox" name="AbueloP6" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP6" disabled><br></td><%  }%>
                                <%if(rs.getString("Alergias")!=null){ %> <td><input type="checkbox" name="AbueloP7" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP7" disabled><br></td><%  }%>  
				<%if(rs.getString("Formaciones")!=null){ %> <td><input type="checkbox" name="AbueloP8" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP8" disabled><br></td><%  }%>  
				<%if(rs.getString("Toxicomanias")!=null){ %> <td><input type="checkbox" name="AbueloP9" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  }%>  
                                <%if(rs.getString("Cancer")!=null){ %> <td><input type="checkbox" name="AbueloP10" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  } }%>
                            </tr>
                            <% 
                                pst = con.getConexion().prepareStatement("select *from Padre where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                            %>
                            <tr>
				<td>Padre</td>
                                <%if(rs.getString("Vive")!=null){ %> <td><input type="checkbox" name="AbueloP0" checked disabled><br></td> <% }
                                  else{ %><td><input type="checkbox" name="AbueloP0" disabled><br></td><%  }%>
                                <%if(rs.getString("DM")!=null){ %> <td><input type="checkbox" name="AbueloP1" checked disabled><br></td> <% } 
                                 else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
				<%if(rs.getString("HTA")!=null){ %> <td><input type="checkbox" name="AbueloP2" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
                                <%if(rs.getString("Neoplasia")!=null){ %> <td><input type="checkbox" name="AbueloP3" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP3" disabled><br></td><%  }%>
				<%if(rs.getString("Obesidad")!=null){ %> <td><input type="checkbox" name="AbueloP4" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP4" disabled><br></td><%  }%>
				<%if(rs.getString("TBP")!=null){ %> <td><input type="checkbox" name="AbueloP5" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP5" disabled><br></td><%  }%>
				<%if(rs.getString("Cardiopatias")!=null){ %> <td><input type="checkbox" name="AbueloP6" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP6" disabled><br></td><%  }%>
                                <%if(rs.getString("Alergias")!=null){ %> <td><input type="checkbox" name="AbueloP7" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP7" disabled><br></td><%  }%>  
				<%if(rs.getString("Formaciones")!=null){ %> <td><input type="checkbox" name="AbueloP8" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP8" disabled><br></td><%  }%>  
				<%if(rs.getString("Toxicomanias")!=null){ %> <td><input type="checkbox" name="AbueloP9" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  }%>  
                                <%if(rs.getString("Cancer")!=null){ %> <td><input type="checkbox" name="AbueloP10" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  } }%>
                            </tr>
                            <% 
                                pst = con.getConexion().prepareStatement("select *from Madre where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                            %>
                            <tr>
				<td>Madre</td>
                                <%if(rs.getString("Vive")!=null){ %> <td><input type="checkbox" name="AbueloP0" checked disabled><br></td> <% }
                                  else{ %><td><input type="checkbox" name="AbueloP0" disabled><br></td><%  }%>
                                <%if(rs.getString("DM")!=null){ %> <td><input type="checkbox" name="AbueloP1" checked disabled><br></td> <% } 
                                 else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
				<%if(rs.getString("HTA")!=null){ %> <td><input type="checkbox" name="AbueloP2" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
                                <%if(rs.getString("Neoplasia")!=null){ %> <td><input type="checkbox" name="AbueloP3" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP3" disabled><br></td><%  }%>
				<%if(rs.getString("Obesidad")!=null){ %> <td><input type="checkbox" name="AbueloP4" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP4" disabled><br></td><%  }%>
				<%if(rs.getString("TBP")!=null){ %> <td><input type="checkbox" name="AbueloP5" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP5" disabled><br></td><%  }%>
				<%if(rs.getString("Cardiopatias")!=null){ %> <td><input type="checkbox" name="AbueloP6" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP6" disabled><br></td><%  }%>
                                <%if(rs.getString("Alergias")!=null){ %> <td><input type="checkbox" name="AbueloP7" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP7" disabled><br></td><%  }%>  
				<%if(rs.getString("Formaciones")!=null){ %> <td><input type="checkbox" name="AbueloP8" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP8" disabled><br></td><%  }%>  
				<%if(rs.getString("Toxicomanias")!=null){ %> <td><input type="checkbox" name="AbueloP9" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  }%>  
                                <%if(rs.getString("Cancer")!=null){ %> <td><input type="checkbox" name="AbueloP10" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  } }%>
                            </tr>
                            <% 
                                pst = con.getConexion().prepareStatement("select *from Tios where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                            %>
                            <tr>
				<td>Tios</td>
                                <%if(rs.getString("Vive")!=null){ %> <td><input type="checkbox" name="AbueloP0" checked disabled><br></td> <% }
                                  else{ %><td><input type="checkbox" name="AbueloP0" disabled><br></td><%  }%>
                                <%if(rs.getString("DM")!=null){ %> <td><input type="checkbox" name="AbueloP1" checked disabled><br></td> <% } 
                                 else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
				<%if(rs.getString("HTA")!=null){ %> <td><input type="checkbox" name="AbueloP2" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
                                <%if(rs.getString("Neoplasia")!=null){ %> <td><input type="checkbox" name="AbueloP3" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP3" disabled><br></td><%  }%>
				<%if(rs.getString("Obesidad")!=null){ %> <td><input type="checkbox" name="AbueloP4" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP4" disabled><br></td><%  }%>
				<%if(rs.getString("TBP")!=null){ %> <td><input type="checkbox" name="AbueloP5" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP5" disabled><br></td><%  }%>
				<%if(rs.getString("Cardiopatias")!=null){ %> <td><input type="checkbox" name="AbueloP6" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP6" disabled><br></td><%  }%>
                                <%if(rs.getString("Alergias")!=null){ %> <td><input type="checkbox" name="AbueloP7" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP7" disabled><br></td><%  }%>  
				<%if(rs.getString("Formaciones")!=null){ %> <td><input type="checkbox" name="AbueloP8" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP8" disabled><br></td><%  }%>  
				<%if(rs.getString("Toxicomanias")!=null){ %> <td><input type="checkbox" name="AbueloP9" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  }%>  
                                <%if(rs.getString("Cancer")!=null){ %> <td><input type="checkbox" name="AbueloP10" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  } }%>
                            </tr>
                            <% 
                                pst = con.getConexion().prepareStatement("select *from Hermanos where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                            %>
                            <tr>
				<td>Hermanos</td>
                                <%if(rs.getString("Vive")!=null){ %> <td><input type="checkbox" name="AbueloP0" checked disabled><br></td> <% }
                                  else{ %><td><input type="checkbox" name="AbueloP0" disabled><br></td><%  }%>
                                <%if(rs.getString("DM")!=null){ %> <td><input type="checkbox" name="AbueloP1" checked disabled><br></td> <% } 
                                 else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
				<%if(rs.getString("HTA")!=null){ %> <td><input type="checkbox" name="AbueloP2" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP1" disabled><br></td><%  }%>
                                <%if(rs.getString("Neoplasia")!=null){ %> <td><input type="checkbox" name="AbueloP3" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP3" disabled><br></td><%  }%>
				<%if(rs.getString("Obesidad")!=null){ %> <td><input type="checkbox" name="AbueloP4" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP4" disabled><br></td><%  }%>
				<%if(rs.getString("TBP")!=null){ %> <td><input type="checkbox" name="AbueloP5" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP5" disabled><br></td><%  }%>
				<%if(rs.getString("Cardiopatias")!=null){ %> <td><input type="checkbox" name="AbueloP6" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP6" disabled><br></td><%  }%>
                                <%if(rs.getString("Alergias")!=null){ %> <td><input type="checkbox" name="AbueloP7" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP7" disabled><br></td><%  }%>  
				<%if(rs.getString("Formaciones")!=null){ %> <td><input type="checkbox" name="AbueloP8" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP8" disabled><br></td><%  }%>  
				<%if(rs.getString("Toxicomanias")!=null){ %> <td><input type="checkbox" name="AbueloP9" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  }%>  
                                <%if(rs.getString("Cancer")!=null){ %> <td><input type="checkbox" name="AbueloP10" checked disabled><br></td> <% }  
                                  else{ %><td><input type="checkbox" name="AbueloP9" disabled><br></td><%  } }%>
                            </tr>
                        </table>
                    </div>
                </div>
		<div  style="background-color:white">
                    <%
                        pst = con.getConexion().prepareStatement("select *from NoPatologicos where idPaciente='"+ID+"'");
                        rs=pst.executeQuery(); 
                        while(rs.next()){
                    %>
			<label id="titulo1">Antecedentes Personales No Patológicos</label>                       
			<label id="titulo2">Hábitos Higienicos</label>
			<div class="bloque" align="center">
				<label>Aseo Corporal</label>
                                <input type="text" name="aseo" id="number" value="<%=rs.getString("Aseo")%>" disabled><label>/ 7</label>
				<label>Aseo Bucal</label>
				<input type="text" name="bucal" id="number" value="<%=rs.getString("Cepillado")%>" disabled><label>/ 3</label>
				<label>Cambio de ropa</label>
				<input type="text" name="ropa" id="number" value="<%=rs.getString("Ropa")%>" disabled><label>/ 7</label>
			</div>
		
			<div class="bloque" align="center">
				<label id="titulo2">Hábitos Alimenticios</label>
				<label>Lácteos</label>
				<input type="text" name="leche" id="number" value="<%=rs.getString("Lacteos")%>" disabled><label>/ 7</label>
				<label>Proteínas</label>
				<input type="text" name="carne" id="number" value="<%=rs.getString("Proteinas")%>"disabled><label>/ 7</label>                
				<label>Verduras</label>
				<input type="text" name="verduras" id="number" value="<%=rs.getString("Verduras")%>"disabled><label>/ 7</label>
				<label>Cereales</label>
				<input type="text" name="cereal" id="number" value="<%=rs.getString("Cereales")%>"disabled><label>/ 7</label>
				<label>Leguminosas</label>
				<input type="text" name="legum" id="number" value="<%=rs.getString("Legumbres")%>"disabled><label>/ 7</label>
			</div>
			<% } %>
                        <%
                        pst = con.getConexion().prepareStatement("select *from Inmune where idPaciente='"+ID+"'");
                        rs=pst.executeQuery(); 
                        while(rs.next()){
                        %>
                        <div class="bloque">
				<label id="titulo2">INMUNIZACIONES (FECHAS)</label>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<label>ANTITETÁNICA</label>
				<input type="text" name="tetano" value="<%=rs.getString("Tetano")%>"disabled>
				&emsp;&emsp;&emsp;&emsp;<label>ANTISARAMPIÓN</label>
				<input type="text" name="sarampion" value="<%=rs.getString("Sarampion")%>"disabled><br>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<label>RUBÉOLA</label>
				<input type="text" name="rubeola" value="<%=rs.getString("Rubeola")%>"disabled>				
                                &emsp;&emsp;&emsp;&emsp;<label>ANTI HBS</label>
				<input type="text" name="hepatitis" value="<%=rs.getString("hepatitis")%>"disabled> <!--Nuevo agregado-->
			</div>
                        <% } %>
			<div class="bloque">                          
                            <%
                                String res1="",res2="",res3="",res4="",res5="",res6="",res7="",res8="";
                                pst = con.getConexion().prepareStatement("select *from ResVicios where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ 
                                    res1=rs.getString("EdadInicio");
                                    res2=rs.getString("CantidadAlco");
                                    res3=rs.getString("EdadFum");
                                    res4=rs.getString("CigarrosDia");
                                    res5=rs.getString("EdadRela");
                                    res6=rs.getString("NoParejas");
                                    res7=rs.getString("Proteccion");
                                    res8=rs.getString("Anticonceptivo");
                                }        
                                pst = con.getConexion().prepareStatement("select *from VIcios where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){
                            %>			
                                    <label>Bebidas alcohólicas</label>
                                    <input type="text" value="<%=rs.getString("Toma")%>" id="number" disabled> 
                                    <%
                                        if(rs.getString("Toma").equals("Si")){%>
                                        <section id="muestraA" class="seccion">
                                            <label>¿A qué edad empezaste a ingerir alcohól?</label>
                                            <input type="text" name="inicio1" value="<%=res1%>" disabled>	
                                            &emsp;&emsp;<label>¿Qué cantidad de bebida ingieres?</label>
                                            <input type="text" name="cantidad1" value="<%=res2%>" disabled>			
                                        </section>   
                                        
                                    <%  }
                                    %>
                                    <br><label>Fumas</label> 
                                    <input type="text" value="<%=rs.getString("Fuma")%>" id="number" disabled>
                                    <% if(rs.getString("Fuma").equals("Si")){  %>
                                        <section id="muestraA" class="seccion">
                                            <label>Edad de inicio</label>
                                            <input type="text" name="inicio1" value="<%=res3%>" id="number" disabled>	
                                            &emsp;&emsp;&emsp;<label>¿Qué cantidad de bebida ingieres?</label>
                                            <input type="text" name="cantidad1" value="<%=res4%>" disabled>			
                                        </section>  
                                    <% }  %>
                                    <br><label>Relaciones Sexuales</label> 
                                    <input type="text" value="<%=rs.getString("Relaciones")%>" id="number" disabled>
                                    <%if(rs.getString("Relaciones").equals("Si")){ %>
                                        <section id="muestraA" class="seccion">
                                            <label>Edad de inicio</label>
                                            <input type="text" name="inicio1" value="<%=res5%>" id="number" disabled>	
                                            &emsp;&emsp;&emsp;<label>Número de parejas</label>
                                            <input type="text" name="cantidad1" value="<%=res6%>" id="number" disabled>
                                            <br><label>Protección</label>
                                            <input type="text" name="cantidad1" value="<%=res7%>" id="number" disabled>
                                            &emsp;&emsp;&emsp;<label>Anticonceptivo</label>
                                            <input type="text" name="cantidad1" value="<%=res8%>" disabled>
                                        </section>
                                    
                                    <% }  %>

                            <% } %>
			</div>
                        
                        <%if(Genero.equals("Femenino")){ %>
                            <div class="bloque"> 
                                <label id="titulo1">Antecedentes Gineco-Obstrecticos</label>
                            <%  pst = con.getConexion().prepareStatement("select *from Ginecologo where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ %>
                                <section id="muestraA" class="seccion">
                                    <label>Menarca</label>
                                    <input type="text" name="inicio1" value="<%=rs.getString("Menarca")%>" disabled>	
                                    &emsp;&emsp;<label>Duración</label>
                                    <input type="text" name="cantidad1" value="<%=rs.getString("Duracion")%>" disabled>                                   
                                    &emsp;&emsp;<label>Dolor</label>
                                    <input type="text" name="cantidad1" value="<%=rs.getString("Dolor")%>" disabled>
                                    <br><label>Medicamentos</label>
                                    <input type="text" name="cantidad1" value="<%=rs.getString("Medicamentos")%>" disabled>
                                    &emsp;&emsp;<label>Embarazo</label>
                                    <input type="text" name="cantidad1" value="<%=rs.getString("Embarazo")%>" id="number" disabled>
                                    <section id="muestraA" class="seccion">
                                    <%  pst = con.getConexion().prepareStatement("select *from ResGineco where IdPaciente='"+ID+"'");
                                        rs=pst.executeQuery(); 
                                         while(rs.next()){ %> 
                                        <label>Gestas</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Gestas")%>" id="number" disabled>
                                        &emsp;&emsp;<label>Partos</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Partos")%>" id="number" disabled>
                                        &emsp;&emsp;<label>Abortos</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Abortos")%>" id="number" disabled>
                                        &emsp;&emsp;<label>Cesareas</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Cesareas")%>" id="number" disabled>
                                        &emsp;&emsp;<label>Complicaciones</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Complicaciones")%>" id="number" disabled>
                                        <label>Ultima regla</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("UltimaRegla")%>" id="number" disabled>
                                    <% } %>
                                    </section>
                                </section>
                                
                            </div>
                        <% } }%>
                <label id="titulo1">Antecedentes Personales Patológicos</label>
                    <div class="bloque">
                        <%  String cirujia="",alergia="",diabetico="",hipertenso="",otros="";
                            String fechadia="",medicDia="",CompliDia="",CuandoHi="",Medica="",CompliHi="";
                            pst = con.getConexion().prepareStatement("select *from Patologicos where IdPaciente='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){ 
                            cirujia=rs.getString("Cirujia");
                            alergia=rs.getString("Alergia");
                            diabetico=rs.getString("Diabetico");
                            hipertenso=rs.getString("Hipertenso");
                            otros=rs.getString("OtrosPato");  %>
                            <label>Combe</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Combe")%>" disabled>                           
                        <% } 
                            pst = con.getConexion().prepareStatement("select *from ResPatologicos  where IdPacientes='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){
                                fechadia=rs.getString("FechaDia");
                                medicDia=rs.getString("MedicamentoDia");
                                CompliDia=rs.getString("ComplicacionesDia");
                                CuandoHi=rs.getString("CuandoHi");
                                Medica=rs.getString("MedicamentoHi");
                                CompliHi=rs.getString("CompliHip");
                            }
                            if(cirujia.equals("Si")){ %>
                            <br><label>Cirugías</label><br>
                                <div id="contiene_tabla">
                                    <table id="tabla">
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Motivo</th>
                                            <th>Tipo</th>                                            
                                        </tr>
                                        <%
                                          pst = con.getConexion().prepareStatement("select *from Cirujias where IdPaciente='"+ID+"'");
                                          rs=pst.executeQuery();  
                                          while(rs.next()){ %>
                                        <tr>
                                            <td><%=rs.getString("Fecha")%></td>
                                            <td><%=rs.getString("Motivo")%></td>
                                            <td><%=rs.getString("Tipo")%></td>                                           
                                        </tr>
                                        <%  }   %>
                                    </table>
                                </div>
                           <% }else{%><label>Cirugía: No</label>   <% }  
                           if(alergia.equals("Si")){ %>
                           <br><label>Alergias</label><br>
                                <div id="contiene_tabla">
                                    <table id="tabla">
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Causa</th>                                                                         
                                        </tr>
                                        <%
                                          pst = con.getConexion().prepareStatement("select *from Alergias where IdPaciente='"+ID+"'");
                                          rs=pst.executeQuery();  
                                          while(rs.next()){ %>
                                        <tr>
                                            <td><%=rs.getString("Fecha")%></td>
                                            <td><%=rs.getString("Causa")%></td>                                                                              
                                        </tr>
                                        <%  }   %>
                                    </table>
                                </div>                           
                                        <% }else{ %><br><label>Alergias: No</label><br>  <%}
                           if(diabetico.equals("Si")){ %>
                           <br><label>Diabetes</label><br>
                            <label>Desde cuando</label>
                            <input type="text" name="inicio1" value="<%=fechadia%>" disabled>
                            &emsp;&emsp;<label>Medicamento para controlarse</label>
                            <input type="text" name="inicio1" value="<%=medicDia%>" disabled>
                            <br><label>Complicaciones</label>
                            <input type="text" name="inicio1" value="<%=CompliDia%>" disabled>                            
                            <% }else{ %><br><label>Diabetes: No</label><br>   <% }
                           if(hipertenso.equals("Si")){ %>
                           <br><label>Hipertensión</label><br>
                            <label>Desde cuando</label>
                            <input type="text" name="inicio1" value="<%=CuandoHi%>" disabled>
                            &emsp;&emsp;<label>Medicamento</label>
                            <input type="text" name="inicio1" value="<%=Medica%>" disabled>
                            <br><label>Complicaciones</label>
                            <input type="text" name="inicio1" value="<%=CompliHi%>" disabled>                          
                            <% }else{ %><br><label>Hipertensión: No</label><br>  <%}
                           if(otros.equals("Ninguno")){ %>
                           &emsp;&emsp;<br><label>Otros Padecimientos</label>
                           <input type="text" name="inicio1" value="No" id="number" disabled> 
                           <% }else{ %>
                                <textarea class="area" name="texto3" cols="150" rows="5"><%=otros%></textarea>                           
                           <% } %>                            
                       
                    </div>
                    <div class="bloque">
                        <label id="titulo1">Interrogatorio por Aparato y Sistemas</label>
                        <%  String DolorEsto="",Nauseas="",Tos="",Dolorpecho="",fatiga="",dolorcabe="";
                            String Estre="",Diarrea="",otros2="",otros3="",otros4="";
                            pst = con.getConexion().prepareStatement("select *from Sistema1 where IdPaciente='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){  
                                DolorEsto=rs.getString("DolorEstomago");
                                Nauseas=rs.getString("Nauseas");
                                Tos=rs.getString("Tos");
                                Dolorpecho=rs.getString("DolorPecho");
                                fatiga=rs.getString("Fatiga");
                                dolorcabe=rs.getString("DolorCabeza");
                        }
                        pst = con.getConexion().prepareStatement("select *from Sistema1_2 where IdPaciente='"+ID+"'");
                        rs=pst.executeQuery(); 
                        while(rs.next()){
                            Estre=rs.getString("Estreñimiento");
                            Diarrea=rs.getString("Diarrea");
                            otros2=rs.getString("Otros2");
                            otros3=rs.getString("Otros3");
                            otros4=rs.getString("Otros4");
                        } %>
                        <div style="margin: 15px;">
  				<label>Sistema digestivo</label>
  			</div>
                        <label>¿Tienes con frecuencia dolores de estomago?</label>
                        <input type="text" name="inicio1" value="<%=DolorEsto%>" id="number" disabled>
                        &emsp;&emsp;<label>¿Tienes estreñimiento?</label>
                        <input type="text" name="inicio1" value="<%=Estre%>" id="number" disabled>
                        <br><label>Padece Diarrea</label>
                        <input type="text" name="inicio1" value="<%=Diarrea%>" id="number" disabled>
                        &emsp;&emsp;<label>Náuseas o Vómito</label>
                        <input type="text" name="inicio1" value="<%=Nauseas%>" id="number" disabled>
                        <br><label>Otros padecimientos</label>&emsp;&emsp;
                        <%if(otros3.equals("No")){  %> <label>Ninguno</label> <%  }else{ %> 
                            <textarea class="area" name="texto3" cols="150" rows="5" disabled><%=otros3%></textarea>
                        <% } %>
                        <div style="margin: 10px;">
                            <br><label>Sistema respiratorio</label>
  			</div>
                        <label>Tos frecuente</label>
                        <input type="text" name="inicio1" value="<%=Tos%>" id="number" disabled>
                        &emsp;&emsp;<label>Dolor de pecho</label>
                        <input type="text" name="inicio1" value="<%=Dolorpecho%>" id="number" disabled>
                        <br><label>Otros padecimientos</label>
                        <%if(otros4.equals("No")){  %>&emsp;&emsp;<label>Ninguno</label>  <%  }else{ %> 
                            <textarea class="area" name="texto3" cols="150" rows="5" disabled><%=otros4%></textarea>
                        <% }%>
                        <div style="margin: 10px;">
                            <br><label>Sistema circulatorio</label>
  			</div> 
                        <label>Fatiga al realizar ejercicios</label>
                        <input type="text" name="inicio1" value="<%=fatiga%>"id="number" disabled>
                        &emsp;&emsp;<label>Cefalea</label>
                        <input type="text" name="inicio1" value="<%=dolorcabe%>" id="number" disabled>
                        <br><label>Otros padecimientos</label>
                        <%if(otros2.equals("Ninguno")){  %>&emsp;&emsp;<label>Ninguno</label>  <%  }else{ %> 
                            <textarea class="area" name="texto3" cols="150" rows="5" disabled><%=otros2%></textarea>
                        <% }%>
                    </div>
                </div>
	</form>
	</div>
    </body>
    <script>    
        var x = document.getElementById("OtrosPatologicos").value;       
        document.getElementById("textArea").value=x;
	
        var a=document.getElementById("TextOtros2").value;
        document.getElementById("textArea2").value=a;
        
        var b=document.getElementById("TextOtros3").value;
        document.getElementById("Area3").value=b;
        
         var c=document.getElementById("TextOtros4").value;
        document.getElementById("textArea2").value=c;
	</script>
</html>
