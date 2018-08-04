<%-- 
    Document   : Consulta
    Created on : 30/05/2018, 08:51:37 AM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    HttpSession sesion=request.getSession(false); //Sesion  
    //Obtengo atributo    
    String usuario=(String)sesion.getAttribute("Usuario");
    String cedula="";
    String NOMBRE="";
    String Especialidad="";
    String user="";
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    cedula=(String)sesion.getAttribute("Cedula");
    NOMBRE=(String)sesion.getAttribute("Nombre");
    Especialidad=(String)sesion.getAttribute("Especialidad");
    user=(String)sesion.getAttribute("IDUSER");
    System.out.println(Especialidad);
%>
<!DOCTYPE html>
<html>
    <style>
input[type=text] {
    width: 16%;
    height: 10%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: none;
    border-bottom: 2px solid ;
    border-color: rgba(0,0,255,0.3);
    background-color:white;
    border-radius: 4px;
}

input:focus {
    border-bottom:2px solid  #236087 ;
    background-color: white ;
    transition:0.5s; 
}

input[type=submit] {
    width: 100px;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #145a32 ;
    transition: 0.4s;
}

input[type=button] {
    width: 100px;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=button]:hover {
    background-color: #145a32 ;
    transition: 0.4s;
}

.datos {
    margin-top: 30px;
    margin-bottom: 30px;
    margin-right: 30px;
    margin-left: 30px;
    padding-top:0px;
    padding-left:2%; 
    background:white;
    border: 2px solid #85c1e9;
    border-radius: 10px;
}

.datos2 {
    margin-left:3px;
    margin-right: 3px;
    padding-top:3%;
    padding-left:20px;  
    background:white;
    border: 2px solid #85c1e9;
    border-radius: 10px;
}

.label{
    margin:15px;
}
#buscar{
    background: #e1edfa ;
    margin-top: 10px;
    margin-bottom: 30px;
    margin-right: 150px;
    margin-left: 100px;
    border-radius: 5px;
    text-align: left;
}

#label{
    padding:10px;
}

#boton1{
    background: #154360 ;
    padding: 10px;
    border-radius: 5px;
    display: inline-block;
    width: 20%;
}

#boton0{
    background: #ec7063;
    margin:10px;
    padding: 10px;
    display: inline-block;
    border-radius: 5px;
    color: white;
}

#boton0:hover{
    background: #ec7063;
    margin:10px;
    padding: 10px;
    display: inline-block;
    border-radius: 5px;
    color: white;
    transition: 0.3s;
}

a{
    text-decoration: none;
    color:  white;
}

.h2{
    text-align: center;
    color:  #525354;
}

.botones{
    text-align: center;
    margin-bottom:10px;
    padding: 10px;
}
#boton1:hover{
    background: #2e86c1;
    transition:0.3s;
}

#link{
    text-decoration: none;
    padding: 3px;
    display: inline-block;
    background:  #1798cc ;
    font-weight:700; 
    color: white;
    border-radius: 3px;
}

#link:hover{
    text-decoration: none;
    padding: 3px;
    display: inline-block;
    background:#10688c;
    font-weight:700; 
    color: white;
    border-radius: 3px;
    transition: 0.3s;
}

.area{
    max-width: 95%;
    resize: none;
    font-family: 'roboto';
}

.area:focus{
    border:2px solid #58ade5;
    transition:0.5s; 
}
.areatexto{
    margin-top: 15px; 
    padding: 10px;
    text-align: left;
    font-weight: 400;
    color: #203942;
    font-size: 18px;
}

.doctor{
    background:rgba( 62, 141, 193 ,0.5);
    margin-left:5px; 
    margin-right: 20px;
    padding:5px; 
}

input[type="radio"]{
    display: none;
}

.label{
	color: #212f3d;
	/*background: rgba(0,0,0,0.1);*/
	padding: 5px 15px 5px 51px;
	display: inline-block;
	position: relative;
	font-size: 1em;
	border-radius: 3px;
	cursor: pointer;
	-webkit-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
}

.label:hover{
	background: rgba( 46, 134, 193 ,0.8);
}

.label:before{
	content: "";
	width: 17px;
	height: 17px;
	display: inline-block;
	background:none;
	border: 3px solid #0074D9;
	border-radius: 50%;
	position: absolute;
	left: 17px;
	top: 3px;
}

 input[type="radio"]:checked + label{
	padding: 5px 15px;
	background:#0074D9;
	border-radius: 2px;
	color: white;
}

 input[type="radio"]:checked + label:before{
	display: none;
}

.checkbox label {
  cursor: pointer;
  color:  #1b4f72;
  position: relative;
  padding: 5px 15px 5px 51px;
  font-size: 1em;
  border-radius: 5px;
  -webkit-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease; 
}

.checkbox label:hover {
  background: rgba( 52, 152, 219, 0.2); }

.checkbox label:before {
  content: "";
  
  width: 17px;
  height: 17px;
  position: absolute;
  left: 15px;
  border-radius: 50%;
  background: none;
  border: 3px solid  #2874a6; 
}

.checkbox label:before {
  border-radius: 3px; 
}

.checkbox input[type="checkbox"] {
  display: none; 
}

.checkbox input[type="checkbox"]:checked + label:before {
  display: none; 
}

.checkbox input[type="checkbox"]:checked + label {
  background: #3498db;
  color: #fff;
  padding: 5px 15px; 
}

.seccion{
    margin: 15px;
    padding: 15px;
}

#contiene_tabla2{
    margin-top: 0px;
    margin-left: 5%;
    position: relative;
    margin-right: 5%;
}
#tabla2{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
    margin-top: 0px;
}

#tabla2 td, #tabla2 th{
    border:none;
    padding: 8px;
    position: relative;
}

#tabla2 th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    color: white;
}

#tags{
    width: 80%;
    height:30px;
    border-radius: 10px;
    border: 1px solid #aed6f1;
    padding: 5px;
}

#tags:focus{
    border:0.8px solid  #236087 ;
    transition:0.5s; 
}
#cabeza{
    padding: 10px;
    margin-left:40%; 
}
.especialidad{
    padding: 12px;
    margin-left: 5%;
}

select{
      background: white;
      width: 300px;
      height: 30px;
      padding: 5px;
      border:1px solid  #abb2b9;
      cursor: pointer;
      color: #2874a6;
}

select:focus {
      border:1px solid  #85c1e9;
}
</style>
        <style>
            head,body{
               background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
        </style>
         <link rel="stylesheet" href="css/Personal.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
        <script type="text/javascript" src="js/radios.js"></script> 
        <script type="text/javascript" src="js/NoBack.js"></script>
        <script type="text/javascript" src="js/Confirmacion.js"></script>
        <script type="text/javascript" src="js/Validacion.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $( function() {
              var availableTags = new Array();
              $("#tags").bind("keydown",function(event){
                  var data={Diagnos:$("#tags").val()};
                  $.getJSON("BuscarSintoma",data,function(res,est,jqXHR){
                      availableTags.length=0;
                      $.each(res,function(i,item){
                          availableTags[i]=item;
                      });
                  });
              });

              $( "#tags" ).autocomplete({
                source: availableTags,
                minLength:1
              });
            } );
            
            function multiplicar(){
		  peso = document.getElementById("multiplicando").value;
		  altura = document.getElementById("multiplicador").value;
                  estatura=altura/100;
		  r = (peso/Math.pow(estatura,2)).toFixed(2);
		  document.getElementById("resultado").value = r;
		}
        </script>
        <title>CESS</title>
    </head>
    <body onload="nobackbutton();">
        <a id="link" href="inicio.jsp">Regresar</a>        
        
        <% 
        String id=(String)request.getAttribute("id");//El que obtengo del serlevt 
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        if(id==null){ %>
            <div id="buscar">
                <form action="" method="post">
                    <label id="label">Nombre</label>
                    <input type="text" name="nombre">
                    <label id="label">Apellido Paterno</label>                
                    <input id="Cajas"type="text" name="apellidoP">&emsp;&emsp;
                    <label id="label">Apellido Materno</label>                
                    <input id="Cajas" type="text" name="apellidoM"><br>
                    <div class="botones">
                        <input type="submit" value="Buscar"> 
                    </div>                    
                </form>
            </div>   
            
            <% String nombre=request.getParameter("nombre");      
            String apellidoP=request.getParameter("apellidoP");
            String apellidoM=request.getParameter("apellidoM");
            pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"' and Apellido_P='"+apellidoP+"' and Apellido_M='"+apellidoM+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                String Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");
                %> 
                <div class="datos">
                <div class="h2"><h2>Paciente</h2> </div>
                <form action="" method="post" target="_black">
                    <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none;">
                    <label id="titulos">Nombre</label>
                    <input type="text" id="NombreCom" name="Nombre" value="<%=Nombre%>" disabled style="color: #273746" >
                    &emsp;&emsp;&emsp;<label id="titulos">Edad</label>
                    <input  type="text" name="Edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746" >   
                    &emsp;&emsp;<label>Genero</label>
                    <input type="text" name="Sexo" value="<%=rs.getString("Genero")%>" disabled style="color: #273746">
                    <input type="text" name="Genero" value="<%=rs.getString("Genero")%>" style="display: none">                                    
                    <div class="botones">
                        <input type="submit" id="boton1" value="Historia Clínica" onclick=this.form.action="PasarParamentros">
                    </div>
                </form>
            </div>
            <% }                        
        }else{
            pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes='"+id+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                String Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");     
            %>
            <div class="datos">
            <div class="h2"><h2>Paciente</h2> </div>
                <form action="" method="post">
                    <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none;">
                    <label id="titulos">Nombre</label>
                    <input  type="text" id="NombreCom" name="Nombre" value="<%=Nombre%>">   
                    &emsp;&emsp;<label id="titulos">Edad</label>
                    <input  type="text" name="Edad" value="<%=rs.getString("Edad")%>">   
                    &emsp;&emsp;<label>Genero</label>
                    <input  type="text" name="Sexo" value="<%=rs.getString("Genero")%>">                  
                </form>
            </div>
       <% } }//Busqueda por nombre del usuario a buscar %>
        <!--Mando el parametro ID del paciente que encontre-->            
    <div class="datos2">
        <form name="formulario" action="registrarCon" method="post">
           
                <label>Tipo de Personal</label>
                <select name="Tipo">
                    <option value="Estudiante">Estudiante</option>
                    <option value="Poblacion Abierta">Poblacion Abierta</option>
                    <option value="FESAPAUV">FESAPAUV</option>
                    <option value="SETSUV">SETSUV</option>
                </select> &emsp; &emsp;             
            
                <label>Demanda</label>
                <select name="Demanda">
                    <option value="Programada">Programada</option>
                    <option value="Espontanea">Espontánea</option>
                    <option value="Urgencia">Urgencia</option>                    
                </select><br>
            
            <input name="IdDoctor" value="<%=user%>" style="display: none">
            &emsp;<label>Folio de Arancel</label>            
            <input type="text" name="folio">            
            <input type="text" id="ID" name="id" style="display: none">
            <input type="text" id="NombreCompleto" name="NombrePaci" style="display: none">
            &emsp;&emsp;<label>Costo de Consulta</label>
            <input type="text" name="Costo" onkeyUp=" return decimales(this);"> 
            
            <br><br><label id="cabeza" >Signos Vitales</label><br>
            <label>Peso</label>
            <input type="text" name="peso"  value="0" id="multiplicando" onkeyUp=" return decimalPeso(this);" onChange="multiplicar();">
            &emsp;&emsp;&emsp;<label>Estatura</label>
            <input type="text" name="talla" value="1" id="multiplicador" onkeyUp=" return decimalTalla(this);" onChange="multiplicar();">
            &emsp;&emsp;&emsp;<label>IMC</label>
            <input type="text" name="imc" id="resultado" disabled><br>          
            <label>Temperatura</label>
            <input type="text" name="temp" onkeyUp=" return decimalTemp(this);">
            &emsp;&emsp;&emsp;<label>Frecuencia Cardiaca</label>
            <input type="text" name="fc"><br>
            <label>Frecuencia Respiratoria</label>
            <input type="text" name="fr">
            &emsp;&emsp;&emsp;<label>Presión Arterial</label>
            <input type="text" name="PresionArterial"><br>
            <div class="areatexto">
                <label>Padecimiento Actual</label><br>
                <textarea name="padeci" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="areatexto">
                <label>Exploración Física</label><br>
                <textarea name="exploracion" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="ui-widget">
                <label for="tags">Diagnostico </label>
                <input id="tags" name="Diagnos">
           </div>          
            <div class="areatexto">
                <label>Estudios</label><br>
                    <div>
			<input type="radio" id="si" name="canali" value="Si" onclick="mostrarCana()">
			<label for="si" class="label">Si</label>
	  		<input type="radio" id="no" name="canali" value="No" onclick="ocultarCana()" checked>
	  		<label for="no" class="label">No</label>
                    </div>
                    <section id="mostrarCana" style="display: none;" class="seccion">
                        <div>
                            <label>Estudios de gabinete</label><br>
                            <input type="radio" id="si1" name="gabinete" value="Si" onclick="mostrargabi()">
                            <label for="si1" class="label">Si</label>
                            <input type="radio" id="no1" name="gabinete" value="No" onclick="ocultargabi()" checked>
                            <label for="no1" class="label">No</label>
                        </div>
                        <section id="mostrarGabi" style="display: none;" class="seccion">
                            <textarea name="ResGabi" class="area" cols="150" rows="5" autofocus></textarea>
                        </section>
                        <div>
                            <label>Estudios de Laboratorio</label><br>
                            <input type="radio" id="si2" name="laboratorio" value="Si" onclick="mostrarlabo()">
                            <label for="si2" class="label">Si</label>
                            <input type="radio" id="no2" name="laboratorio" value="No" onclick="ocultarlabo()" checked>
                            <label for="no2" class="label">No</label>
                        </div>
                        <section id="mostrarLabo" style="display: none;" class="seccion">
                            <textarea name="Reslabora" class="area" cols="150" rows="5" autofocus></textarea>
                        </section>
                    
                    </section>
            </div>
            <div class="areatexto">
                <label>Tratamiento</label><br>
                <textarea name="tratamiento" class="area" cols="150" rows="5" autofocus></textarea>
            </div>           
            
            <div id="contiene_tabla2">
                <label>Referir a:</label>
                <div class="checkbox">
                    <table id="tabla2">                        
                        <tr>
                            <td><input type="checkbox" name="pediatra" value="1" id="checkbox1">
                                <label for="checkbox1">Pediatría</label></td>
                            <td><input type="checkbox" name="Ginecologia" value="1" id="checkbox2">
                                <label for="checkbox2">Ginecología</label></td>                        
                            <td><input type="checkbox" name="Gastro" value="1" id="checkbox3">
                                <label for="checkbox3">Gastroenterología</label></td>                       
                            <td><input type="checkbox" name="Neuro" value="1" id="checkbox4">
                                <label for="checkbox4">Neurología</label></td>                        
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="Trauma" value="1" id="checkbox9">
                                <label for="checkbox9">Tramatología</label></td>
                            <td><input type="checkbox" name="Endocri" value="1" id="checkbox6">
                                <label for="checkbox6">Endocrinología</label></td>
                            <td><input type="checkbox" name="Geriatria" value="1" id="checkbox7">
                                <label for="checkbox7">Geriatría</label></td>
                            <td><input type="checkbox" name="Urolo" value="1" id="checkbox8">
                                <label for="checkbox8">Urología</label></td>
                        </tr>
                        <tr>                            
                            <td><input type="checkbox" name="Otorri" value="1" id="checkbox10">
                                <label for="checkbox10">Otorrinología</label></td>
                            <td><input type="checkbox" name="Gene" value="1" id="checkbox11">
                                <label for="checkbox11">Genética</label></td>
                            <td><input type="checkbox" name="Psiqui" value="1" id="checkbox12">
                                <label for="checkbox12">Psiquiatría</label></td>
                            <td><input type="checkbox" name="Cardio" value="1" id="checkbox13">
                                <label for="checkbox13">Cardiología</label></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="Olfta" value="1" id="checkbox15">
                                <label for="checkbox15">Oftalmología</label></td>
                            <td><input type="checkbox" name="Neomo" value="1" id="checkbox16">
                                <label for="checkbox16">Neumología</label>  </td>
                            <td><input type="checkbox" name="Nefro" value="1" id="checkbox17">
                                <label for="checkbox17">Nefrología</label></td>
                            <td><input type="checkbox" name="Hemato" value="1" id="checkbox18">
                                <label for="checkbox18">Hematología</label></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="Vascular" value="1" id="checkbox19">
                                <label for="checkbox19">Vascular periférico</label></td>
                            <td><input type="checkbox" name="inmuno" value="1" id="checkbox14">
                                <label for="checkbox14">Inmuno-alergia</label></td>
                        </tr>
                    </table>
                </div>
            </div><br>
            <div class="doctor">
                <label>Medico Tratante</label>
                <input type="text" name="medico" id="Medic" value="<% out.println(NOMBRE);%>" disabled style="color:#063452">
                <label>Cédula</label>
                <input type="text" name="cedula" value="<% out.println(cedula);%>" disabled style="color:#063452">
                <input type="text" name="Doctor" id="Doc" style="display: none">
                <input type="text" name="Especialidad" value="<%=Especialidad%>" style="display: none">
            </div>  
              
            <div class="botones" >                
                <input id="boton1" type="button" onclick="confirmation()" value="Guardar Consulta y Receta">                          
            </div>                
        </form>
    </div>    
    </body>
    <script>
		var x = document.getElementById("id").value;
                document.getElementById("ID").value=x;
		 
                var med=document.getElementById("Medic").value;
                document.getElementById("Doc").value=med; 
                
                var Nom=document.getElementById("NombreCom").value;
                document.getElementById("NombreCompleto").value=Nom;             
    </script>
</html>
