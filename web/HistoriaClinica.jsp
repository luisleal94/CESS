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
                <input type="text" value="<%=id%>" name="id" style="display: none"><br>
                <input type="text" id="sexo" name="sexo" style="display: none"><br>
		<label id="titulo1">Antecedentes Heredofamiliares</label>
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
				<tr>
					<td>Abuelo Paterno</td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
				</tr>
				<tr>
					<td>Abuela Paterna</td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
				</tr>
				<tr>
					<td>Abuelo Materno</td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>	
				</tr>
				<tr>
					<td>Abuela Materna</td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
				</tr>
				<tr>
					<td>Padre</td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>	
				</tr>
				<tr>
					<td>Madre</td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>	
				</tr>
				<tr>
					<td>Hermanos</td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>	
				</tr>
				<tr>
					<td>Tios</td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>
					<td><input type="checkbox" name="vehicle" value="si"><br></td>	
				</tr>
			</table>
		</div>

		<div  style="background-color:  #dcf6f2  ">

			<label id="titulo1">Antecedentes Personales No Patológicos</label>
			<label id="titulo2">Hábitos Higienicos</label>
			<div class="bloque" align="center">
				<label>Aseo Corporal</label>
				<input type="text" name="aseo" id="number" onkeyUp="return ValNumero(this);"><label>/ 7</label>
				<label>Aseo Bucal</label>
				<input type="text" name="bucal" id="number" onkeyUp="return ValNumero(this);"><label>/ 3</label>
				<label>Cambio de ropa</label>
				<input type="text" name="ropa" id="number" onkeyUp="return ValNumero(this);"><label>/ 7</label>
			</div>
		
			<div class="bloque" align="center">
				<label id="titulo2">Hábitos Alimenticios</label>
				<label>Lácteos</label>
				<input type="text" name="leche" id="number" onkeyUp="return ValNumero(this);"><label>/ 7</label>
				<label>Proteínas</label>
				<input type="text" name="carne" id="number" onkeyUp="return ValNumero(this);"> <label>/ 7</label>                
				<label>Verduras</label>
				<input type="text" name="verduras" id="number" onkeyUp="return ValNumero(this);"><label>/ 7</label>
				<label>Cereales</label>
				<input type="text" name="cereal" id="number" onkeyUp="return ValNumero(this);"><label>/ 7</label>
				<label>Leguminosas</label>
				<input type="text" name="legum" id="number" onkeyUp="return ValNumero(this);"><label>/ 7</label>
			</div>
			
                        <div class="bloque">
				<label id="titulo2">INMUNIZACIONES (FECHAS)</label>
				<label>ANTITETÁNICA</label>
				<input type="text" name="tetano">
				<label>ANTISARAMPIÓN</label>
				<input type="text" name="sarampion"><br>
				<label>RUBÉOLA</label>
				<input type="text" name="rubeola">				
                                <label>ANTI HBS</label>
				<input type="text" name="hepatitis"> <!--Nuevo agregado-->
			</div>

			<div class="bloque">
				<label id="titulo2">Alcohólismo</label><br>
				<label>¿Ingieres bebidas alcohólicas?</label>
				<div>
					<input type="radio" id="si" name="alcol" value="Si" onclick="mostrarA()">
					<label for="si" class="label">Si</label>
	  				<input type="radio" id="no" name="alcol" value="No" onclick="ocultarA()" checked>
	  				<label for="no" class="label">No</label>
				</div>
	  			<section id="muestraA" style="display: none" class="seccion">
	  				<label>¿A qué edad empezaste a ingerir alcohól?</label>
					<input type="text" name="inicio1">	
					<label>¿Qué cantidad de bebida ingieres?</label>
					<input type="text" name="cantidad1">			
	  			</section> 
			</div>

			<div class="bloque">
				<label id="titulo2">Tabaquismo</label>
				<label>¿Fuma?</label>
				<div>
					<input type="radio" id="si1" name="fuma" value="Si" onclick="mostrarCiga()">
					<label for="si1" class="label">Si</label>
	  				<input type="radio" id="no1" name="fuma" value="No" onclick="ocultarCiga()" checked>
	  				<label for="no1" class="label">No</label>
				</div>
				<section id="muestraC" style="display: none;" class="seccion">
					<label>¿ A qué edad empezaste a fumar?</label>
					<input type="text" name="inicio2">
					<label>¿Cuántos cigarros fuma diario</label>
					<input type="text" name="cantidad2">
				</section>
			</div>

			<div class="bloque">
				<label id="titulo2">Vida sexual</label>
				<label>¿Has tenido relaciones sexuales?</label>
				<div>
					<input type="radio" id="si2" name="rela" value="Si" onclick="mostrar()">
					<label for="si2" class="label">Si</label>
	  				<input type="radio" id="no2" name="rela" value="No" onclick="ocultar()" checked>
	  				<label for="no2" class="label">No</label>
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
		</div>
                <div style="margin: 15px;">
                    <section id="mujer">
			<label id="titulo1">Antecedentes Gineco-Obstrecticos</label>
			<label>Menarca</label>
			<input type="text" name="menarca">
			<label>¿Cada cuantos dias y cuantos dias dura?</label>
			<input type="text" name="duracion"><br>
			<label>Dismenorrea</label>
			<input type="text" name="dolorM">
			<label>¿Te obliga a tomar medicamentos?</label>
			<input type="text" name="MedicaM"><br>
			<label>Embarazos</label>
			<div>
                            <input type="radio" id="si3" name="embara" value="Si" onclick="mostrar2()">
                            <label for="si3" class="label">Si</label>
                            <input type="radio" id="no3" name="embara" value="No" onclick="ocultar2()" checked>
                            <label for="no3" class="label">No</label> 
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
                </div>    

		<div  class="bloque" style="background-color:  #dcf6f2 ">
                    <label id="titulo1">Antecedentes Personales Patológicos</label>
                        <label>Combe</label>
                        <input type="radio" id="siC" name="combe" value="Positivo">
			<label for="siC" class="label">Positivo</label>
  			<input type="radio" id="noC" name="combe" value="Negativo" checked> 
                        <label for="noC" class="label">Negativo</label>
                        <div style="margin: 15px;">
  				<label>Antecedentes Quirúrgicos</label>
  			</div>
			<label>¿Te han intervenido quirúrgicamente?</label>
			<input type="radio" id="si4" name="ciru" value="Si" onclick="mostrar3()">
			<label for="si4" class="label">Si</label>
  			<input type="radio" id="no4" name="ciru" value="No" onclick="ocultar3()" checked> 
  			<label for="no4" class="label">No</label>
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
  			<input type="radio" id="si5" name="alergia" value="Si" onclick="cirujia()">
  			<label for="si5" class="label">Si</label>
  			<input type="radio" id="no5" name="alergia" value="No" onclick="Oculcirujia()" checked>
  			<label for="no5" class="label">No</label>
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
  			<input type="radio" id="si6" name="diabe" value="Si" onclick="mostrarDiabe()">
  			<label for="si6" class="label">Si</label>
  			<input type="radio" id="no6" name="diabe" value="No" onclick="ocultarDiabe()" checked>
  			<label for="no6" class="label">No</label>
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
	  			<input type="radio" id="si7" name="hiper" value="Si" onclick="mostrarH()">
	  			<label for="si7" class="label">Si</label>
	  			<input type="radio" id="no7"  name="hiper" value="No" onclick="ocultarH()" checked>
	  			<label for="no7" class="label">No</label> 
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
		  	<input type="radio" id="siOtros" name="otrosP" value="Si" onclick="mostrarOtros()">
		  	<label for="siOtros" class="label">Si</label>
	  		<input type="radio" id="noOtros" name="otrosP" value="No" onclick="ocultarOtros()" checked> 
	  		<label for="noOtros" class="label">No</label>
                        <section id="otros" style="display: none;" class="seccion">
                            <div class="areatexto">
                            <textarea class="area" name="texto" cols="150" rows="5" autofocus></textarea>
                            </div>
                        </section>
  		</div>
		
		<div class="bloque" style="background-color:  #dcf6f2 ">
			<label id="titulo1">Interrogatorio por Aparato y Sistemas</label>
			<div style="margin: 15px;">
  				<label>Sistema digestivo</label>
  			</div>
			<label>¿Tienes con frecuencia dolores de estomago?</label>
			<input type="radio" id="si9" name="estomago" value="Si">
		  	<label for="si9" class="label">Si</label>
	  		<input type="radio" id="no9" name="estomago" value="No" checked> 
	  		<label for="no9" class="label">No</label><br>
  			<label>¿Tienes estreñimiento?</label>
  			<input type="radio" id="si10" name="estre" value="Si" onclick="mostrarEs()">
		  	<label for="si10" class="label">Si</label>
	  		<input type="radio" id="no10" name="estre" value="No" onclick="ocultarEs()" checked> 
	  		<label for="no10" class="label">No</label><br>
  			<section id="estreni" style="display: none; margin-left: 15px;">
  				<label>¿Con qué frecuencia?</label>
  				<input type="text" name="freEs">
  			</section>
  			<br><label>¿Tienes dearrea?</label>
  			<input type="radio" id="si11" name="diarrea" value="Si" onclick="mostrarDia()">
		  	<label for="si11" class="label">Si</label>
	  		<input type="radio" id="no11" name="diarrea" value="No" onclick="ocultarDia()" checked> 
	  		<label for="no11" class="label">No</label><br>
  			<section id="diarrea" style="display: none; margin-left: 15px;">
  				<label>¿Con qué frecuencia?</label>
  				<input type="text" name="freDea">
  			</section>
  			<br><label>¿Tienes nauseas y/o vomito?</label>
  			<input type="radio" id="si12" name="vomito" value="Si">
		  	<label for="si12" class="label">Si</label>
	  		<input type="radio" id="no12" name="vomito" value="No" checked> 
	  		<label for="no12" class="label">No</label><br>  
                        <br><label>Otros</label>
		  	<input type="radio" id="siOtros3" name="otros3" value="Si" onclick="mostrarOtros3()">
		  	<label for="siOtros3" class="label">Si</label>
	  		<input type="radio" id="noOtros3" name="otros3" value="No" onclick="ocultarOtros3()" checked> 
	  		<label for="noOtros3" class="label">No</label>
                        <section id="otros3" style="display: none;" class="seccion">
                            <div class="areatexto">
                            <textarea class="area" name="texto3" cols="150" rows="5" autofocus></textarea>
                            </div>
                        </section>                        
	  		<div style="margin: 15px;">
  				<label>Sistema respiratorio</label>
  			</div>
	  		<label>¿Tienes frecuentemente tos?</label>
  			<input type="radio" id="si15" name="tos" value="Si">
		  	<label for="si15" class="label">Si</label>
	  		<input type="radio" id="no15" name="tos" value="No" checked> 
	  		<label for="no15" class="label">No</label>
  			<br><br><label>¿Tienes dolor de pecho?</label>
  			<input type="radio" id="si16" name="pecho" value="Si">
		  	<label for="si16" class="label">Si</label>
	  		<input type="radio" id="no16" name="pecho" value="No" checked> 
	  		<label for="no16" class="label">No</label>  
                        <br><label>Otros</label>
		  	<input type="radio" id="siOtros4" name="otros4" value="Si" onclick="mostrarOtros4()">
		  	<label for="siOtros4" class="label">Si</label>
	  		<input type="radio" id="noOtros4" name="otros4" value="No" onclick="ocultarOtros4()" checked> 
	  		<label for="noOtros4" class="label">No</label>
                        <section id="otros4" style="display: none;" class="seccion">
                            <div class="areatexto">
                            <textarea class="area" name="texto4" cols="150" rows="5" autofocus></textarea>
                            </div>
                        </section>       
	  		<div style="margin: 15px;">
  				<label>Sistema circulatorio</label>
  			</div>  			
  			<label>¿Presentas fatiga al realizar ejercicios fisicos?</label>
  			<input type="radio" id="si19" name="fatiga" value="Si">
		  	<label for="si19" class="label">Si</label>
	  		<input type="radio" id="no19" name="fatiga" value="No" checked> 
	  		<label for="no19" class="label">No</label>
  			<br><br><label>¿Tienens dolor de cabeza frecuentemente?</label>
  			<input type="radio" id="si20" name="dolCab" value="Si">
		  	<label for="si20" class="label">Si</label>
	  		<input type="radio" id="no20" name="dolCab" value="No" checked> 
	  		<label for="no20" class="label">No</label>
                        <br><label>Otros</label>
		  	<input type="radio" id="siOtros2" name="otros2" value="Si" onclick="mostrarOtros2()">
		  	<label for="siOtros2" class="label">Si</label>
	  		<input type="radio" id="noOtros2" name="otros2" value="No" onclick="ocultarOtros2()" checked> 
	  		<label for="noOtros2" class="label">No</label>
                        <section id="otros2" style="display: none;" class="seccion">
                            <div class="areatexto">
                            <textarea class="area"  name="texto2" cols="150" rows="5" autofocus></textarea>
                            </div>
                        </section>
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
                        
                            <input id="boton"  type="submit" value="Generar Consulta" >
                                               
                        <%}
                    %>
                </div>
	</form>
	</div>
    </body>
    <script>
		var x = document.getElementById("genero").value;
		var str2 = "Femenino";
                document.getElementById("sexo").value=x;
		if(str2==x){
    		document.getElementById("mujer").style.display="block";
    	}else{
    		document.getElementById("mujer").style.display="none";
    	}
	</script>
</html>
