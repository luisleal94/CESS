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
        <link rel="stylesheet" href="css/Receta.css">
        <script>
            function cambia_de_pagina(){
	        location.href="inicio.jsp";
	    }
        </script>
        <title>CESS</title>
    </head>
    <body onload="nobackbutton();">
        <div class="cabecera" >
            <h1>UNIVERSIDAD VERACRUZANA</h1>
            <h1>SECRETARIA DE ADMINISTRACIÓN Y FINANZAS</h1>
            <h1>SISTEMA DE ATENCIÓN INTEGRAL A LA SALUD (SAISUV)</h1>
            <h1>RECETA MÉDICA</h1>
        </div>
        <a id="link" href="inicio.jsp">Menú principal</a>
       
        <div class="receta">
        <% 
        Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=anio+"-"+mes+"-"+dia;
        String id=(String)request.getAttribute("id");//El que obtengo del serlevt 
        String res=(String)request.getAttribute("band1");
        String res2=(String)request.getAttribute("band2");
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
                    <input type="button" id="add" class="input1" value="Agregar Medicamento" onclick="addRow()">
                </div>
                <div id="myform">
                    <form method="post" action="" target="_blanck">
                        <input type="text" id="Bandera" name="Bandera" value="<%=res%>"  style="display: none;">
                        <input type="text" id="Bandera2" name="Bandera2" value="<%=res2%>"  style="display: none;">
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
                            <input type="submit" class="input1"  value="Imprimir" onclick="this.form.action='GuardaReceta2',this.disabled=true"><!--onclick="javascript:cambia_de_pagina();"-->
                        </div>   
                        <section class="boton" id="bandera" style="display: none;">
                            <input type="submit" class="input1"  value="Imprimir ordern de análisis de laboratorio" onclick=this.form.action="Laboratorio.jsp">
                        </section>  
                        <section class="boton" id="bandera2" style="display: none;">
                            <input type="submit" class="input1"  value="Imprimir ordern de análisis de gabinete" onclick=this.form.action="Gabinete.jsp">
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
        if(document.getElementById("Bandera2").value=="Si"){
            document.getElementById("bandera2").style.display="block";
        }else{
            document.getElementById("bandera2").style.display="none";
        }
        var x = document.getElementById("id").value;
        document.getElementById("IdPaciente").value=x;
        var a="Si";      
    </script>
</html>
