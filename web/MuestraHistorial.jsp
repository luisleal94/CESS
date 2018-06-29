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
                    //String iD=request.getParameter("id");  //El que se manda por herf
                    System.out.println("Id obtenido:"+id);
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
                <% 
                Calendar calender = Calendar.getInstance();
                String fecha;
                int dia=calender.get(Calendar.DAY_OF_MONTH);
                int mes=(calender.get(Calendar.MONTH))+1;
                int anio=calender.get(Calendar.YEAR);
                fecha=dia+" / "+mes+" / "+anio;
                %>
		<label >Fecha</label>
                <input type="text" name="fecha" value="<%=fecha%>" style="color:#063452" disabled>
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
        <div style="margin: 15px;"><a id="link" href="inicio.jsp">Inicio</a></div>
	<div class="formulario">
            <form class="formula" method="post" action="GuardarHist" >
                <%String ID=id;%>
                <input type="text" value="<%=id%>" name="id" style="display: none"><br>
                <input type="text" id="sexo" name="sexo" style="display: none"><br>		

		<div  style="background-color:  #dcf6f2  ">
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
				<label>ANTITETÁNICA</label>
				<input type="text" name="tetano" value="<%=rs.getString("Tetano")%>"disabled>
				<label>ANTISARAMPIÓN</label>
				<input type="text" name="sarampion" value="<%=rs.getString("Sarampion")%>"disabled><br>
				<label>RUBÉOLA</label>
				<input type="text" name="rubeola" value="<%=rs.getString("Rubeola")%>"disabled>				
                                <label>ANTI HBS</label>
				<input type="text" name="hepatitis" value="<%=rs.getString("hepatitis")%>"disabled> <!--Nuevo agregado-->
			</div>
                        <% } %>
			<div class="bloque">
                        <%
                            pst = con.getConexion().prepareStatement("select *from VIcios where IdPaciente='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){
                        %>
				<label id="titulo2">Alcohólismo</label><br>
				<label>¿Ingieres bebidas alcohólicas?</label>
				<div>                               
                                    <input type="text" value="<%=rs.getString("Toma")%>" disabled>
				</div>
                                <%
                                    if(rs.getString("Toma").equals("Si")){
                                        pst = con.getConexion().prepareStatement("select *from ResVicios where IdPaciente='"+ID+"'");
                                        rs=pst.executeQuery(); 
                                        while(rs.next()){
                                %>
                                        <section id="muestraA" class="seccion">
                                            <label>¿A qué edad empezaste a ingerir alcohól?</label>
                                            <input type="text" name="inicio1" value="<%=rs.getString("EdadInicio")%>" disabled>	
                                            <label>¿Qué cantidad de bebida ingieres?</label>
                                            <input type="text" name="cantidad1" value="<%=rs.getString("CantidadAlco")%>" disabled>			
                                        </section>                                     
                                <%   } }
                                }
                                %>  			
                                 
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
