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
        <!--<div style="margin: 15px;"><a id="link" href="inicio.jsp">Inicio</a></div>-->
	<div class="formulario">
            <form class="formula" method="post" action="GuardarHist" >
                <%String ID=id;%>
                <input type="text" value="<%=id%>" name="id" style="display: none"><br>
                <input type="text" id="sexo" name="sexo" style="display: none"><br>		

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
				<label>Bebidas alcohólicas</label>
				<input type="text" value="<%=rs.getString("Toma")%>" disabled>
                                <label>Fumas</label> 
                                <input type="text" value="<%=rs.getString("Fuma")%>" disabled>
                                <label>Relaciones Sexuales</label> 
                                <input type="text" value="<%=rs.getString("Relaciones")%>" disabled>
                                <%                                    
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
                                <%   }                                   
                                        pst = con.getConexion().prepareStatement("select *from ResVicios where IdPaciente='"+ID+"'");
                                        rs=pst.executeQuery(); 
                                        while(rs.next()){
                                %>   
                                        <section id="muestraA" class="seccion">
                                            <label>Edad de inicio</label>
                                            <input type="text" name="inicio1" value="<%=rs.getString("EdadFum")%>" disabled>	
                                            <label>¿Qué cantidad de bebida ingieres?</label>
                                            <input type="text" name="cantidad1" value="<%=rs.getString("CigarrosDia")%>" disabled>			
                                        </section>  
                                <%  }
                                        pst = con.getConexion().prepareStatement("select *from ResVicios where IdPaciente='"+ID+"'");
                                        rs=pst.executeQuery(); 
                                        while(rs.next()){%>
                                        <section id="muestraA" class="seccion">
                                            <label>Edad de inicio</label>
                                            <input type="text" name="inicio1" value="<%=rs.getString("EdadRela")%>" disabled>	
                                            <label>Número de parejas</label>
                                            <input type="text" name="cantidad1" value="<%=rs.getString("NoParejas")%>" disabled>
                                            <label>Protección</label>
                                            <input type="text" name="cantidad1" value="<%=rs.getString("Proteccion")%>" disabled>
                                            <label>Anticonceptivo</label>
                                            <input type="text" name="cantidad1" value="<%=rs.getString("Anticonceptivo")%>" disabled>
                                        </section>
                        <% } } %>
			</div>
                        <%if(Genero.equals("Femenino")){ %>
                            <div class="bloque"> 
                            <%  pst = con.getConexion().prepareStatement("select *from Ginecologo where IdPaciente='"+ID+"'");
                                rs=pst.executeQuery(); 
                                while(rs.next()){ %>
                                <section id="muestraA" class="seccion">
                                    <label>Menarca</label>
                                    <input type="text" name="inicio1" value="<%=rs.getString("Menarca")%>" disabled>	
                                    <label>Duración</label>
                                    <input type="text" name="cantidad1" value="<%=rs.getString("Duracion")%>" disabled>                                   
                                    <label>Dolor</label>
                                    <input type="text" name="cantidad1" value="<%=rs.getString("Dolor")%>" disabled>
                                    <br><label>Medicamentos</label>
                                    <input type="text" name="cantidad1" value="<%=rs.getString("Medicamentos")%>" disabled>
                                    <label>Embarazo</label>
                                    <input type="text" name="cantidad1" value="<%=rs.getString("Embarazo")%>" disabled>
                                    <section id="muestraA" class="seccion">
                                    <%  pst = con.getConexion().prepareStatement("select *from ResGineco where IdPaciente='"+ID+"'");
                                        rs=pst.executeQuery(); 
                                         while(rs.next()){ %> 
                                        <label>Gestas</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Gestas")%>" disabled>
                                        <label>Partos</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Partos")%>" disabled>
                                        <label>Abortos</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Abortos")%>" disabled>
                                        <label>Cesareas</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Cesareas")%>" disabled>
                                        <label>Complicaciones</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("Complicaciones")%>" disabled>
                                        <label>Ultima regla</label>
                                        <input type="text" name="inicio1" value="<%=rs.getString("UltimaRegla")%>" disabled>
                                    <% } %>
                                    </section>
                                </section>
                                
                            </div>
                        <% } }%>
                <label id="titulo1">Antecedentes Personales Patológicos</label>
                    <div class="bloque">
                        <%  pst = con.getConexion().prepareStatement("select *from Patologicos where IdPaciente='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){ %>
                            <label>Combe</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Combe")%>" disabled>
                            <label>Cirugía</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Cirujia")%>" disabled>
                            <label>Alergia</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Alergia")%>" disabled>
                            <br><label>Diabetico</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Diabetico")%>" disabled>                            
                            <label>Hipertenso</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Hipertenso")%>" disabled>
                            <br><label>Otros</label>
                            <textarea><%=rs.getString("OtrosPato")%></textarea>
                        <% } %>
                        <%  pst = con.getConexion().prepareStatement("select *from ResPatologicos  where IdPacientes='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){ %>
                            <label>Desde cuando</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("FechaDia")%>" disabled>
                            <label>Medicamento para controlarse</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("MedicamentoDia")%>" disabled>
                            <label>Complicaciones</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("ComplicacionesDia")%>" disabled>
                            <label>Inicio de la Hipertensión</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("CuandoHi")%>" disabled>
                            <label>Medicamento</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("MedicamentoHi")%>" disabled>
                            <label>Complicaciones</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("CompliHip")%>" disabled>
                        <% } %>    
                    </div>
                    <div class="bloque">
                        <label id="titulo1">Interrogatorio por Aparato y Sistemas</label>
                        <%  pst = con.getConexion().prepareStatement("select *from Sistema1 where IdPaciente='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){ %>
                            <label>Dolor de estomago frecuente</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("DolorEstomago")%>" disabled>
                            <label>Náuseas o Vómito</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Nauseas")%>" disabled>
                            <label>Tos frecuente</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Tos")%>" disabled>
                            <label>Dolor de pecho</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("DolorPecho")%>" disabled>
                            <label>Fatiga al realizar ejercicios</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Fatiga")%>" disabled>
                            <label>Cefalea</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("DolorCabeza")%>" disabled>
                        <%  } %>
                        <%  pst = con.getConexion().prepareStatement("select *from Sistema1_2 where IdPaciente='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){ %>
                            <label>Estreñimiento</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Estreñimiento")%>" disabled>
                            <label>Padece Diarrea</label>
                            <input type="text" name="inicio1" value="<%=rs.getString("Diarrea")%>" disabled>
                            <textarea><%=rs.getString("Otros2")%></textarea>
                            <textarea><%=rs.getString("Otros3")%></textarea>
                            <textarea><%=rs.getString("Otros4")%></textarea>
                        <%  } %>
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
