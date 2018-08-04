<%-- 
    Document   : Receta
    Created on : 30/05/2018, 10:51:49 PM
    Author     : luis
--%>

<%@page import="java.util.Calendar"%>
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
    String IdMedic="";
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    cedula=(String)sesion.getAttribute("Cedula");
    NOMBRE=(String)sesion.getAttribute("Nombre");
    String IdMedico=(String)sesion.getAttribute("IDUSER");
    String IDPac="";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet"> 
        <script type="text/javascript" src="js/NoBack.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="js/app.js"></script>
        <script>
            $(document).ready( function() {   // Esta parte del código se ejecutará automáticamente cuando la página esté lista.
                $("#add").click( function() {     // Con esto establecemos la acción por defecto de nuestro botón de enviar.
                    $.post("enviar",$("#miForm").serialize());   // Primero validará el formulario.                    
                });    
            });
            function cambia_de_pagina(){
	        location.href="inicio.jsp";
	    }
        </script>
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
                margin-left:2%;
                margin-right: 2%;
                background: #f2f4f5;
                padding: 5px;
                border-radius: 5px;
                padding-left: 3%;
             }
             
             .medicamento{
                margin: 10px;                
             }
             
             input[type=text]{
                width: 20%;
                height: 10%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: none;
                border-bottom: 2px solid ;
                border-color: rgba(0,0,255,0.3);
                background:none;
            }
            
            .area{
                max-width: 95%;
                resize: none;
                font-family: 'roboto';
            }
            
            #link{
                margin-bottom: 5px;
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
                width: 90%;
                font-size:15px;
                margin-left:2%;
                border-radius: 5px;
                
                padding-left:25px; 
            }

            .contiendeTa input[type=text]{
               width: 15%;
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
                background-color: #a9cce3;
                color: #1a5276;
            }
            .boton{               
                margin-left: 35%;
                margin-top: 15px;
                margin-bottom:20px; 
            }
            .input1{              
               height:35px; 
               border: none;
               background: #418994;
               color: white;
               font-family: roboto;
               font-weight: 400;
               font-size: 20px;
               border-radius: 5px;
            }
            .input2{              
               height:35px; 
               border: none;
               background:  #fd551f;
               color: white;
               font-family: roboto;
               font-weight: 400;
               font-size: 20px;
               border-radius: 5px;
            }
            
            .input1:hover{ background: #2b5960;}    
            .input2:hover{ background:  #d52e20;} 
            .boton2{
                background:  #d02523 ;
                color: white;
                border: none;
                width:30px;
                height: 30px;
                border-radius: 5px;
                font-size: 15px;
                margin-left:28%;
            }
            .boton2:hover{background: #f13304;}
            .imprimir{
                margin-left: 42%;
                 margin-bottom: 20px;
            }
            .doctor{
                background:rgba( 62, 141, 193 ,0.5);
                margin-left:5px; 
                margin-right: 20px;
                padding:5px;     
            }
            #cortos{
                text-align: center;
                width: 10%;
                height: 10%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: none;
                border-bottom: 2px solid ;
                border-color: rgba(0,0,255,0.3);
                background:none;
            }
            #buscar{               
                margin-left: 2%;
            }
        </style>
    </head>
    <body onload="nobackbutton();">
        <div class="cabecera" >
            <h1>UNIVERSIDAD VERACRUZANA</h1>
            <h1>SECRETARIA DE ADMINISTRACIÓN Y FINANZAS</h1>
            <h1>SISTEMA DE ATENCIÓN INTEGRAL A LA SALUD (SAISUV)</h1>
            <h1>RECETA MÉDICA</h1>
        </div>
        <a id="link" href="inicio.jsp">Regresar</a>
       
        <div class="receta">
        <% 
        Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=anio+"-"+mes+"-"+dia;
        String id=(String)request.getAttribute("id");//El que obtengo del serlevt 
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        if(id==null){ %>
            <div id="buscar">
                <form action="" method="post">
                    <label id="label">Nombre</label>
                    <input type="text" name="nombre">&emsp;&emsp;
                    <label id="label">Apellido Paterno</label>                
                    <input id="Cajas"type="text" name="apellidoP"><br>
                    <label id="label">Apellido Materno</label>                
                    <input id="Cajas" type="text" name="apellidoM"><br>
                    <input class="input1" type="submit" value="Buscar" style="border:none"> 
                </form>
            </div>
        
            <%String nombre=request.getParameter("nombre");
            String apellidoP=request.getParameter("apellidoP");
            String apellidoM=request.getParameter("apellidoM");
            pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"' and Apellido_P='"+apellidoP+"' and Apellido_M='"+apellidoM+"'");
            //pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                String Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");
                IDPac=rs.getString("idPacientes");
                %> 
                <form action="" method="post">
                    <label id="titulos">ID</label>
                    <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>" disabled style="color: #273746">                  
                    &emsp;&emsp;<label id="titulos">Nombre</label>
                    <input type="text" name="nombre" value="<%=Nombre%>" disabled style="color: #273746" >
                    &emsp;&emsp;<label id="titulos">Edad</label>
                    <input type="text"  id="cortos" name="edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746" ><br>                    
                    <label id="titulos">Genero</label>
                    <input type="text" id="cortos" name="sexo" value="<%=rs.getString("Genero")%>" disabled style="color: #273746" >
                    &emsp;&emsp;<label id="titulos">Fecha</label>
                    <input type="text" id="cortos" name="fecha" value="<%=fecha%>" disabled style="color: #273746" >
                </form>
             
            <% }                        
        }else{
            pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes='"+id+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                String Nombre=rs.getString("Nombre")+" "+rs.getString("Apellido_P")+" "+rs.getString("Apellido_M");     
                IDPac=rs.getString("idPacientes");
            %>
            <div class="h2"><h2>Paciente</h2> </div>
                <form action="" method="post">
                    <label id="titulos">ID</label>
                    <input type="text" id="id" name="id" value="<%=rs.getString("idPacientes")%>">                  
                    &emsp;&emsp;<label id="titulos">Nombre</label>
                    <input type="text" name="nombre" value="<%=Nombre%>" disabled style="color: #273746" >
                    &emsp;&emsp;<label id="titulos">Edad</label>
                    <input type="text"  id="cortos" name="edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746" ><br>                    
                    <label id="titulos">Genero</label>
                    <input type="text" id="cortos" name="sexo" value="<%=rs.getString("Genero")%>" disabled style="color: #273746" >
                    &emsp;&emsp;<label id="titulos">Fecha</label>
                    <input type="text" id="cortos" name="fecha" value="<%=fecha%>" disabled style="color: #273746" >
                </form>
       <% } }//Busqueda por nombre del usuario a buscar %>
        <!--Mando el parametro ID del paciente que encontre-->            
    </div>        
            <div class="medicamento">
                <div id="myform">
                    <form id="miForm" method="post">
                    <div class="contiendeTa">                        
                        <table cellpadding="3" id="table">
                            <input type="text" name="id" value="<%=IDPac%>" style="display: none;">
                            <input type="text" name="Doc" value="<%=IdMedico%>" style="display: none;">
                            <label>Nombre del medicamento</label>
                            <input type="text" id="name" name="nombre">
                            &emsp;&emsp;<label>F.Farmaceutica</label>
                            <input size="4" type="text" id="formaf" name="farmacia">
                            &emsp;&emsp;<label>Unidades</label>
                            <input siparcetamolze="6" type="text" id="unidades" name="unidades"><br>
                            <label>Via.Admon</label>
                            <input size="6" type="text" id="viaa" name="administracion">
                            &emsp;<label>Presentación</label>
                            <input type="text" id="presentacion" name="presentacion">
                            &emsp;<label>Pzas</label>
                            <input size="4" type="text" id="pzas" name="piezas"><br>
                            <label>Dosis</label>
                            <input type="text" id="dosis" name="dosis">
                            <label>Cada</label>
                            <input size="4" type="text" id="cada" name="cada">
                            &emsp;<label>Por</label>
                            <input size="6" type="text" id="dias" name="dias">
                            &emsp;<label>Días</label>  
                        </table>                            
                        </div>
                        <div class="boton">
                            <input type="button" id="add" class="input1" value="Agregar +" onclick="Javascript:addRow()">
                                <input type="button" class="input2" onclick="limpiarFormulario()" value="Limpiar formulario">
                        </div>
                    </form>
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
        <div class="imprimir">
            <form method="post" action="newjsp.jsp" target="_black">
                <input type="text" name="Fecha" id="fecha" value="<%=fecha%>" style="display: none">
                <input type="text" name="ID" id="IdPaciente" style="display: none">
                <input type="text" name="Doctor" id="Doc" value="<%=IdMedico%>" style="display: none">
                <input type="submit" class="input1" value="Imprimir Receta" onclick="javascript:cambia_de_pagina();">
            </form>
        </div>
        <div class="doctor">
                <label>Medico Tratante</label>
                <input type="text" name="medico" id="Medic" value="<% out.println(NOMBRE);%>" disabled style="color:#063452">
                <label>Cédula</label>
                <input type="text" name="cedula" value="<% out.println(cedula);%>" disabled style="color:#063452">
        </div>  
    </body>
    <script>
        var x = document.getElementById("id").value;
        document.getElementById("IdPaciente").value=x;
	//alert(x);      
      
    </script>
</html>
