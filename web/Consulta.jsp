<%-- 
    Document   : Consulta
    Created on : 30/05/2018, 08:51:37 AM
    Author     : luis
--%>

<%@page import="java.util.Calendar"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    Calendar calender = Calendar.getInstance();
    int anio=calender.get(Calendar.YEAR);
    HttpSession sesion=request.getSession(false); //Sesion  
    //Obtengo atributo    
    String usuario=(String)sesion.getAttribute("Usuario");
    String cedula="";
    String NOMBRE="";
    String Especialidad="";
    String user="";
    String Nombre="";
    String edad="";
    String band="";
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
    <head>
    <style>
        head,body{
            background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
        </style>
        <link rel="stylesheet" href="css/Personal.css">
        <link rel="stylesheet" href="css/EstiloConsulta.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
        <script type="text/javascript" src="js/radios.js"></script>
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>  
        <script type="text/javascript" src="js/NoBack.js"></script>
        <script type="text/javascript" src="js/Confirmacion.js"></script>
        <script type="text/javascript" src="js/Validacion.js"></script>
        <script type="text/javascript" src="js/ValidaForm.js"></script>
        <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script> Estos son los que hacen el ajar-->
        <!--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
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
            var config = {};
            var pesos=[];
            var array2=[];
            var array3=[];
            var array4=[];
            var dias=[]; 
            var sis=[];
            var x=0,chart,char2;
            var fechas=[];
            function getFormData(){
                var i=0;
                $('input#Masa').each(function () {
                 config[this.name] = this.value;
                 pesos[i]=this.value;
                 x=parseFloat(pesos[i]);
                 array2.push(x);
                 i++;
                });               
                $('input#Fecha').each(function () {
                config[this.name] = this.value;
                    fechas.push(this.value);
                    i++;
                });
                /*$('#grafica').highcharts({
                  title:{
                  text:'Grafica de Peso corporal'
                }*/
                chart = new Highcharts.Chart({
                chart: {
		renderTo: 'grafica',
                defaultSeriesType: 'line'
		},
		title: {
                    text: 'Grafica de Peso Corporal'
		},
                xAxis:{
                  categories:fechas
                },
                  yAxis:{
                  title:'Kilogramos Kg'
                },plotLines:[{value:0,with:1,color:'#808080'}],
                  tooltip:{
                  valueSuffix:'Kg'},
                legend:{
                  layout:'vertical',align:'right',verticalAlign:'middle',borderWith:0
                },
                series:[{
                  name:'Peso',data:array2 
                  }]//Datos ---- name:'Peso',data:[25,23,21]
                });
            }
            function PresionArterial(){
                var i=0;
                $('input#Diasto').each(function () {
                 config[this.name] = this.value;
                 dias[i]=this.value;
                 x=parseFloat(dias[i]);
                 array3.push(x);
                 i++;
                });
                $('input#Sisto').each(function () {
                 config[this.name] = this.value;
                 sis[i]=this.value;
                 x=parseFloat(sis[i]);
                 array4.push(x);
                 i++;
                });
                $('input#Fecha').each(function () {
                config[this.name] = this.value;
                    fechas.push(this.value);
                    i++;
                });
                
                char2=new Highcharts.Chart({
                chart: {
                    renderTo: 'PresionArte',
                    defaultSeriesType: 'line'
		},
                title: {
                    text: 'Grafica de Presión Arterial'
		},
                xAxis:{
                  categories:fechas
                },
                  yAxis:{
                  title:'Valores'
                },plotLines:[{value:0,with:1,color:'#808080'}],
                  tooltip:{
                  valueSuffix:''},
                legend:{
                  layout:'vertical',align:'right',verticalAlign:'middle',borderWith:0
                },
                series:[{
                  name:'Diastolica',data:array3},
                  {name:'Sistolica',data:array4}]//Datos ---- name:'Peso',data:[25,23,21]
                });
            }
        </script>
        <title>CESS</title>
    </head>
    <body onload="nobackbutton();">
        <a id="link" href="inicio.jsp">Menú principal</a>        
        
        <% 
        String id=(String)request.getAttribute("id");//El que obtengo del serlevt 
        String Edad=(String)request.getAttribute("Edad");
        band=(String)request.getAttribute("band");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        if(band=="1"){
            String paciente=""; 
            float [] pesos= new float[20];
            String [] fec=new String[20];
            float [] diastolica=new float[20];
            float [] sistolica=new float[20];
            int i=0;
            pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes='"+id+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");
                paciente=rs.getString("idPacientes");
                edad=rs.getString("Anio");
                %> 
                <div class="datos">
                <div class="h2"><h2>Paciente</h2> </div>
                <form action="" method="post" target="_black">
                    <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none;">
                    <label id="titulos">Nombre</label>
                    <input type="text" id="NombreCom" name="Nombre" value="<%=Nombre%>" disabled style="color: #273746" >
                    &emsp;&emsp;&emsp;<label id="titulos">Edad</label>
                    <input  type="text" name="Edad" value="<%=anio-Integer.parseInt(edad)%>" disabled style="color: #273746" >   
                    &emsp;&emsp;<label>Genero</label>
                    <input type="text" name="Sexo" value="<%=rs.getString("Genero")%>" disabled style="color: #273746">
                    <input type="text" name="Genero" value="<%=rs.getString("Genero")%>" style="display: none">                                    
                    <div class="botones">
                        <input type="submit" id="boton1" value="Historia Clínica" onclick=this.form.action="PasarParamentros">
                    </div>
                </form>
            </div>
            <form method="post">
            <% }
            pst = con.getConexion().prepareStatement("select  Peso,Diastolica,Asistolica,Fecha from ExploracionF where IdPaciente='"+paciente+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                pesos[i]=rs.getFloat("Peso");
                fec[i]=rs.getString("Fecha");
                diastolica[i]=rs.getFloat("Diastolica");
                sistolica[i]=rs.getFloat("Asistolica");
                System.out.println(pesos[i]);%>
                <input type="text" id="Masa" name="array" value="<%=pesos[i]%>" style="display: none;">
                <input type="text" id="Fecha" name="array2" value="<%=fec[i]%>" style="display: none;">
                <input type="text" id="Diasto" name="array2" value="<%=diastolica[i]%>" style="display: none;">
                <input type="text" id="Sisto" name="array2" value="<%=sistolica[i]%>" style="display: none;">
            <% } %>
            <button type="button" id="botonP" onclick="getFormData(),this.disabled=true">Estadístico de Peso corporal"</button>
            <button type="button" id="botonP" onclick="PresionArterial(),this.disabled=true">Estadístico de Presión Arterial"</button>
            </form>
        <% }else{
            pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes='"+id+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");     
            %>
            <div class="datos">
            <div class="h2"><h2>Paciente</h2> </div>
                <form action="" method="post">
                    <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none;">
                    <label id="titulos">Nombre</label>
                    <input  type="text" id="NombreCom" name="Nombre" value="<%=Nombre%>">   
                    &emsp;&emsp;<label id="titulos">Edad</label>
                    <input  type="text" name="Edad" value="<%=Edad%>">   
                    &emsp;&emsp;<label>Genero</label>
                    <input  type="text" name="Sexo" value="<%=rs.getString("Genero")%>">                  
                </form>
            </div>
       <% } }//Busqueda por nombre del usuario a buscar %>
        <!--Mando el parametro ID del paciente que encontre--> 
        <div id="grafica">
        </div>
        <div id="PresionArte">
        </div>
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
            
            <input name="IdDoctor" value="<%=user%>" style="display: none;">
            &emsp;<label>Folio de Arancel</label>            
            <input type="text" id="Folio" name="folio" required>            
            <input type="text" id="ID" name="id" style="display: none;">
            <input type="text" name="NombrePaci" value="<%=Nombre%>" style="display: none;">
            &emsp;&emsp;<label>Costo de Consulta</label>
            <input type="text" id="Precio" name="Costo" onkeyUp=" return decimales(this);" required> 
            
            <br><br><label id="cabeza" >Signos Vitales</label><br>            
            <label>Peso</label>
            <input type="text" name="peso"  value="0" placeholder="Kilogramos" id="multiplicando" onkeyUp=" return decimalPeso(this);" onChange="multiplicar();" required>
            &emsp;&emsp;&emsp;<label>Estatura</label>
            <input type="text" name="talla" value="1" placeholder="Centimetros" id="multiplicador" onkeyUp=" return decimalTalla(this);" onChange="multiplicar();" required>
            &emsp;&emsp;&emsp;<label>IMC</label>
            <input type="text" name="imc" id="resultado" disabled><br>          
            <label>Temperatura</label>
            <input type="text" name="temp" id="Temperatura" onkeyUp=" return decimalTemp(this);" required>
            &emsp;&emsp;&emsp;<label>Frecuencia Cardiaca</label>
            <input type="text" name="fc" id="FC"  onkeyUp=" return decimalFC(this);" required><br>
            <label>Frecuencia Respiratoria</label>
            <input type="text" name="fr" id="FR" required>
            &emsp;&emsp;&emsp;<label>Presión Arterial</label>
            <input type="text" id="Sistolica" name="Sistolica" placeholder="Sistolica">/
            <input type="text" id="Diastolica" name="Diastolica" placeholder="Diastólica"><br>
            <div class="areatexto">
                <label>Padecimiento Actual</label><br>
                <textarea name="padeci" id="Padecimiento" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="areatexto">
                <label>Exploración Física</label><br>
                <textarea name="exploracion" id="Exploracion" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="ui-widget">
                <label for="tags">Diagnostico </label>
                <input id="tags" name="Diagnos" required>
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
                <textarea name="tratamiento" id="Tratamiento" class="area" cols="150" rows="5" autofocus></textarea>
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
                                <label for="checkbox9">Traumatología</label></td>
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
                <label>Otra referencia</label>
                    <input type="radio" id="siRefe" name="ResRefe" value="Si" onclick="mostrarRere()">
                    <label for="siRefe" class="label">Si</label>
                    <input type="radio" id="noRefe" name="ResRefe" value="No" onclick="ocultarRefe()" checked>
                    <label for="noRefe" class="label">No</label>
                    <section id="OtraRefe" style="display: none;">
                        <input name="OtraRefe" type="text" width="200px">
                    </section>
            </div><br>
            <div class="doctor">
                <label>Medico Tratante</label>
                <input type="text" name="medico" id="Medic" value="<%=NOMBRE%>" disabled style="color:#063452">
                <label>Cédula</label>
                <input type="text" name="cedula" value="<% out.println(cedula);%>" disabled style="color:#063452">
                <input type="text" name="Doctor" value="<%=NOMBRE%>" style="display: none">
                <input type="text" name="Especialidad" value="<%=Especialidad%>" style="display: none">
            </div>  
              
            <div class="botones" >                
                <input id="boton1" type="button" onclick="ValidaForm()" value="Guardar Consulta y Receta">                          
            </div>                
        </form>
    </div>    
    </body>
    <script>
		var x = document.getElementById("id").value;
                document.getElementById("ID").value=x;
                document.getElementById("Paciente").value=x;
		var Nom=document.getElementById("NombreCom").value;
    </script>
</html>
