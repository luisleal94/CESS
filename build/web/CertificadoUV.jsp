<%-- 
    Document   : CertificadoUV
    Created on : 28/09/2018, 11:46:40 AM
    Author     : luis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    HttpSession sesion=request.getSession(false);
    String usuario=(String)sesion.getAttribute("Usuario");
    String gerarquia=(String)sesion.getAttribute("Gerarquia");
    String Nombre="",IdMedico="",Paciente="",Edad="";
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    else{
        if(gerarquia.equals("Admin")){
            response.sendRedirect("CessAdmin.jsp"); 
        }
        if(gerarquia.equals("Super")){
            response.sendRedirect("CessSuper.jsp"); 
        }
    }
    Nombre=(String)sesion.getAttribute("Nombre");
    IdMedico=(String)request.getAttribute("Doctor");
    Paciente=(String)request.getAttribute("Paciente");
    Edad=(String)request.getAttribute("Edad");
    System.out.println(IdMedico+" "+Paciente+" "+Edad);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Certificado.css">
        <script type="text/javascript" src="js/Validacion.js"></script>
        <script>
            function multiplicar(){
		  peso = document.getElementById("multiplicando").value;
		  altura = document.getElementById("multiplicador").value;
                  estatura=altura/100;
		  r = (peso/Math.pow(estatura,2)).toFixed(2);
		  document.getElementById("resultado").value = r;
          
                if(r<18.5){
                      document.getElementById("Res").value ="Bajo de peso";
                }else if(r<18.5||r<24.9){
                      document.getElementById("Res").value ="Normal de peso";
                }else if(r<=24.9||r<26.9){
                      document.getElementById("Res").value ="Sobre peso grado 1";
                }else if(r<=27||r<29.9){
                      document.getElementById("Res").value ="Sobre peso grado 2";
                }else if(r<=30||r<34.9){
                      document.getElementById("Res").value ="Obesidad tipo 1";
                }else if(r<=35||r<39.9){
                      document.getElementById("Res").value ="Obesidad tipo 2";
                }else if(r<=40||r<49.9){
                      document.getElementById("Res").value ="Obesidad tipo 3";
                }else{
                      document.getElementById("Res").value ="Obesidad tipo 4";
                }         
            }
        </script>
        <title>CESS</title>
    </head>
    <body>
        <div class="Marco">
            <div class="Imagen"><img width="150" height="150" src="img/LIS UV COLOR.jpg"></div>
        </div>
        <div class="Titulo">
            <h1>UNIVERSIDAD VERACRUZANA</h1>
            <h2>CENTRO DE ESTUDIOS Y SERVICIOS EN SALUD</h2>
            <h3>CARMEN SERDAN N° 147 CASI ESQ. MINA C.P 91700</h3>
            <h3>TEL: 932-49-78 VERACRUZ, VER</h3>
        </div>
         <div class="Marco2">
            <div class="Imagen"><img width="150" height="150" src="img/Logo.gif"></div>
         </div><br><br>
        <div class="Cuerpo"> 
        <h4 style="margin-left:65%">ASUNTO:CERTIFICADO MEDICO</h4><br>
        <h4>A QUIEN CORRESPONDA:</h4>
        <form method="post" action="" target="_blanck"> 
            <div class="encabezado"> <p1>Por medio de la presente, la que suscribe Dra.<%=Nombre%> médico adscrito al<br>
                    Centro de Estudios y Servicios en Salud, perteneciente a la Universidad Veracruzana.</p1></div>
        <h4 style="margin-left:40%">CERTIFICA</h4>
        <div class="Cuerpo2">
            <P1>Que el Paciente de <%=Edad%> años de edad, despues de haber realizado historia clínica y <br>
        examen médico detallado y minucioso, cuenta con los siguientes ANTECEDENTES PERSONALES:<br>
        Toxicomanías y empleo de algún tipo de droga o estupefaciente:<input type="text" name="Toxico" class="texto" required>. Enfermedades<br>
        cronicodegenerativas NEGADAS. Antecedentes quirúrgicos: NEGADOS, transfuciones: NEGADOS.<br>
        Alergias: Rinitis alergica. A la exploración física se encontró con los siguientes datos: Peso:<input type="text" value="0" id="multiplicando"  name="Peso" onkeyUp="return decimalPeso(this);" onChange="multiplicar();" required>Kg<br>
        Talla <input type="text" value="1" name="Talla" id="multiplicador" required onkeyUp="return decimalTalla(this);" onChange="multiplicar();">cm. Indice de Masa Corporal <input type="text" id="resultado" name="IMC" required> <input type="text" id="Res" name="Estado" class="texto" required>.<br>
        A la exploración física se encuentra paciente cooperador, consciente, orientado en sus tres esferas neurologicas,<br>
        buen estado de hidratación, con adecuada coloración de tegumentos, pares craneales integros, campos<br>
        pulmonares bien ventilados, sin datos de dificultad respiratoria, ruidos cardiacos ritmicos, sin ruidos agregados,<br>
        abdomen globoso a expensas de panículo adiposo, blando depresible, sin datos de irritación peritoneal,<br>
        peristalsis audible, sin megalias palpables, extremidades integras, fuerza y sensible concervadas, escala de <br>
        Daniels 5/5 Frecuencia Cardiaca:<input type="text" id="Temperatura" name="FC" onkeyUp="return decimalTalla(this);" required> latidos por minuto(NORMAL). FR <input id="Temperatura" type="text" name="FR" onkeyUp="return decimalTalla(this);" required> respiraciones por minuto. Agudeza<br>
        visual Normal <input type="text" name="Visual" class="texto" required> (bilateral), Conducto auditivo permeable, audición se encuentra conservada Rinné positivo<br>
        (normal) y Webber indiferente (normal), Por lo que se reporta:</P1></div>
        <h1 style="margin-left:25%">CLINICAMENTE ASINTOMÁTICO</h1>
        <p2>Para los fines que a este convenga, se expide el presente documento, el cual se invalidará, alos 15 días de la fecha de<bt>
        expedición. Se sugiere modificar habitos alimienticios y realizar actividad física regular para el control de peso.</p2>
        
        <h3 style="margin-left:40%">ATENTAMENTE</h3>
        <h4 style="margin-left:38%">Dr. <%=Nombre%></h4>
        <input type="text" name="IdMedico" value="<%=IdMedico%>" style="display: none;">
        <input type="text" name="Paciente" value="<%=Paciente%>" style="display: none;">
        <input type="text" name="Edad" value="<%=Edad%>" style="display: none;">
        <input type="submit" class="Boton1"  value="Imprimir" onclick="this.form.action='ImprimeCert',this.disabled=true">
        </form>
        </div>
    </body>
</html>
