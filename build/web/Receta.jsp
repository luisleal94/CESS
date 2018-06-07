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
        <script type="text/javascript" src="js/app.js"></script>
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
            
            .contiendeTa{
    position: relative;
    /*background: #ecfdf4;*/
    width: 50%;
    font-size:15px;
    margin-left:25%;
    margin-right: 30px; 
    border-radius: 5px;
    padding: 10px;
}

.contiendeTa input[type=text]{
               width: 70%;
            }
            
            #myTableData {
    font-family: sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#myTableData td, #myTableData th {
    border: 1px solid #ddd;
    padding: 8px;
}

#myTableData tr:nth-child(even){background-color: #f2f2f2;}

#myTableData tr:hover {background-color: #ddd;}

#myTableData th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
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
        <a id="link" href="inicio.jsp">Regresar</a>
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
        </div>
            <div class="medicamento">
                <div id="myform">
                    <div class="contiendeTa">
                        <table cellpadding="3" id="table">
                            <tr>
                                <td>Nombre del medicamento</td>
                                <td><input type="text" id="name"></td>
                            <tr>
                            <td>F.Farmaceutica</td>
                                <td><input size="4" type="text" id="formaf"></td>
                                 </tr>
                                    <td>Unidades</td>
                                    <td><input siparcetamolze="6" type="text" id="unidades"></td>
                            <tr>
                                                <td>Via.Admon</td>
                                                <td><input size="6" type="text" id="viaa"></td>
                                        </tr>
                                        <tr>
                                                <td>Presentación</td>
                                                <td><input type="text" id="presentacion"></td>
                                        </tr>
                                                <td>Pzas</td>
                                                <td><input size="4" type="text" id="pzas"></td>
                                    </tr>
                                    <tr>
                                        <td>dosis</td>
                                        <td><input type="text" id="dosis">
                                    </tr>
                                    <tr>
                                                <td>cada</td>
                                        <td><input size="4" type="text" id="cada">
                                                <td>Por</td>
                                                <td><input size="6" type="text" id="dias">
                                                <td>Días</td>
                                        </td>
                                    </tr>
                        </table>
                        </div>
                        <div class="boton">
                                <input type="button" id="add" class="input" value="Agregar +" onclick="Javascript:addRow()">
                        </div>	
                </div>   
            </div>
        <div id="mydata">
            <b>Medicamentos</b>
                    <div class="tabla2">
                            <table id="myTableData"  border="1" cellpadding="3">
                                <tr>
                                    <th>&nbsp;</th>
                                    <th><b>Nombre</b></th>
                                    <th><b>dosis</b></th>
                                            <th><b>f.farmaceutica</b></th>
                                            <th><b>unidades</b></th>
                                            <th><b>via.admon</b></th>
                                            <th><b>presentacion</b></th>
                                            <th><b>piezas</b></th>
                                            <th><b>cada</b></th>
                                            <th><b>dias</b></th>
                                </tr>
                            </table>
                    </div>
            &nbsp;<br/>
        </div>
        <div class="doctor">
                <label>Medico Tratante</label>
                <input type="text" name="medico" value="<% out.println(usuario);%>" disabled style="color:#063452">
        </div>  
    </body>
</html>
