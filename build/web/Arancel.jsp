<%-- 
    Document   : Arancel
    Created on : 24/06/2018, 03:39:56 PM
    Author     : luis
--%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-2.1.3.js"></script>
	<script type="text/javascript" src="js/jspdf.js"></script>
	<script type="text/javascript" src="js/pdfFromHTML.js"></script>
        <title>CESS</title>
        <style>
            .cabecera{
                background: orange;
                text-align: center;
                font-family: sans-serif;
            }
            .Contenedor{
                margin-left: 8px;
                font-family: sans-serif;
                padding: 15px;
                
            }
            input[type=text] {
                width: 20%;
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
            label{
                font-weight: 700;
            }
            .izquerda{
                margin-left: 5px;
                position: absolute;
            }
            .derecha{
                margin-left:70%;
                margin-top: 0px;
                position: absolute;
                
            }
            .cuerpo{
                margin-top: 5%;
                margin-left: 5px;
                margin-bottom: 5px;
                position: relative;
                padding: 15px;
            }
            .pie{
                margin-left:5px;
                
                position: absolute;
            }
            .pie2{
                margin-left:70%;                
                position: absolute;
                
            }
        </style>
    </head>
    <body>
        <!--
        <div id="HTMLtoPDF">            
            <header class="cabecera">
                <h1>Centro de Estudios y Servicios de Salud</h1>
            </header>
            <div class="Contenedor">
                <div class="izquerda">
                    <label>Folio</label>
                    <input type="text">            
                </div>
                <div class="derecha">
                    <label>Fecha</label>
                    <input type="text"> 
                </div>         

                <div class="cuerpo">
                    <label>Tipo de personal</label>
                    <input type="text">
                    <label>Paciente</label>
                    <input type="text">
                </div>

                <div class="pie">
                    <label>Médico Tratante</label>
                    <input type="text" value="hola">                
                </div>                 
                <div class="pie2" >
                    <label>Costo</label>
                    <input type="text">
                </div>
            </div>
        </div>
        <div style="margin-top: 15%">
            <a href="#" onclick="HTMLtoPDF()">Descargar</a>
        </div>-->
        <%
            Conexion con= new Conexion();
            File archivo=new File(application.getRealPath("reporte.jasper"));
            Map parametro= new HashMap();
            parametro.put("Valor1","Valor2");
            byte[] bytes=JasperRunManager.runReportToPdf(archivo.getPath(),parametro,con.getConexion());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length); 
            ServletOutputStream outputstream =response.getOutputStream();
            outputstream.write(bytes,0,bytes.length);
            outputstream.flush();
            outputstream.close();
        %>
    
    </body>
</html>
