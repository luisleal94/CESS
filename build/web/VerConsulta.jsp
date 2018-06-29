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
                text-align: center;
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

        </style>
    </head>
    <body>
        <a id="link" href="historial.jsp">Regresar</a>
        <div class="titulo"><h1>Notas Médicas</h1></div>
        <div class="contenedor" >
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
