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
        <script type="text/javascript" src="js/Posoble2.js"></script>
        <script>
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
             
             .texto{
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
                position: relative;
                background: #ecfdf4;
                width: 100%;
                font-size:15px;
                margin-left:25%;
                margin-right: 30px; 
                border-radius: 5px;
                padding: 10px;
            }

            .tabla2{
                margin-right: 5%; 
                margin-left: 5%; 
            }

            .texto2{
                width: 85%;
                height: 10%;
                padding:5px;
                margin: 0px;
                display: inline-block;
                border: none;
                border-bottom: 2px solid ;
                border-color: rgba(0,0,255,0.3);
                background-color:white;
            }

            #myTableData {
                font-family: sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #myTableData td, #myTableData th {
                border: 1px solid #ddd;
                padding: 2px;
            }
            /*
            #myTableData tr:nth-child(even){background-color: #f2f2f2;}
            */
            #myTableData tr:hover{background-color: #ddd;}

            #myTableData th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
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
                height:30px;
                border-radius: 5px;
                font-size: 15px;
                margin-left:1%;
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
        String res=(String)request.getAttribute("band");
        System.out.println(res);
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        if(id==null){ %>
            <div id="buscar">
                <form action="" method="post">
                    <label id="label">Nombre</label>
                    <input type="text" class="texto"  name="nombre">&emsp;&emsp;
                    <label id="label">Apellido Paterno</label>                
                    <input id="Cajas" class="texto" type="text" name="apellidoP"><br>
                    <label id="label">Apellido Materno</label>                
                    <input id="Cajas" class="texto" type="text" name="apellidoM"><br>
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
                    <input type="text" class="texto" id="id" name="id" value="<%=rs.getString("idPacientes")%>" disabled style="color: #273746">                  
                    &emsp;&emsp;<label id="titulos">Nombre</label>
                    <input type="text" class="texto" name="nombre" value="<%=Nombre%>" disabled style="color: #273746" >
                    &emsp;&emsp;<label  id="titulos">Edad</label>
                    <input type="text" class="texto" id="cortos" name="edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746" ><br>                    
                    <label id="titulos">Genero</label>
                    <input type="text" class="texto" id="cortos" name="sexo" value="<%=rs.getString("Genero")%>" disabled style="color: #273746" >
                    &emsp;&emsp;<label id="titulos">Fecha</label>
                    <input type="text" class="texto" id="cortos" name="fecha" value="<%=fecha%>" disabled style="color: #273746" >
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
                    <input type="text" class="texto" id="id" name="id" value="<%=rs.getString("idPacientes")%>">                  
                    &emsp;&emsp;<label id="titulos">Nombre</label>
                    <input type="text" class="texto" name="nombre" value="<%=Nombre%>" disabled style="color: #273746" >
                    &emsp;&emsp;<label id="titulos">Edad</label>
                    <input type="text" class="texto" id="cortos" name="edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746" ><br>                    
                    <label id="titulos">Genero</label>
                    <input type="text" class="texto" id="cortos" name="sexo" value="<%=rs.getString("Genero")%>" disabled style="color: #273746" >
                    &emsp;&emsp;<label id="titulos">Fecha</label>
                    <input type="text" class="texto" id="cortos" name="fecha" value="<%=fecha%>" disabled style="color: #273746" >
                </form>
       <% } }//Busqueda por nombre del usuario a buscar %>
        <!--Mando el parametro ID del paciente que encontre-->            
    </div>        
            <div class="medicamento">
                <div class="boton">
                    <input type="button" id="add" class="input1" value="Agregar Medicamento" onclick="Javascript:addRow()">
                </div>
                <div id="myform">
                    <form method="post" action="" target="_blanck">
                        <input type="text" id="Bandera" name="Bandera" value="<%=res%>" style="display: none;">
                        <input type="text" name="Fecha" value="<%=fecha%>" style="display: none;">
                        <input type="text" name="ID" value="<%=IDPac%>" style="display: none;">
                        <input type="text" name="Doctor" value="<%=IdMedico%>" style="display: none;">
                        <div id="mydata">
                        <div class="tabla2">
                            <table id="myTableData"  border="1" cellpadding="3">
                                <tr>
                                    <th>&nbsp;</th>
                                    <th><b>Nombre</b></th>
                                    <th><b>F.farmaceutica</b></th>
                                    <th><b>Unidades</b></th>                                       
                                    <th><b>Via</b></th>
                                    <th><b>Presentacion</b></th>
                                    <th><b>Pzas</b></th>
                                    <th><b>Dosis</b></th> 
                                    <th><b>cada</b></th>
                                    <th><b>dias</b></th>
                                </tr>
                            </table>
                        </div>
                        &nbsp;<br/>
                        </div>
                        <div class="boton">
                            <input type="text" id="Valor" name="Valor" style="display: none;">
                            <input type="submit" class="input1"  value="Imprimir" onclick=this.form.action="GuardaReceta2"><!--onclick="javascript:cambia_de_pagina();"-->
                        </div>   
                        <section class="boton" id="bandera" style="display: none;">
                            <input type="submit" class="input1"  value="Imprimir ordern de analisis clínicos" onclick=this.form.action="Laboratorio.jsp">
                        </section>   
                    </form>                   
                </div>
            </div>
        <div class="doctor">
                <label>Medico Tratante</label>
                <input type="text" class="texto" name="medico" id="Medic" value="<% out.println(NOMBRE);%>" disabled style="color:#063452">
                <label>Cédula</label>
                <input type="text" class="texto" name="cedula" value="<% out.println(cedula);%>" disabled style="color:#063452">
        </div>  
    </body>
    <script>
        //alert(document.getElementById("Bandera").value);
        if(document.getElementById("Bandera").value=="Si"){
            //alert("Entro");
            document.getElementById("bandera").style.display="block";
        }else{
            //alert("Entro2");
            document.getElementById("bandera").style.display="none";
        }
        var x = document.getElementById("id").value;
        document.getElementById("IdPaciente").value=x;
        var a="Si";      
    </script>
</html>
