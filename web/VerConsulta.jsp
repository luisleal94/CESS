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
        <link rel="stylesheet" href="css/Notas.css">
        <title>CESS</title>
        
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
                                + " Fecha='"+fecha+"' and IdMedico='"+Doc+"'");
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
                            <input type="text"  value="<%=rs.getString("Temperatura")%>"><br>
                            <label>Presion Arterial</label>
                            <input type="text" id="Corto" value="<%=rs.getString("Diastolica")%>">/
                            <input type="text" id="Corto" value="<%=rs.getString("Asistolica")%>">
                      <% }                                       
                          pst = con.getConexion().prepareStatement("Select * from Consulta where IdPaciente='"+id+"' and"
                                + " Fecha='"+fecha+"' and IdMedico='"+Doc+"'");
                        rs=pst.executeQuery();
                        while(rs.next()){
            %>
            <input type="text" id="exploracion" value="<%=rs.getString("ExploracionF")%>" style="display: none">
            <input type="text" id="padecimiento" value="<%=rs.getString("Padecimiento")%>" style="display: none">
            <input type="text" id="diagnostico" value="<%=rs.getString("Diagnostico")%>" style="display: none">
            <input type="text" id="estudios" value="<%=rs.getString("Estudios")%>" style="display: none">
            <input type="text" id="Laboratorio" value="<%=rs.getString("Laboratorio")%>" style="display: none">
            <input type="text" id="Gabinete" value="<%=rs.getString("Gabinete")%>" style="display: none">
            <input type="text" id="Tratamiento" value="<%=rs.getString("Tratamiento")%>" style="display: none">
            <% } %>   
            <div class="titulo"><h2>Consulta</h2></div> 
            <br><label>Padecimiento Actual</label>
            <div class="textarea">
                <textarea class="area" id="area2" cols="150" rows="5" disabled></textarea>
            </div>
            <br><label>Exploración Física</label>
            <div class="textarea">
                <textarea class="area" id="area1" cols="150" rows="5" disabled></textarea>
            </div>
            <br><label>Diagnóstico</label>
            <div class="textarea">
                <textarea class="area" id="area6" cols="150" rows="5" disabled></textarea>
            </div>
            <br><label>Estudios</label>
            <input type="text" id="estudio" disabled>
            <section id="seccion1" style="display: none;">
                <br><label>Laboratorio</label>
                <div class="textarea">
                    <textarea class="area" id="area3" cols="150" rows="5" disabled></textarea>
                </div>
                <br><label>Gabinete</label>
                <div class="textarea">
                    <textarea class="area" id="area4" cols="150" rows="5" disabled></textarea>
                </div>
            </section>
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
                        <% }else{%><input type="text" value="Si"><%} %><br>
                    <label>Otro</label>
                    <%if(rs.getString("Otra").equals("No")){ %>
                        <input type="text" value="No">
                    <% }else{%><input type="text" value="<%=rs.getString("Otra")%>">
                    <% } }%>
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
        
        var g=document.getElementById("diagnostico").value;
        document.getElementById("area6").value=g;
        var res="Si";
        if(c==res){
            document.getElementById("seccion1").style.display="block";
        }
    </script>
</html>
