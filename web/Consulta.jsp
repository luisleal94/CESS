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
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
%>
<!DOCTYPE html>
<html>
    <style>
input[type=text] {
    width: 15%;
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
    width: 15%;
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
</style>
        <style>
            head,body{
               background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
        </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
        <title>JSP Page</title>
    </head>
    <body>
        <a id="link" href="inicio.jsp">Regresar</a>
        <div id="buscar">
            <form action="" method="post">
                <label id="label">Nombre</label>
                <input type="text" name="nombre">
                <input type="submit" value="Bucar"> 
            </form>
        </div>
        <div class="datos">
      <% //Busqueda por nombre del usuario a buscar
          String nombre=request.getParameter("nombre");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"'");
        rs=pst.executeQuery();
       
        while(rs.next()){
    %>
        <div class="h2"><h2>Paciente</h2> </div>
            <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>" style="display: none;">
            <label id="titulos">Nombre</label>
            <input type="text" name="nombre" value="<%=rs.getString("Nombre")%>" disabled style="color: #273746" >
            <label id="titulos">Apellido Paterno</label>
            <input type="text" name="apellidoP" value="<%=rs.getString("Apellido_P")%>" disabled style="color: #273746">
            <label id="titulos">Apellido Materno</label>
            <input type="text" name="apellidoM" value="<%=rs.getString("Apellido_M")%>" disabled style="color: #273746"><br><br>
            <div class="botones">
                <div id="boton1"><a href="HistoriaClinica.jsp?id=<%=rs.getString("idPacientes")%>" >Ver historial</a></div>
            </div>
        </div>
        <!--Mando el parametro ID del paciente que encontre-->            
    <% } %>
    
    <div class="datos">
        <form action="registrarCon" method="post">
            <input type="text" id="ID" name="id" style="display: none">
            <br><label >Exploracion Física</label><br>
            <label>Peso (Kg)</label>
            <input type="text" name="peso" onkeyUp="return decimales(this);" >
            <label>Talla (mts)</label>
            <input type="text" name="talla" onkeyUp="return decimales(this);">
            <label>IMC</label>
            <input type="text" name="imc" ><br>
            <label>Temperatura</label>
            <input type="text" name="temp" onkeyUp="return decimales(this);">
            <label>Frecuencia Cardiaca</label>
            <input type="text" name="fc">
            <label>Frecuencia Respiratoria</label>
            <input type="text" name="fr" onkeyUp="return decimales(this);"><br>
            <div class="areatexto">
                <label>Padecimiento Actual</label><br>
                <textarea name="padeci" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="areatexto">
                <label>Diagnóstico</label><br>
                <textarea name="diagnos" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="areatexto">
                <label>Estidio de Laboratorio y Gabinete</label><br>
                <textarea name="labora" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="areatexto">
                <label>Referencia</label><br>
                <textarea name="referencia" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="areatexto">
                <label>Tratamiento</label><br>
                <textarea name="tratamiento" class="area" cols="150" rows="5" autofocus></textarea>
            </div>
            <div class="especialidad">
                <label>Canalización</label>
                <div class="checkbox">
                    <input type="checkbox" name="Anestesiología" value="Anestesiología">Anestesiología
                    <input type="checkbox" name="gine" value="GinecoObste"> Ginecología y Obstetricia
                    <input type="checkbox" name="Trauma" value="Traumato" > Traumatología y Ortopedia
                    <input type="checkbox" name="cardio" value="cardiologia" > Cardiología 
                    <input type="checkbox" name="urologo" value="urologia" > Urología
                </div>
            </div>
            <div class="doctor">
                <label>Medico Tratante</label>
                <input type="text" name="medico" value="<% out.println(usuario);%>" disabled style="color:#063452">
            </div>        
            <div class="botones" >
                <!--<input id="boton1" type="submit" value="Nota Médica">-->
                <input id="boton1" type="submit" value="Generar Consulta">
                <div id="boton1" ><a href="#">Nota Médica</a></div>
                <!--<div id="boton1"><a href="#" >Generar Consulta</a></div>-->
            </div>
        </form>
    </div>    
    </body>
    <script>
		var x = document.getElementById("id").value;
                document.getElementById("ID").value=x;
		
	</script>
</html>
