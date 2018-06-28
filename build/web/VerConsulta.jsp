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
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }else{
        gerarquia=(String)sesion.getAttribute("Gerarquia");
        cedula=(String)sesion.getAttribute("Cedula");
        System.out.println("Geraquia:"+gerarquia);
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
               background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>
    <body>
        <div><h1>Notas Médicas</h1></div>
        <% //Busqueda por ID del usuario a buscar
                    String id=request.getAttribute("id").toString();//El que obtengo del serlevt                   
                    System.out.println("Id obtenido:"+id);                   
                    Conexion con= new Conexion();
                    PreparedStatement pst;
                    ResultSet rs;        
                    pst = con.getConexion().prepareStatement("Select * from Consulta where IdPaciente='"+id+"'");
                    rs=pst.executeQuery();
                    while(rs.next()){
        %>
        <input type="text" id="exploracion" value="<%=rs.getString("ExploracionF")%>" style="display: none">
        <input type="text" id="padecimiento" value="<%=rs.getString("Padecimiento")%>" style="display: none">
        <label>Diagnóstico</label>
        <input type="text" id="diagnostico" value="<%=rs.getString("Diagnostico")%>" disabled>
        <input type="text" id="estudios" value="<%=rs.getString("Estudios")%>" style="display: none">
        <input type="text" id="Laboratorio" value="<%=rs.getString("Laboratorio")%>" style="display: none">
        <input type="text" id="Gabinete" value="<%=rs.getString("Gabinete")%>" style="display: none">
        <input type="text" id="Tratamiento" value="<%=rs.getString("Tratamiento")%>" style="display: none">
        <% } %>
        <label>Exploración Física</label>
        <div class="textarea">
            <textarea class="area" id="area1" cols="150" rows="5" disabled></textarea>
        </div>
        <label>Padecimiento Actual</label>
        <div class="textarea">
            <textarea class="area" id="area2" cols="150" rows="5" disabled></textarea>
        </div>
        <label>Estudios</label>
        <input type="text" id="estudio" disabled>
        <label>Laboratorio</label>
        <div class="textarea">
            <textarea class="area" id="area3" cols="150" rows="5" disabled></textarea>
        </div>
        <label>Gabinete</label>
        <div class="textarea">
            <textarea class="area" id="area4" cols="150" rows="5" disabled></textarea>
        </div>
        <label>Tratamiento</label>
        <div class="textarea">
            <textarea class="area" id="area5" cols="150" rows="5" disabled></textarea>
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
