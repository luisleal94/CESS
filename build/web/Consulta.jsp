<%-- 
    Document   : Consulta
    Created on : 30/05/2018, 08:51:37 AM
    Author     : luis
--%>

<%@page import="org.jfree.chart.JFreeChart"%>
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
        <script type="text/javascript" src="js/NoBack.js"></script>
        <script type="text/javascript" src="js/Confirmacion.js"></script>
        <script type="text/javascript" src="js/Validacion.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script>
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
            var x=0;
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
                $('#grafica').highcharts({
                  title:{
                  text:'Grafica de Peso corporal'
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
                    <input type="text" name="nombre" required>
                    <label id="label">Apellido Paterno</label>                
                    <input id="Cajas"type="text" name="apellidoP" required>&emsp;&emsp;
                    <label id="label">Apellido Materno</label>                
                    <input id="Cajas" type="text" name="apellidoM" required><br>
                    <div class="botones">
                        <input type="submit" value="Buscar"> 
                    </div>                    
                </form>
            </div>   
            
            <%String paciente=""; 
            float [] pesos= new float[20];
            String [] fec=new String[20];
            int i=0;
            String nombre=request.getParameter("nombre");      
            String apellidoP=request.getParameter("apellidoP");
            String apellidoM=request.getParameter("apellidoM");
            pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"' and Apellido_P='"+apellidoP+"' and Apellido_M='"+apellidoM+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                String Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");
                paciente=rs.getString("idPacientes");
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
            <form method="post">
            <% }
            pst = con.getConexion().prepareStatement("select  Peso,Fecha from ExploracionF where IdPaciente='"+paciente+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                pesos[i]=rs.getFloat("Peso");
                fec[i]=rs.getString("Fecha");
                 System.out.println(pesos[i]);%>
                <input type="text" id="Masa" name="array" value="<%=pesos[i]%>" style="display: none;">
                <input type="text" id="Fecha" name="array2" value="<%=fec[i]%>" style="display: none;">
            <% } %>
                <button type="button" id="boton1" onclick="getFormData();">Estadístico de Peso corporal"</button>
            </form>
        <% }else{
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
        <div id="grafica">
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
            
            <input name="IdDoctor" value="<%=user%>" style="display: none">
            &emsp;<label>Folio de Arancel</label>            
            <input type="text" name="folio" required>            
            <input type="text" id="ID" name="id" style="display: none">
            <input type="text" id="NombreCompleto" name="NombrePaci" style="display: none">
            &emsp;&emsp;<label>Costo de Consulta</label>
            <input type="text" name="Costo" onkeyUp=" return decimales(this);" required> 
            
            <br><br><label id="cabeza" >Signos Vitales</label><br>            
            <label>Peso</label>
            <input type="text" name="peso"  value="0" placeholder="Kilogramos" id="multiplicando" onkeyUp=" return decimalPeso(this);" onChange="multiplicar();" required>
            &emsp;&emsp;&emsp;<label>Estatura</label>
            <input type="text" name="talla" value="1" placeholder="Centimetros" id="multiplicador" onkeyUp=" return decimalTalla(this);" onChange="multiplicar();" required>
            &emsp;&emsp;&emsp;<label>IMC</label>
            <input type="text" name="imc" id="resultado" disabled><br>          
            <label>Temperatura</label>
            <input type="text" name="temp" onkeyUp=" return decimalTemp(this);" required>
            &emsp;&emsp;&emsp;<label>Frecuencia Cardiaca</label>
            <input type="text" name="fc" required><br>
            <label>Frecuencia Respiratoria</label>
            <input type="text" name="fr" required>
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
                document.getElementById("Paciente").value=x;
		 
                var med=document.getElementById("Medic").value;
                document.getElementById("Doc").value=med; 
                
                var Nom=document.getElementById("NombreCom").value;
                document.getElementById("NombreCompleto").value=Nom;             
    </script>
</html>
