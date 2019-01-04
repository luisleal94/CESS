<%-- 
    Document   : CertBlanco
    Created on : 28/10/2018, 12:19:43 PM
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
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
        <script type="text/javascript" src="js/Validacion.js"></script>
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
          <div class="areatexto">
               <textarea class="area" name="texto4" cols="150" rows="5" autofocus></textarea>
            </div>
        </div>
        <p2>Para los fines que a este convenga, se expide el presente documento, el cual se invalidará, alos 15 días de la fecha de<bt>
        expedición. Se sugiere modificar habitos alimienticios y realizar actividad física regular para el control de peso.</p2>
        <h3 style="margin-left:40%">ATENTAMENTE</h3>
        <h4 style="margin-left:38%">Dr. <%=Nombre%></h4>
        <input type="text" name="IdMedico" value="<%=IdMedico%>" style="display: none;">
        <input type="text" name="Paciente" value="<%=Paciente%>" style="display: none;">
        <input type="text" name="Edad" value="<%=Edad%>" style="display: none;">
        <input type="submit" class="Boton1"  value="Imprimir" onclick="this.form.action='ImprimeBlanco',this.disabled=true">
        </form>
        </div>
    </body>
</html>
