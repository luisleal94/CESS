<%-- 
    Document   : VerConsulta
    Created on : 27/06/2018, 10:21:56 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controlador.Conexion"%>
<%
    //Obtengo atributo
    HttpSession sesion=request.getSession(false); //Sesion    
    String usuario=(String)sesion.getAttribute("Usuario");
    String gerarquia="";
    String cedula="";
    String IdUser="";
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }else{
        gerarquia=(String)sesion.getAttribute("Gerarquia");
        cedula=(String)sesion.getAttribute("Cedula");
        IdUser=(String)sesion.getAttribute("IDUSER");
        System.out.println("Geraquia:"+gerarquia+" Usuario:"+IdUser);
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
               background:white;               
               font-family: 'Roboto', sans-serif;               
            }
            .contenedor{               
                margin-left:20%;
                margin-right:20%;
                background: #f7f7f7;
                border-radius:10px; 
                padding-left:15px;
                padding-top: 5px;
            }
            input[type=text]{
                width: 20%;
                height: 10%;
                padding: 10px 18px;
                margin: 0px 0;
                display: inline-block;
                border: none;               
                background:none;
                color: #294c4f;
                /*text-align: center;*/
                text-decoration: underline;
            }
            .titulo{
                font-family: roboto;
                text-align: center;
                padding: 5px;
                color:  #212f3d ;
            }
            label{  
                font-family: roboto; 
                margin-top: 0px;
                margin: 5px;
                padding: 5px;                
            }
            .area{
                margin: 0px;
                max-width:60%;
                max-height: 60px;
                resize: none;
                font-family: 'roboto';
                color:#294c4f;
                text-align: left;                
                border: black;
                background:none;
            }
            .textarea{                
                margin-top: 0px; 
                padding: 5px;
                text-align: left;
                font-weight: 400;
                color:#294c4f;
                font-size: 18px;
                text-align: left;               
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
            #diagnostico{
                width: 50%;
                border: none;
                padding: 10px;      
            }
            
            
            #contiene_tabla{
                margin-left: 5%;
                position: relative;
                margin-right: 5%;
                margin-bottom: 30px;    
            }
            #tabla{
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
                margin-top: 2%;
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
            .input1{              
               height:35px; 
               border: none;
               background: #418994;
               color: white;
               font-family: roboto;
               font-weight: 400;
               font-size: 20px;
               border-radius: 5px;
               cursor:pointer;
            }
        </style>
    </head>
    <body>
       
        <div class="titulo"><h1>Notas Médicas</h1></div>
        <div class="contenedor" >
            <% //Busqueda por ID del usuario a buscar
                        String Doc=request.getAttribute("IdMedico").toString();
                        System.out.println(Doc);
                        String id=request.getAttribute("id").toString();//El que obtengo del serlevt     
                        String fecha=request.getAttribute("Fecha").toString();//El que obtengo del serlevt     
                        System.out.println("Id obtenido:"+id);                   
                        Conexion con= new Conexion();
                        PreparedStatement pst;
                        ResultSet rs;     
                        pst = con.getConexion().prepareStatement("Select * from ExploracionF where IdPaciente='"+id+"' and"
                                + " Fecha='"+fecha+"'");
                        rs=pst.executeQuery();
                        while(rs.next()){  %>
                        <div class="titulo"><h2>Signos Vitales</h2></div>                       
                        <label>Peso</label>
                        <input type="text" value="<%=rs.getString("Peso")%>">
                        <label>Estatura</label>
                        <input type="text" value="<%=rs.getString("Talla")%>" >
                        <br><label>IMC</label>
                        <input type="text" value="<%=rs.getString("IMC")%>">
                        <br><label>Frecuencia Cardiaca</label>
                        <input type="text"  value="<%=rs.getString("FrecuenciaC")%>">
                        <label>Frecuencia Respiratoria</label>
                        <input type="text"  value="<%=rs.getString("FrecuenciaR")%>">
                        <label>Temperatura</label>
                        <input type="text"  value="<%=rs.getString("Temperatura")%>"> 
                        <label>Presion Arterial</label>
                        <input type="text" value="<%=rs.getString("PresionArterial")%>">
                        
                        
                      <% }                                       
                          pst = con.getConexion().prepareStatement("Select * from Consulta where IdPaciente='"+id+"' and"
                                + " Fecha='"+fecha+"'");
                        rs=pst.executeQuery();
                        while(rs.next()){
            %>
            <div class="titulo"><h2>Consulta</h2></div> 
            <input type="text" id="exploracion" value="<%=rs.getString("ExploracionF")%>" style="display: none">
            <input type="text" id="padecimiento" value="<%=rs.getString("Padecimiento")%>" style="display: none">
            <label>Diagnóstico</label>
            <input type="text" id="diagnostico" value="<%=rs.getString("Diagnostico")%>" disabled>
            <input type="text" id="estudios" value="<%=rs.getString("Estudios")%>" style="display: none">
            <input type="text" id="Laboratorio" value="<%=rs.getString("Laboratorio")%>" style="display: none">
            <input type="text" id="Gabinete" value="<%=rs.getString("Gabinete")%>" style="display: none">
            <input type="text" id="Tratamiento" value="<%=rs.getString("Tratamiento")%>" style="display: none">
            <% } %>            
            <br><label>Exploración Física</label>
            <div class="textarea">
                <textarea class="area" id="area1" cols="150" rows="5" disabled></textarea>
            </div>
            <br><label>Padecimiento Actual</label>
            <div class="textarea">
                <textarea class="area" id="area2" cols="150" rows="5" disabled></textarea>
            </div>
            <br><label>Estudios</label>
            <input type="text" id="estudio" disabled>
            <br><label>Laboratorio</label>
            <div class="textarea">
                <textarea class="area" id="area3" cols="150" rows="5" disabled></textarea>
            </div>
            <br><label>Gabinete</label>
            <div class="textarea">
                <textarea class="area" id="area4" cols="150" rows="5" disabled></textarea>
            </div>
            <br><label>Tratamiento</label>
            <div class="textarea">
                <textarea class="area" id="area5" cols="150" rows="5" disabled></textarea>
            </div>
        </div>
            <div class="contenedor">
                <label>Se refirio a:</label><br>
                
                <%
                    pst = con.getConexion().prepareStatement("select *from Referencia where IdPaciente='"+id+"' and Fecha='"+fecha+"' and IdMedico='"+Doc+"'");
                    rs=pst.executeQuery();
                    while(rs.next()){ %>
                    <label>Pediatría</label>
                    <%if(rs.getString("Pediatra")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %>
                    
                    <label>Ginecología</label>
                    <%if(rs.getString("Ginecologia")==null){ %>
                        <input type="text" value="No">
                        <% }else{%><input type="text" value="Si"><%} %><br>                
                    
                    <label>Gastroenterología</label>
                    <%if(rs.getString("Gastro")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %>   
                    
                    <label>Neurología</label>
                    <%if(rs.getString("Neurolo")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %> <br>   
                    
                    <label>Tramatología</label>
                    <%if(rs.getString("Trauma")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %> 
                    
                    <label>Endocrinología</label>
                    <%if(rs.getString("Endocri")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %> <br>   
                    
                    <label>Geriatría</label>
                    <%if(rs.getString("Geriatria")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %> 
                    
                    <label>Urología</label>
                    <%if(rs.getString("Urolo")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %><br>   
                    
                    <label>Otorrinología</label>
                    <%if(rs.getString("Otorri")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %>
                    
                    <label>Genética</label>
                    <%if(rs.getString("Genetica")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %><br>   
                    
                    <label>Psiquiatría</label>
                    <%if(rs.getString("Psiqui")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %>
                    
                    <label>Cardiología</label>
                    <%if(rs.getString("Cardio")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %><br>
                    
                    <label>Oftalmología</label>
                    <%if(rs.getString("Olfta")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %>
                    
                    <label>Neumología</label>
                    <%if(rs.getString("Neomo")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %><br>
                    
                    <label>Nefrología</label>
                    <%if(rs.getString("Nefro")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %>
                    
                    <label>Hematología</label>
                    <%if(rs.getString("Hemato")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %><br>
                    <label>Vascular periférico</label>
                    <%if(rs.getString("Vascular")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %>
                    <label>Inmuno-alergia</label>
                    <%if(rs.getString("Inmuno")==null){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="Si"><%} %>
                    <%   }  %>
            </div>
            <div class="titulo"><h1>Medicamento Recetado</h1></div>
        <div id="contiene_tabla">
            <table id="tabla">
            <tr>
                <th>Medicamento</th>
                <th>F.farmaceutica</th>
                <th>unidades</th>
                <th>Via.Admin</th>
                <th>Presentación</th>
                <th>Piezas</th>
                <th>Cada</th>
                <th>Días</th>
            </tr>
             <% 
                 pst = con.getConexion().prepareStatement("select *from Receta where IdMedico='"+Doc+"'  and Fecha='"+fecha+"' "
                         + "and IdPaciente='"+id+"'");
                rs=pst.executeQuery();
                while(rs.next()){  %>
            <tr>
                <td><%=rs.getString("Medicamento")%></td>
                <td><%=rs.getString("Farmacia")%></td>
                <td><%=rs.getString("Unidades")%></td>
                <td><%=rs.getString("Presentacion")%></td>
                <td><%=rs.getString("Piezas")%></td>
                <td><%=rs.getString("Dosis")%></td>                
                <td><%=rs.getString("Cada")%></td>
                <td><%=rs.getString("Dias")%></td>
            </tr>
            <% } %> 
        </table>
        <form method="post" action="newjsp.jsp" target="_black">
            <input type="text" name="Fecha" id="fecha" value="<%=fecha%>" style="display: none">
            <input type="text" name="ID" value="<%=id%>"  style="display: none">
                <input type="text" name="Doctor" id="Doc" value="<%=Doc%>" style="display: none">
                <input type="submit" class="input1" value="Imprimir Receta">
        </form>
        </div>
    </body>
    <script>
        var a = document.getElementById("exploracion").value;
        document.getElementById("area1").value=a;
        var b = document.getElementById("padecimiento").value;
        document.getElementById("area2").value=b;
        var c = document.getElementById("estudios").value;
        document.getElementById("estudio").value=c;
        
        var d = document.getElementById("Laboratorio").value;
        document.getElementById("area3").value=d;       
        
        var e = document.getElementById("Gabinete").value;
        document.getElementById("area4").value=e;
        
        var f = document.getElementById("Tratamiento").value;
        document.getElementById("area5").value=f;
    </script>
</html>
