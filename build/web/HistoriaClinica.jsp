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
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
%>
<!DOCTYPE html>
<html>
    <head>
	<title>CESS</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/estiloH.css">
	<script type="text/javascript" src="js/radios.js"></script>
	<script type="text/javascript" src="js/Validacion.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
    </head>
    <body>
       <img src="uv.png" style="float: left; width: 80px; height: 80px;">
	<div id="encabezado">
		<label id="cabeza"">HISTORIAL CLÍNICO DEL PACIENTE</label>
	</div>

	<div class="datosPaciente">
                <% //Busqueda por ID del usuario a buscar
                    String id=request.getParameter("id");
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
                <input type="text" id="genero" name="genero" value="<%=rs.getString("Genero")%>" style="visibility: hidden;">
                 <% } %>  
	</div>

	<div class="formulario">
            <form class="formula" method="post" action="#" >
		<label id="titulo1">Antecedentes Heredofamiliares</label>
		<div class="contiene_tabla" align="center">
			<table class="table">
				<tr>
					<th></th>
					<th>Vive</th>
					<th>DM</th>
					<th>HTA</th>
					<th>Neoplastia</th>
					<th>Obecidad</th>
					<th>TBP</th>
					<th>Cardiopatias</th>
					<th>Alergias</th>
					<th>Mal formaciones</th>
					<th>Dependencias</th>
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

			<label id="titulo1">Antecedentes Personales No Patologicos</label>
			<label id="titulo2">Abitos Higienicos (Numero de veces por semana)</label>
			<div class="bloque" align="center">
				<label>Aseo Corporal</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
				<label>Aseo Bucal</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
				<label>Cambio de ropa</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
			</div>
		
			<div class="bloque" align="center">
				<label id="titulo2">Habitos Alimenticios (Numero de veces por semana)</label>
				<label>Leche</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
				<label>Carne</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
				<label>Huevos</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
				<label>Verduras</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
				<label>Cereales</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
				<label>Leguminosas</label>
				<input type="text" name="cuantos" id="number" onkeyUp="return ValNumero(this);">
			</div>
			<div class="bloque">
				<label id="titulo2">INMUNIZACIONES (FECHAS)</label>
				<label>ANTITETÁNICA</label>
				<input type="text" name="cuantos">
				<label>ANTISARAMPIÓN</label>
				<input type="text" name="cuantos"><br>
				<label>ANTIRUBEOLA</label>
				<input type="text" name="cuantos">
				<label>ANTIHEPÁTICA</label>
				<input type="text" name="cuantos"><br>
				<label>DESPARASITACION</label>
				<input type="text" name="cuantos">
			</div>

			<div class="bloque">
				<label id="titulo2">Alcoholismo</label><br>
				<label>¿Ingieres bebidas alcoholicas?</label>
				<div>
					<input type="radio" id="si" name="alcol" value="si" onclick="mostrarA()">
					<label for="si" class="label">Si</label>
	  				<input type="radio" id="no" name="alcol" value="No" onclick="ocultarA()" checked>
	  				<label for="no" class="label">No</label>
				</div>
	  			<section id="muestraA" style="display: none" class="seccion">
	  				<label>¿ A QUE EDAD EMPEZASTE A TOMAR ?</label>
					<input type="text" name="inicio">	
					<label>¿ QUE CANTIDAD DE BEBIDAS INGIERES?</label>
					<input type="text" name="cantidad">			
	  			</section> 
			</div>

			<div class="bloque">
				<label id="titulo2">Tabaquismo</label>
				<label>¿Fuma?</label>
				<div>
					<input type="radio" id="si1" name="fuma" value="si" onclick="mostrarCiga()">
					<label for="si1" class="label">Si</label>
	  				<input type="radio" id="no1" name="fuma" value="No" onclick="ocultarCiga()" checked>
	  				<label for="no1" class="label">No</label>
				</div>
				<section id="muestraC" style="display: none;" class="seccion">
					<label>¿ A QUE EDAD EMPEZASTE A FUMAR?</label>
					<input type="text" name="inicio">
					<label>¿Cuantos cigarros fuma diario</label>
					<input type="text" name="cantidad">
				</section>
			</div>

			<div class="bloque">
				<label id="titulo2">Vida sexual</label>
				<label>¿Has tenido relaciones sexuales?</label>
				<div>
					<input type="radio" id="si2" name="rela" value="si" onclick="mostrar()">
					<label for="si2" class="label">Si</label>
	  				<input type="radio" id="no2" name="rela" value="No" onclick="ocultar()" checked>
	  				<label for="no2" class="label">No</label>
				</div>
	  			<section id="muestra" style="display: none" class="seccion"> 
	  				<div id="text">
	  				<label>¿A QUE EDAD INICIASTE?</label>
		  			<input type="text" name="inici">
		  			<label>¿CON QUE FRECUENCIA?</label>
		  			<input type="text" name="inici"><br>
		  			<label>¿CUÁNTAS PAREJAS HAS TENIDO?</label>
		  			<input type="text" name="parejas">
		  			<label>¿CON SEXO SERVIDORAS?</label>
		  			<input type="text" name="parejas"><br>
		  			<label>¿USAS PROTECCIÓN, CUAL?</label>
		  			<input type="text" name="parejas">
                                    </div>
	  			</section>
			</div>
		</div>
                <div style="margin: 15px;">
                    <section id="mujer">
			<label id="titulo1">Antecedentes Gineco-Obstrecticos</label>
			<label>Edad de primera mestruacion</label>
			<input type="text" name="inici">
			<label>¿Cada cuantos dias y cuantos dias dura?</label>
			<input type="text" name="inici"><br>
			<label>¿Presentas dolor?</label>
			<input type="text" name="inici">
			<label>¿Te obliga a tomar medicamentos?</label>
			<input type="text" name="inici"><br>
			<label>Te has embarazado</label>
			<div>
                            <input type="radio" id="si3" name="embara" value="si" onclick="mostrar2()">
                            <label for="si3" class="label">Si</label>
                            <input type="radio" id="no3" name="embara" value="No" onclick="ocultar2()" checked>
                            <label for="no3" class="label">No</label> 
			</div> 
                            <section id="muestra2" style="display: none;" class="seccion">
  				<div>
  				<label>¿Cuantos embarazos?</label>
  				<input type="text" name="inici" id="number" onkeyUp="return ValNumero(this);">
  				<label>Abortos</label>
  				<input type="text" name="abortos" id="number" onkeyUp="return ValNumero(this);">
  				<label>Cesareas</label>
  				<input type="text" name="Cesareas" id="number" onkeyUp="return ValNumero(this);">
  				<label>Complicaciones</label>
  				<input type="text" name="Complicaciones"><br>
  				<label>Fecha de ultima regla</label>
  				<input type="text" name="fecha">
                                </div>
                            </section>
                    </section>
                </div>    

		<div  class="bloque" style="background-color:  #dcf6f2 ">
			<label id="titulo1">Antecedentes Personales Patológicos</label>
			<div style="margin: 15px;">
  				<label>Antecedentes Quirúrjicos</label>
  			</div>
			<label>¿Te han intervenido quirúrjicamente?</label>
			<input type="radio" id="si4" name="quirur" value="si" onclick="mostrar3()">
			<label for="si4" class="label">Si</label>
  			<input type="radio" id="no4" name="quirur" value="No" onclick="ocultar3()" checked> 
  			<label for="no4" class="label">No</label>
  			<section id="muestra3" style="display: none;" class="seccion">
  				<div>
	  				<label>¿De qué?</label>
	  				<input type="text" name="deque">
	  				<label>¿En que fecha?</label>
	  				<input type="text" name="fechaQ">
	  				<label>Complicaciones</label>
	  				<input type="text" name="CompQ">
	  			</div>
  			</section>
  			<div style="margin: 15px;">
  				<label>Alergias</label>
  			</div>
  			<label>¿Has presentado alguna reacción alergica?</label>
  			<input type="radio" id="si5" name="alergia" value="si" onclick="cirujia()">
  			<label for="si5" class="label">Si</label>
  			<input type="radio" id="no5" name="alergia" value="No" onclick="Oculcirujia()" checked>
  			<label for="no5" class="label">No</label>
	  			<section id="ciru" style="display: none;" class="seccion">
	  				<label>¿En que fecha?</label>
	  				<input type="text" name="fechaA">
	  				<label>¿Algún medicamento, alimento, sustancia, etc?</label>
	  				<input type="text" name="medicA">
	  			</section>
  			<div style="margin: 15px;">
  				<label>Enfermedades</label>
  			</div>
  			<label>¿Eres diabetico?</label>
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
  				<label>¿Eres hipertenso</label>
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
		  				<label>¿Presentas convulciones?
		  		</label>
  			</section>
  			<label>¿Presentas convulciones?</label>
		  	<input type="radio" id="si8" name="convul" value="Si" onclick="mostrarCon()">
		  	<label for="si8" class="label">Si</label>
	  		<input type="radio" id="no8" name="convul" value="No" onclick="ocultarCon()" checked> 
	  		<label for="no8" class="label">No</label>
	  		<section id="convulcion" style="display: none;" class="seccion">
	  			<label>¿Desde cuando?</label>
		  		<input type="text" name="cuandoConv">
		  		<label>¿Qué las ocaciona?</label>
		  		<input type="text" name="ocaciona">
		  		<label>¿Con qué medicamento te controlas?</label>
			  	<input type="text" name="medicConv">
			  	<label>¿Has presentado alguna complicación?</label>
			  	<input type="text" name="compliConv">
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
  			<br><label>¿Tienes agruras?</label>
  			<input type="radio" id="si13" name="agruras" value="Si" >
		  	<label for="si13" class="label">Si</label>
	  		<input type="radio" id="no13" name="agruras" value="No" checked> 
	  		<label for="no13" class="label">No</label><br>
  			<br><label>¿Te has desparasitado?</label>
  			<input type="radio" id="si14" name="despa" value="Si" onclick="mostrarDes()">
		  	<label for="si14" class="label">Si</label>
	  		<input type="radio" id="no14" name="despa" value="No" onclick="ocultarDes()" checked> 
	  		<label for="no14" class="label">No</label>
	  			<section id="despa" style="display: none; margin-left: 15px;" class="seccion">
	  				<label>¿Desde cuando?</label>
	  				<input type="text" name="cuandoDes">
	  				<label>¿Con qué?</label>	
	  				<input type="text" name="conqueDes">	
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
  			<br><br><label>¿Dolor de esplada?</label>
  			<input type="radio" id="si17" name="esplada" value="Si">
		  	<label for="si17" class="label">Si</label>
	  		<input type="radio" id="no17" name="esplada" value="No" checked> 
	  		<label for="no17" class="label">No</label>
	  		<div style="margin: 15px;">
  				<label>Sistema circulatorio</label>
  			</div>
  			<label>¿Tienes palpitaciones?</label>
  			<input type="radio" id="si18" name="palpita" value="Si">
		  	<label for="si18" class="label">Si</label>
	  		<input type="radio" id="no18" name="palpita" value="No" checked> 
	  		<label for="no18" class="label">No</label>
  			<br><br><label>¿Presentas fatiga al realizar ejercicios fisicos?</label>
  			<input type="radio" id="si19" name="fatiga" value="Si">
		  	<label for="si19" class="label">Si</label>
	  		<input type="radio" id="no19" name="fatiga" value="No" checked> 
	  		<label for="no19" class="label">No</label>
  			<br><br><label>¿Tienens dolor de cabeza frecuentemente?</label>
  			<input type="radio" id="si20" name="dolCab" value="Si">
		  	<label for="si20" class="label">Si</label>
	  		<input type="radio" id="no20" name="dolCab" value="No" checked> 
	  		<label for="no20" class="label">No</label>
		</div>
		
		<div class="bloque" style="background-color:  #dcf6f2 ">
			<label id="titulo1">Exploracion Física</label>
			<label>Peso (Kg)</label>
			<input type="text" name="peso" onkeyUp="return decimales(this);" >
			<label>Talla (mts)</label>
			<input type="text" name="talla" onkeyUp="return decimales(this);">
			<label>IMC</label>
			<input type="text" name="imc" ><br>
			<label>Temperatura</label>
			<input type="text" name="temp" onkeyUp="return decimales(this);">
			<label>Frecuencia Cardiaca</label>
			<input type="text" name="fc"><br>
			<label>Frecuencia Respiratoria</label>
			<input type="text" name="fr" onkeyUp="return decimales(this);">
		</div>
		<div id="medico">
			<label>Medico Tratante</label>
                        <input type="text" name="medico" value="<% out.println(usuario);%>" disabled style="color:#063452">
		</div>
                <div style="margin: 25px;" >
                    <a id="boton" href="inicio.jsp">Regresar</a>
                    <a id="boton" href="#">Guardar</a>
                </div>
	</form>
	</div>
    </body>
    <script>
		var x = document.getElementById("genero").value;
		var str2 = "Femenino";

		if(str2==x){
    		document.getElementById("mujer").style.display="block";
    	}else{
    		document.getElementById("mujer").style.display="none";
    	}
	</script>
</html>
