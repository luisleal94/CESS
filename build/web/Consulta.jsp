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
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    cedula=(String)sesion.getAttribute("Cedula");
    NOMBRE=(String)sesion.getAttribute("Nombre");
    Especialidad=(String)sesion.getAttribute("Especialidad");
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
    border-radius: 5px;
    padding-top:0px;
    padding-left:15px; 
    background: #e1edfa ;
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
    padding: 5px;
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

.seccion{
    margin: 15px;
    padding: 15px;
}

#contiene_tabla{
    margin-top: 0px;
    margin-left: 5%;
    position: relative;
    margin-right: 5%;
}
#tabla{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
    margin-top: 0px;
}

#tabla td, #tabla th{
    border: 1px solid #ddd;
    padding: 8px;
    position: relative;
}

#tabla tr:nth-child(even){background-color: #f2f2f2;}

#tabla tr:hover {background-color: #ddd;}

#tabla th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #54adfc;
    color: white;
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
		  r = peso/Math.pow(altura,2);
		  document.getElementById("resultado").value = r;
		}
        </script>
        <title>CESS</title>
    </head>
    <body>
        <a id="link" href="inicio.jsp">Regresar</a>        
        <div class="datos">
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
                    <input type="submit" value="Buscar"> 
                </form>
            </div>           
            <% String nombre=request.getParameter("nombre");      
            pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                String Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");
                %> 
                <div class="h2"><h2>Paciente</h2> </div>
                <form action="" method="post">
                    <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none;">
                    <label id="titulos">Nombre</label>
                    <input type="text" id="NombreCom" name="Nombre" value="<%=Nombre%>" disabled style="color: #273746" >
                    &emsp;&emsp;&emsp;<label id="titulos">Edad</label>
                    <input  type="text" name="Edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746" >   
                    &emsp;<label>Genero</label>
                    <input  type="text" name="Sexo" value="<%=rs.getString("Genero")%>" disabled style="color: #273746" >                    
                    <div class="botones">
                        <input type="submit" id="boton1" value="Historia Clínica" onclick=this.form.action="PasarParamentros">
                    </div>
                </form>
             
            <% }                        
        }else{
            pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes='"+id+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                String Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");     
            %>
            <div class="h2"><h2>Paciente</h2> </div>
                <form action="" method="post">
                    <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none;">
                    <label id="titulos">Nombre</label>
                    <input  type="text" id="NombreCom" name="Nombre" value="<%=Nombre%>">   
                    &emsp;&emsp;&emsp;<label id="titulos">Edad</label>
                    <input  type="text" name="Edad" value="<%=rs.getString("Edad")%>">   
                    <div class="botones">
                    &emsp;<label>Genero</label>
                    <input  type="text" name="Sexo" value="<%=rs.getString("Genero")%>">   
                    <div class="botones">
                        <input type="submit" id="boton1" value="Historia Clínica" onclick=this.form.action="PasarParamentros">
                    </div>
                </form>
       <% } }//Busqueda por nombre del usuario a buscar %>
        <!--Mando el parametro ID del paciente que encontre-->            
    </div>  
    <div class="datos">
        <form name="formulario" action="registrarCon" method="post">
            <div>
                <label>Tipo de Personal</label>
                <select name="Tipo">
                    <option value="Estudiante">Estudiante</option>
                    <option value="Poblacion Abierta">Poblacion Abierta</option>
                    <option value="FESAPAUV">FESAPAUV</option>
                    <option value="SETSUV">SETSUV</option>
                </select>
            </div>
            <div>
                <label>Demanda</label>
                <select name="Demanda">
                    <option value="Programada">Programada</option>
                    <option value="Espontanea">Espontánea</option>
                    <option value="Urgencia">Urgencia</option>                    
                </select>
            </div>
            <label>Folio de Arancel</label>
            <input type="text" name="folio">            
            <input type="text" id="ID" name="id" style="display: none">
            <input type="text" id="NombreCompleto" name="NombrePaci" style="display: none">
            &emsp;&emsp;<label>Costo de Consulta</label>
            <input type="text" name="Costo" onkeyUp=" return decimales(this);"> 
            
            <br><label >Signos Vitales</label><br>
            <label>Peso</label>
            <input type="text" name="peso"  value="0" id="multiplicando" onkeyUp=" return decimalPeso(this);" onChange="multiplicar();">
            <label>Talla (mts)</label>
            <input type="text" name="talla" id="multiplicador" onkeyUp=" return decimales(this);" onChange="multiplicar();">
            <label>IMC</label>
            <input type="text" name="imc" id="resultado" disabled><br>
            <label>Temperatura</label>
            <input type="text" name="temp" onkeyUp=" return decimales(this);">
            <label>Frecuencia Cardiaca</label>
            <input type="text" name="fc"><br>
            <label>Frecuencia Respiratoria</label>
            <input type="text" name="fr">
            <label>Presión Arterial</label>
            <input type="text" name="fr"><br>
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
            <div class="especialidad">
                <label>Referir a:</label>
                <div class="checkbox">
                    <input type="checkbox" name="Anestesiología" value="Anestesiología">Anestesiologí<br>
                    <input type="checkbox" name="gine" value="GinecoObste"> Ginecología y Obstetricia<br>
                    <input type="checkbox" name="Trauma" value="Traumato" > Traumatología y Ortopedia<br>
                    <input type="checkbox" name="cardio" value="cardiologia" > Cardiología <br>
                    <input type="checkbox" name="urologo" value="urologia" > Urología<br>
                </div>
            </div>             
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
