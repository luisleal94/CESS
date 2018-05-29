<%-- 
    Document   : pruebas
    Created on : 6/04/2018, 11:25:20 PM
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
        <title>JSP Page</title>
        <style>
input[type=text] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100px;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #145a32 ;
    transition: 0.4s;
}

#datos {
    margin-top: 30px;
    margin-bottom: 30px;
    margin-right: 150px;
    margin-left: 100px;
    border-radius: 5px;
    padding: 20px;
    text-align: center;
    background: #e1edfa ;
}

#buscar{
    background: #e1edfa ;
    margin-top: 10px;
    margin-bottom: 30px;
    margin-right: 150px;
    margin-left: 100px;
    border-radius: 5px;
    text-align: left;
}

#label{
    padding: 5px;
}

#boton1{
    background: #154360 ;
    padding: 10px;
    border-radius: 5px;
    display: inline-block;
}

#boton0{
    background: #ec7063;
    margin:10px;
    padding: 10px;
    display: inline-block;
    border-radius: 5px;
    color: white;
}

#boton0:hover{
    background: #ec7063;
    margin:10px;
    padding: 10px;
    display: inline-block;
    border-radius: 5px;
    color: white;
    transition: 0.3s;
}

a{
    text-decoration: none;
    color:  white;
}

#boton1:hover{
    background: #2e86c1;
    transition:0.3s;
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
        <style>
            head,body{
               background-image: url(img/jj.png);
               font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>
    <body>
        <a id="link" href="inicio.jsp">Regresar</a>
        <div id="buscar">
            <form action="" method="post">
                <label id="label">Nombre</label>
                <input type="text" name="nombre">
                <input type="submit" value="Bucar"> 
                <div id="boton0" ><a href="historial.jsp">Mostrar tabla</a></div>
            </form>
        </div>
        <!--<form action="" method="post">
            <a href="historial.jsp">Mostrar tabla de pacientes</a>
            <p>Nombre</p>
            <input name="nombre" type="text">
            <input type="submit" value="Bucar">            
        </form>-->
        <div id="datos">
      <% //Busqueda por nombre del usuario a buscar
          String nombre=request.getParameter("nombre");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        pst = con.getConexion().prepareStatement("Select * from Pacientes where Nombre='"+nombre+"'");
        rs=pst.executeQuery();
       
        while(rs.next()){
    %>
         <h2>Datos del paciente</h2>
         
            <label id="titulos">Nombre</label>
            <input type="text" name="nombre" value="<%=rs.getString("Nombre")%>" disabled style="color: #273746" ><br>
            <label id="titulos">Apellido Paterno</label>
            <input type="text" name="apellidoP" value="<%=rs.getString("Apellido_P")%>" disabled style="color: #273746"><br>
            <label id="titulos">Apellido Materno</label>
            <input type="text" name="apellidoM" value="<%=rs.getString("Apellido_M")%>" disabled style="color: #273746"><br>
            <label id="titulos">Edad</label>
            <input type="text" name="edad" value="<%=rs.getString("Edad")%>" disabled style="color: #273746"><br>
            <label id="titulos">Telefono</label>
            <input type="text" name="tele" value="<%=rs.getString("telefono")%>" disabled style="color: #273746"><br>       
            <div id="boton1" ><a href="editar.jsp?id=<%=rs.getString("idPacientes")%>">Actualizar datos</a></div>
            <div id="boton1" ><a href="eliminar.jsp?id=<%=rs.getString("idPacientes")%>">Eliminar paciente</a></div>
            <div id="boton1"><a href="HistoriaClinica.jsp?id=<%=rs.getString("idPacientes")%>" >Ver historial</a></div>
        </div>
        <!--Mando el parametro ID del paciente que encontre-->            
    <% } %>
    
    
    </body>
</html>
