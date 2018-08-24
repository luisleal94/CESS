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
        <script type="text/javascript" src="js/NoBack.js"></script>
	<script type="text/javascript" src="js/Validacion.js"></script>
        <script type="text/javascript" src="js/Tabla.js"></script>
        <script type="text/javascript" src="js/Confirmacion.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
    </head>
    <body onload="nobackbutton();">
       <!--<img src="img/uv.jpg" style="float: left; width: 80px; height: 80px;">-->
	<div id="encabezado" >
		<label id="cabeza">HISTORIAL CLÍNICO DEL PACIENTE</label>
	</div>
            <div class="datosPaciente">
                <% //Busqueda por ID del usuario a buscar
                   String id=(String)request.getAttribute("id");//El que obtengo del serlevt 
                   int Edad=(int)request.getAttribute("Edad");//El que obtengo del serlevt 
                   if(id==null){
                       response.sendRedirect("inicio.jsp"); 
                   }
                    String genero;
                    Conexion con= new Conexion();
                    PreparedStatement pst;
                    ResultSet rs;
                    pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes='"+id+"'");
                    rs=pst.executeQuery();
                     while(rs.next()){
                %>
		<label >Nombre</label>
                &emsp;<input type="text" name="Nombre" value="<%=rs.getString("Nombre")%>" style="color:#063452" disabled >
                <% 
                Calendar calender = Calendar.getInstance();
                String fecha;
                int dia=calender.get(Calendar.DAY_OF_MONTH);
                int mes=(calender.get(Calendar.MONTH))+1;
                int anio=calender.get(Calendar.YEAR);
                fecha=dia+" / "+mes+" / "+anio;
                %>
		&emsp;&emsp;<label >Fecha</label>
                &emsp;<input type="text" name="fecha" value="<%=fecha%>" style="color:#063452" disabled>
		&emsp;&emsp;<label>Estado Civil</label>
                &emsp;<input type="text" name="estado" value="<%=rs.getString("EstadoC")%>" style="color:#063452" disabled><br>
		<label>Ocupacion</label>
                &emsp;<input type="text" name="Ocupacion" value="<%= rs.getString("Ocupacion") %>" style="color:#063452" disabled>
		&emsp;&emsp;<label>Domicilio</label>                
                &emsp;<input type="text" name="Ocupacion" value="<%=rs.getString("Domicilio")%>" style="color:#063452" disabled>
                &emsp;&emsp;<label>Edad</label>  
                &emsp;<input type="text" name="Edad" value="<%=Edad%>" style="color:#063452" disabled>
                <input type="text" id="genero" name="sexo" value="<%=rs.getString("Genero")%>" style="display: none;">
                <%genero=rs.getString("Genero"); %>
                <% } %>  
	</div>
        
	<div class="formulario">
            <form class="formula" method="post" action="GuardarHist" >
                <input type="text" value="<%=id%>" name="id" style="display: none"><br>
                <input type="text" value="<%=Edad%>" name="Edad" style="display: none"><br>
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
					<td><input type="checkbox" name="AbueloP0" value="Vive"><br></td>
					<td><input type="checkbox" name="AbueloP1" value="DM"><br></td>
					<td><input type="checkbox" name="AbueloP2" value="HTA"><br></td>
					<td><input type="checkbox" name="AbueloP3" value="Neoplasia"><br></td>
					<td><input type="checkbox" name="AbueloP4" value="Obesidad"><br></td>
					<td><input type="checkbox" name="AbueloP5" value="TBP"><br></td>
					<td><input type="checkbox" name="AbueloP6" value="Cardiopatias"><br></td>
					<td><input type="checkbox" name="AbueloP7" value="Alergias"><br></td>
					<td><input type="checkbox" name="AbueloP8" value="Mal formaciones"><br></td>
					<td><input type="checkbox" name="AbueloP9" value="Toxicomanias"><br></td>
					<td><input type="checkbox" name="AbueloP10" value="Cancer"><br></td>
				</tr>
				<tr>
					<td>Abuela Paterna</td>
					<td><input type="checkbox" name="AbuelaP0" value="Vive"><br></td>
					<td><input type="checkbox" name="AbuelaP1" value="DM"><br></td>
					<td><input type="checkbox" name="AbuelaP2" value="HTA"><br></td>
					<td><input type="checkbox" name="AbuelaP3" value="Neoplasia"><br></td>
					<td><input type="checkbox" name="AbuelaP4" value="Obesidad"><br></td>
					<td><input type="checkbox" name="AbuelaP5" value="TBP"><br></td>
					<td><input type="checkbox" name="AbuelaP6" value="Cardiopatias"><br></td>
					<td><input type="checkbox" name="AbuelaP7" value="Alergias"><br></td>
					<td><input type="checkbox" name="AbuelaP8" value="Mal formaciones"><br></td>
					<td><input type="checkbox" name="AbuelaP9" value="Toxicomanias"><br></td>
					<td><input type="checkbox" name="AbuelaP10" value="Cancer"><br></td>
				</tr>
				<tr>
					<td>Abuelo Materno</td>
					<td><input type="checkbox" name="AbueloMa0" value="Vive"><br></td>
					<td><input type="checkbox" name="AbueloMa1" value="DM"><br></td>
					<td><input type="checkbox" name="AbueloMa2" value="HTA"><br></td>
					<td><input type="checkbox" name="AbueloMa3" value="Neoplasia"><br></td>
					<td><input type="checkbox" name="AbueloMa4" value="Obesidad"><br></td>
					<td><input type="checkbox" name="AbueloMa5" value="TBP"><br></td>
					<td><input type="checkbox" name="AbueloMa6" value="Cardiopatías"><br></td>
					<td><input type="checkbox" name="AbueloMa7" value="Alergias"><br></td>
					<td><input type="checkbox" name="AbueloMa8" value="Mal formaciones"><br></td>
					<td><input type="checkbox" name="AbueloMa9" value="Toxicomanias"><br></td>
					<td><input type="checkbox" name="AbueloMa10" value="Cancer"><br></td>	
				</tr>
				<tr>
					<td>Abuela Materna</td>
					<td><input type="checkbox" name="AbuelaMa1" value="Vive"><br></td>
					<td><input type="checkbox" name="AbuelaMa2" value="DM"><br></td>
					<td><input type="checkbox" name="AbuelaMa3" value="HTA"><br></td>
					<td><input type="checkbox" name="AbuelaMa4" value="Neoplasia"><br></td>
					<td><input type="checkbox" name="AbuelaMa5" value="Obesidad"><br></td>
					<td><input type="checkbox" name="AbuelaMa6" value="TBP"><br></td>
					<td><input type="checkbox" name="AbuelaMa7" value="Cardiopatias"><br></td>
					<td><input type="checkbox" name="AbuelaMa8" value="Alergias"><br></td>
					<td><input type="checkbox" name="AbuelaMa9" value="Mal formaciones"><br></td>
					<td><input type="checkbox" name="AbuelaMa10" value="Toxicomanias"><br></td>
					<td><input type="checkbox" name="AbuelaMa11" value="Cancer"><br></td>
				</tr>
				<tr>
					<td>Padre</td>
					<td><input type="checkbox" name="Padre0" value="Vive"><br></td>
					<td><input type="checkbox" name="Padre1" value="DM"><br></td>
					<td><input type="checkbox" name="Padre2" value="HTA"><br></td>
					<td><input type="checkbox" name="Padre3" value="Neoplasia"><br></td>
					<td><input type="checkbox" name="Padre4" value="Obesidad"><br></td>
					<td><input type="checkbox" name="Padre5" value="TBP"><br></td>
					<td><input type="checkbox" name="Padre6" value="Cardiopatías"><br></td>
					<td><input type="checkbox" name="Padre7" value="Alergias"><br></td>
					<td><input type="checkbox" name="Padre8" value="Mal formaciones"><br></td>
					<td><input type="checkbox" name="Padre9" value="Toxicomanias"><br></td>
					<td><input type="checkbox" name="Padre10" value="Cancer"><br></td>	
				</tr>
				<tr>
					<td>Madre</td>
					<td><input type="checkbox" name="Madre0" value="Vive"><br></td>
					<td><input type="checkbox" name="Madre1" value="DM"><br></td>
					<td><input type="checkbox" name="Madre2" value="HTA"><br></td>
					<td><input type="checkbox" name="Madre3" value="Neoplasia"><br></td>
					<td><input type="checkbox" name="Madre4" value="Obesidad"><br></td>
					<td><input type="checkbox" name="Madre5" value="TBP"><br></td>
					<td><input type="checkbox" name="Madre6" value="Cardiopatias"><br></td>
					<td><input type="checkbox" name="Madre7" value="Alergias"><br></td>
					<td><input type="checkbox" name="Madre8" value="Mal formaciones"><br></td>
					<td><input type="checkbox" name="Madre9" value="Toxicomanias"><br></td>
					<td><input type="checkbox" name="Madre10" value="Cancer"><br></td>	
				</tr>
				<tr>
					<td>Hermanos</td>
					<td><input type="checkbox" name="Hermanos0" value="Vive"><br></td>
					<td><input type="checkbox" name="Hermanos1" value="DM"><br></td>
					<td><input type="checkbox" name="Hermanos2" value="HTA"><br></td>
					<td><input type="checkbox" name="Hermanos3" value="Neoplasia"><br></td>
					<td><input type="checkbox" name="Hermanos4" value="Obesidad"><br></td>
					<td><input type="checkbox" name="Hermanos5" value="TBP"><br></td>
					<td><input type="checkbox" name="Hermanos6" value="Cardiopatias"><br></td>
					<td><input type="checkbox" name="Hermanos7" value="Alergias"><br></td>
					<td><input type="checkbox" name="Hermanos8" value="Mal formaciones"><br></td>
					<td><input type="checkbox" name="Hermanos9" value="Toxicomanias"><br></td>
					<td><input type="checkbox" name="Hermanos10" value="Cancer"><br></td>	
				</tr>
				<tr>
					<td>Tios</td>
					<td><input type="checkbox" name="Tios0" value="Vive"><br></td>
					<td><input type="checkbox" name="Tios1" value="DM"><br></td>
					<td><input type="checkbox" name="Tios2" value="HTA"><br></td>
					<td><input type="checkbox" name="Tios3" value="Neoplasia"><br></td>
					<td><input type="checkbox" name="Tios4" value="Obesidad"><br></td>
					<td><input type="checkbox" name="Tios5" value="TBP"><br></td>
					<td><input type="checkbox" name="Tios6" value="Cardiopatias"><br></td>
					<td><input type="checkbox" name="Tios7" value="Alergias"><br></td>
					<td><input type="checkbox" name="Tios8" value="Mal formaciones"><br></td>
					<td><input type="checkbox" name="Tios9" value="Toxicomanias"><br></td>
					<td><input type="checkbox" name="Tios10" value="Cancer"><br></td>	
				</tr>
			</table>
		</div>

		<div  style="background-color:white">

			<label id="titulo1">Antecedentes Personales No Patológicos</label>
			<label id="titulo2">Hábitos Higienicos</label>
			<div class="bloque" align="center">
				<label>Aseo Corporal</label>
                                <input type="text" name="aseo" id="number" onkeyUp="return ValNumero(this);" required><label>/ 7</label>
				&emsp;&emsp;<label>Aseo Bucal</label>
				&emsp;&emsp;<input type="text" name="bucal" id="number" onkeyUp="return ValNumero2(this);" required><label>/ 3</label>
				&emsp;&emsp;<label>Cambio de ropa</label>
				<input type="text" name="ropa" id="number" onkeyUp="return ValNumero(this);" required><label>/ 7</label>
			</div>
		
			<div class="bloque" align="center">
				<label id="titulo2">Hábitos Alimenticios</label>
				<label>Lácteos</label>
				<input type="text" name="leche" id="number" onkeyUp="return ValNumero(this);"><label>/ 7</label>
				&emsp;&emsp;<label>Proteínas</label>
				&emsp;&emsp;<input type="text" name="carne" id="number" onkeyUp="return ValNumero(this);" required> <label>/ 7</label>                
				&emsp;&emsp;<label>Verduras</label>
				&emsp;&emsp;<input type="text" name="verduras" id="number" onkeyUp="return ValNumero(this);" required><label>/ 7</label>
				&emsp;&emsp;<label>Cereales</label>
				&emsp;&emsp;<input type="text" name="cereal" id="number" onkeyUp="return ValNumero(this);" required><label>/ 7</label>
				&emsp;&emsp;<label>Leguminosas</label>
				<input type="text" name="legum" id="number" onkeyUp="return ValNumero(this);" required><label>/ 7</label>
			</div>
			
                        <div class="bloque">
                            <label id="titulo2">INMUNIZACIONES (FECHAS)</label><br>
				<label>ANTITETÁNICA</label>&emsp;   
                                <div>
                                    <input type="radio" id="siTeta" name="ResTetano" value="Si" onclick="mostrarTetano()">
                                    <label for="siTeta" class="label">Si</label>
                                    <input type="radio" id="noTeta" name="ResTetano" value="No" onclick="ocultarTetano()" checked>
                                    <label for="noTeta" class="label">No</label>
				</div>
                                <section id="MuestraTetano" style="display: none" class="seccion">
                                    <input type="text" name="tetano" size="10" maxlength="10" onKeyUp = "this.value=formateafecha(this.value);" placeholder="DD/MM/AAAA" class="fecha" >
                                </section>                                                                
				&emsp;&emsp;&emsp;<label>ANTISARAMPIÓN</label>&emsp;&emsp;
                                <div>
                                    <input type="radio" id="siSaram" name="ResSaram" value="Si" onclick="mostrarSaram()">
                                    <label for="siSaram" class="label">Si</label>
                                    <input type="radio" id="noSaram" name="ResSaram" value="No" onclick="ocultarSaram()" checked>
                                    <label for="noSaram" class="label">No</label>
				</div>
                                <section id="MuestraSaram" style="display: none" class="seccion">
                                    <input type="text" name="sarampion" size="10" maxlength="10" onKeyUp = "this.value=formateafecha(this.value);" placeholder="DD/MM/AAAA" class="fecha" >
                                </section>                                				
				<label>RUBÉOLA</label>&emsp;&emsp;
                                <div>
                                    <input type="radio" id="siRubeo" name="ResRubeo" value="Si" onclick="mostrarRubeo()">
                                    <label for="siRubeo" class="label">Si</label>
                                    <input type="radio" id="noRubeo" name="ResRubeo" value="No" onclick="ocultarRubeo()" checked>
                                    <label for="noRubeo" class="label">No</label>
				</div>
                                <section id="MuestraRubeo" style="display: none" class="seccion">
                                    <input type="text" name="rubeola" size="10" maxlength="10" onKeyUp = "this.value=formateafecha(this.value);" placeholder="DD/MM/AAAA" class="fecha" >
                                </section>                                
                                &emsp;&emsp;&emsp;<label>ANTI HBS</label>
                                <div>
                                    <input type="radio" id="siANTI" name="ResANTI" value="Si" onclick="mostrarAnti()">
                                    <label for="siANTI" class="label">Si</label>
                                    <input type="radio" id="noANTI" name="ResANTI" value="No" onclick="ocultarAnti()" checked>
                                    <label for="noANTI" class="label">No</label>
				</div>
                                <section id="MuestraANTI" style="display: none" class="seccion">
                                    <input type="text" name="hepatitis" size="10" maxlength="10" onKeyUp = "this.value=formateafecha(this.value);" placeholder="DD/MM/AAAA" class="fecha" >
                                </section>
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
	  				<label>¿A qué edad empezaste a ingerir alcohol?</label>
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
		  			<label>¿Usas preservativo?</label>
                                        <input type="radio" id="siPre" name="proteccion" value="Si" onclick="mostrarProte()">
                                        <label for="siPre" class="label">Si</label>
                                        <input type="radio" id="noPre" name="proteccion" value="No" onclick="ocultarProte()" checked> 
                                        <label for="noPre" class="label">No</label>		  			                                 
                                        &emsp;&emsp;&emsp;&emsp;<label>¿Usas Método Anticonceptivo?</label>		  			
                                        <input type="radio" id="siMet" name="anticonceptivo" value="Si" onclick="mostrarAnticon()">
                                        <label for="siMet" class="label">Si</label>                                            
                                        <input type="radio" id="noMet" name="anticonceptivo" value="No" onclick="ocultarAnticon()" checked> 
                                        <label for="noMet" class="label">No</label>  
                                        <section id="MuestraAnti" style="display: none;" class="seccion">
                                            <label>¿Cual o Cuales?</label>
                                            <input type="text" name="NombreAnticon">					
                                        </section>
                                    </div>
	  			</section>
			</div>
		</div>
                <div style="margin: 15px;">
                    <section id="mujer">
			<label id="titulo1">Antecedentes Gineco-Obstrecticos</label>
			<label>Menarca</label>
			<input type="text" name="menarca">
			<label>Duración</label>
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
  				&emsp;&emsp;<label>Partos</label>
  				<input type="text" name="Partos" id="number" onkeyUp="return ValNumero(this);"><!--Nuevo-->
                                &emsp;&emsp;<label>Abortos</label>
  				<input type="text" name="abortos" id="number" onkeyUp="return ValNumero(this);">
  				&emsp;&emsp;<label>Cesáreas</label>
  				<input type="text" name="Cesareas" id="number" onkeyUp="return ValNumero(this);">
                                &emsp;&emsp;<br><label>Complicaciones</label>
  				<input type="text" name="CompliEmba"><br>
  				<label>Fecha de ultima regla</label>
  				<input type="text" name="UltimaRe" size="10" maxlength="10" onKeyUp = "this.value=formateafecha(this.value);" placeholder="DD/MM/AA" class="fecha">
                                </div>
                            </section>
                    </section>
                </div>    

		<div  class="bloque" style="background-color:white">
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
                                <div class="boton">
                                    <input type="button" id="add" class="input" value="Agregar Cirugía" onclick="Javascript:addRow()">
                                </div>
                                <div class="contiene_tabla" align="center">
                                    <table class="table" id="myTableData">
                                        <tr>
                                            <td style="width:5%">Borrar</td>
                                            <td style="width:30%">Fecha</td>
                                            <td style="width:30%">Motivo</td>
                                            <td style="width:30%">Tipo</td>
                                        </tr>
                                    </table>
                                </div>
                                <input type="text" name="Valor1" id="Valor" style="display: none;">
  			</section>
  			<div style="margin: 15px;">
  				<label>Alergias</label>
  			</div>
  			<label>¿Has presentado alguna reacción alérgica?</label>
  			<input type="radio" id="si5" name="alergia" value="Si" onclick="cirujia()">
  			<label for="si5" class="label">Si</label>
  			<input type="radio" id="no5" name="alergia" value="No" onclick="Oculcirujia()" checked>
  			<label for="no5" class="label">No</label>
                            <section id="ciru" style="display: none;" class="">
                                <div class="boton">
                                    <input type="button" id="add" class="input" value="Agregar Alergia" onclick="Javascript:addRow2()">
                                </div>                                
                                <div class="contiene_tabla" align="center">
                                    <table class="table" id="myTableData2">
                                        <tr>
                                            <td style="width:10%">Borrar</td>
                                            <td style="width:45%">Fecha</td>
                                            <td style="width:45%">A que</td>
                                        </tr>
                                    </table>
                                </div>
                                <input type="text" name="Valor2" id="Valor2" style="display: none">
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
                                <input type="text" name="medicHI"><br>
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
		
		<div class="bloque" style="background-color:white">
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
  			<br><label>¿Tienes dirrea?</label>
  			<input type="radio" id="si11" name="diarrea" value="Si" onclick="mostrarDia()">
		  	<label for="si11" class="label">Si</label>
	  		<input type="radio" id="no11" name="diarrea" value="No" onclick="ocultarDia()" checked> 
	  		<label for="no11" class="label">No</label><br>
  			<section id="diarrea" style="display: none; margin-left: 15px;">
  				<label>¿Con qué frecuencia?</label>
  				<input type="text" name="freDea">
  			</section>
  			<br><label>¿Tienes náuseas y/o vómito?</label>
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
  			<br><br><label>¿Tiene cefalea frecuentemente?</label>
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
                      <input id="boton" type="submit" value="Generar Consulta" onclick="confirmation()">                    
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
