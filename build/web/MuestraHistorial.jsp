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
                                %>	  			
                                 
			</div>

			<div class="bloque">
				<label id="titulo2">Tabaquismo</label>
				<label>¿Fuma?</label>
				<div>
                                    <input type="text" value="<%=rs.getString("Fuma")%>" disabled>
				</div>                                
			</div>

			<div class="bloque">
				<label id="titulo2">Vida sexual</label>
				<label>¿Has tenido relaciones sexuales?</label>
				<div>
                                    <input type="text" value="<%=rs.getString("Relaciones")%>" disabled>
				</div>
	  			<section id="muestra" style="display: none" class="seccion"> 
	  				<div id="text">
	  				<label>¿A qué edad iniciaste?</label>
                                        <input type="text" name="inicio3">		  			
		  			<label>¿Cuántas parejas has tenido?</label>
                                        <input type="text" name="parejas"><br>
		  			<label>¿Usas preservativo o método anticonceptivo?</label>
		  			<input type="text" name="proteccion">
                                    </div>
	  			</section>
			</div>
                        <% } %>
		</div>
                <div style="margin: 15px;">
                    <section id="mujer">
			<label id="titulo1">Antecedentes Gineco-Obstrecticos</label>
                        <%
                            pst = con.getConexion().prepareStatement("select *from Ginecologo where IdPaciente='"+ID+"'");
                            rs=pst.executeQuery(); 
                            while(rs.next()){
                        %>
			<label>Menarca</label>
                        <input type="text" name="menarca" value="<%=rs.getString("Menarca")%>" disabled>
			<label>¿Cada cuantos dias y cuantos dias dura?</label>
			<input type="text" name="duracion" value="<%=rs.getString("Duracion")%>" disabled><br>
			<label>Dismenorrea</label>
			<input type="text" name="dolorM" value="<%=rs.getString("Dolor")%>" disabled>
			<label>¿Te obliga a tomar medicamentos?</label>
			<input type="text" name="MedicaM" value="<%=rs.getString("Medicamentos")%>" disabled><br>
			<label>Embarazos</label>
			<div>
                            <input type="text"  name="embara" value="<%=rs.getString("Embarazo")%>" disabled>                           
			</div> 
                            <section id="muestra2" style="display: none;" class="seccion">
  				<div>
  				<label>Gestas</label>
  				<input type="text" name="gestas" id="number" onkeyUp="return ValNumero(this);"><!--Nuevo-->
  				<label>Partos</label>
  				<input type="text" name="Partos" id="number" onkeyUp="return ValNumero(this);"><!--Nuevo-->
                                <label>Abortos</label>
  				<input type="text" name="abortos" id="number" onkeyUp="return ValNumero(this);">
  				<label>Cesáreas</label>
  				<input type="text" name="Cesareas" id="number" onkeyUp="return ValNumero(this);">
  				<label>Complicaciones</label>
  				<input type="text" name="CompliEmba"><br>
  				<label>Fecha de ultima regla</label>
  				<input type="text" name="UltimaRe">
                                </div>
                            </section>
                    </section>
                    <% } %>
                </div>    

		<div  class="bloque" style="background-color:  #dcf6f2 ">
                    <%
                        pst = con.getConexion().prepareStatement("select *from Patologicos where IdPaciente='"+ID+"'");
                        rs=pst.executeQuery(); 
                        while(rs.next()){
                    %>
                    <label id="titulo1">Antecedentes Personales Patológicos</label>
                        <label>Combe</label>                        
                        <input type="text" id="siC" name="combe" value="<%=rs.getString("Combe")%>" disabled>			
                        <div style="margin: 15px;">
  				<label>Antecedentes Quirúrgicos</label>
  			</div>
			<label>¿Te han intervenido quirúrgicamente?</label>
			<input type="text" id="siC" name="combe" value="<%=rs.getString("Cirujia")%>" disabled>
  			<section id="muestra3" style="display: none;" class="seccion">
  				<div>
	  				<label>¿De qué?</label>
	  				<input type="text" name="causaQ">
	  				<label>¿En que fecha?</label>
	  				<input type="text" name="fechaQ">
	  				<label>Complicaciones</label>
	  				<input type="text" name="CompQ">
	  			</div>
  			</section>
  			<div style="margin: 15px;">
  				<label>Alergias</label>
  			</div>
  			<label>¿Has presentado alguna reacción alérgica?</label>
  			<input type="text" id="siC" name="combe" value="<%=rs.getString("Alergia")%>" disabled>
	  			<section id="ciru" style="display: none;" class="seccion">
	  				<label>¿En qué fecha?</label>
	  				<input type="text" name="fechaA">
	  				<label>¿Algún medicamento, alimento, sustancia, etc?</label>
	  				<input type="text" name="medicA">
	  			</section>
  			<div style="margin: 15px;">
  				<label>Enfermedades</label>
  			</div>
  			<label>¿Eres diabético?</label>
  			<input type="text" id="siC" name="combe" value="<%=rs.getString("Diabetico")%>" disabled>
  			<section id="diabetes" style="display: none;" class="seccion">
  				<label>¿Desde cuando?</label>
  				<input type="text" name="cuandoDA">
  				<label>¿Con qué medicamento te controlas?</label>
  				<input type="text" name="medicDA"><br>
  				<label>¿Has presentado alguna complicación?</label>
  				<input type="text" name="compliDA">
  			</section><br>
  			<div style="margin: 10px">
  				<label>¿Eres hipertenso?</label>
	  			<input type="text" id="siC" name="combe" value="<%=rs.getString("Hipertenso")%>" disabled>
  			</div>
  			<section id="hiper" style="display: none;" class="seccion">
  				<label>¿Desde cuando?</label>
	  			<input type="text" name="cuandoHI">
	  			<label>¿Con qué medicamento te controlas?</label>
		  		<input type="text" name="medicHI">
		  		<label>¿Has presentado alguna complicación?</label>
		  		<input type="text" name="compliHI">		  		
  			</section>  			
                        <br><label>Otros</label>
                        <%if(rs.getString("OtrosPato").equals("Ninguno")){%>
                            <input type="text" id="siC" name="combe" value="<%=rs.getString("OtrosPato")%>" disabled>
                        <%}else{
                            String otros=rs.getString("OtrosPato");
                        %>
                        <input type="text" id="OtrosPatologicos" value="<%=otros%>" style="visibility: hidden">
                            <section id="otros" class="seccion">
                                <div class="areatexto">
                                <textarea class="area" id="textArea" name="texto" cols="150" rows="5" disabled></textarea>
                                </div>
                            </section>
                        <% } %>
                        
                    <% } %>
  		</div>
		
		<div class="bloque" style="background-color:  #dcf6f2 ">
                    <%
                        pst = con.getConexion().prepareStatement("select *from Sistema1 where IdPaciente='"+ID+"'");
                        rs=pst.executeQuery(); 
                        while(rs.next()){
                    %>
			<label id="titulo1">Interrogatorio por Aparato y Sistemas</label>
			<div style="margin: 15px;">
  				<label>Sistema digestivo</label>
  			</div>
			<label>¿Tienes con frecuencia dolores de estomago?</label>
                        <input type="text" id="si9" name="estomago" value="<%=rs.getString("DolorEstomago")%>" disabled>			
                        <br><label>¿Tienes nauseas y/o vomito?</label>
                        <input type="text" id="si12" name="vomito" value="<%=rs.getString("Nauseas")%>" disabled>  			
                        <label>¿Tienes frecuentemente tos?</label>
  			<input type="text" id="si15" name="tos" value="<%=rs.getString("Tos")%>" disabled>                       
  			<br><br><label>¿Tienes dolor de pecho?</label>
  			<input type="text" id="si16" name="pecho" value="<%=rs.getString("DolorPecho")%>" disabled>                       
                        <label>¿Presentas fatiga al realizar ejercicios fisicos?</label>
                        <input type="text" id="si19" name="fatiga" value="<%=rs.getString("Fatiga")%>" disabled>  			
  			<br><br><label>¿Tienens dolor de cabeza frecuentemente?</label>
  			<input type="text" id="si20" name="dolCab" value="<%=rs.getString("DolorCabeza")%>" disabled>                        
                        <% } 
                        pst = con.getConexion().prepareStatement("select *from Sistema1_2 where IdPaciente='"+ID+"'");
                        rs=pst.executeQuery(); 
                        while(rs.next()){%>
                            <br><label>¿Tienes estreñimiento?</label>
                            <input type="text" value="<%=rs.getString("Estreñimiento")%>" disabled>
                            <br><label>¿Tienes dearrea?</label>
                            <input type="text" value="<%=rs.getString("Diarrea")%>" disabled>
                            <br><label>Otros</label>
                                                        
  			<% } %>                      		  	
                </div>
		<div id="medico">
			<label>Medico Tratante</label>
                        <input type="text" name="medico" value="<% out.println(usuario);%>" disabled style="color:#063452">
                        <label>Cédula</label>
                        <input type="text" name="medico" value="<% out.println(cedula);%>" disabled style="color:#063452">
		</div>
                <div style="margin: 25px;" >
                     <a id="boton" href="inicio.jsp">Regresar</a>
                    <%
                        if(gerarquia.equals("Admin")){%>           
                            <input id="boton" type="submit" value="Generar Consulta">                                              
                        <%
                        }else{  %>                                    
                            <input id="boton"  type="submit" value="Actualizar" >                                               
                        <%}
                    %>
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
