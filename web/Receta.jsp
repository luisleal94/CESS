<%-- 
    Document   : Receta
    Created on : 30/05/2018, 10:51:49 PM
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
        <title>CESS</title>
        <style>
            head,body{
               background-image: url(img/uu.png);
               font-family: 'Roboto', sans-serif;
            }
             .cabecera{
                font-size:7px; 
                text-align: center;
             }
             .receta{
                /*background: #f2f4f5;*/
                padding: 10px;
                border-radius: 5px;
             }
             
             .medicamento{
                margin: 10px;
                
             }
             
             input[type=text]{
                width: 14%;
                height: 10%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: none;
                border-bottom: 2px solid ;
                border-color: rgba(0,0,255,0.3);
                /*background-color: #fbfbfb ;*/
            }
            
            .area{
                max-width: 95%;
                resize: none;
                font-family: 'roboto';
            }
        </style>
    </head>
    <body>
        <div class="cabecera" >
            <h1>UNIVERSIDAD VERACRUZANA</h1>
            <h1>SECRETARIA DE ADMINISTRACIÓN Y FINANZAS</h1>
            <h1>SISTEMA DE ATENCIÓN INTEGRAL A LA SALUD (SAISUV)</h1>
            <h1>RECETA MÉDICA</h1>
        </div>
        <div  class="receta">
            <label>No. De Personal</label>
            <input type="text">
            <label>Nombre del Paciente</label>
            <input type="text">
            <label>Tipo de Personal</label>
            <input type="text"><br>
            <label>Dependencia</label>
            <input type="text">
            <label>Dependencia Comisión</label>
            <input type="text">
            <label>Cve. Única Dep.</label>
            <input type="text"><br>
            <label>Nombre del Dependiente Económico</label>
            <input type="text">
            <div class="medicamento">
                <label>Plan de Tratamiento</label><br>
                <textarea class="area" cols="50" rows="5" autofocus></textarea><br>
                <label>Controlado</label>
                <input type="text"><br>            
                <label>Nombre del Medicamento</label>
                <input type="text">
                <label>F. Farmaceutica</label>
                <input type="text">
                <label>Unidades</label>
                <input type="text"><br>
                <label>Vía Admon.</label>
                <input type="text">
                <label>Presentación</label>
                <input type="text">
                <label>Pzas.</label>
                <input type="text">
                <label>Dosis</label>
                <input type="text">                
            </div>
        </div>
        <div class="doctor">
                <label>Medico Tratante</label>
                <input type="text" name="medico" value="<% out.println(usuario);%>" disabled style="color:#063452">
        </div>  
    </body>
</html>
