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
    //Obtengo atributo
    HttpSession sesion=request.getSession(false);
    String usuario=(String)sesion.getAttribute("Usuario");
    if(usuario!=null){
        response.sendRedirect("index.jsp"); 
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
input[type=text],input[type=password] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=password]:focus{
    border: 1.5px solid #3498db ;
    transition: 1s;
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
    width: 15%;
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

form{
    text-align: center;
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
        <a id="link" href="index.jsp">Salir</a>
        <div id="buscar">
            <form action="" method="post">
                <label id="label">Username</label>
                <input type="text" name="user">
                <input type="submit" value="Buscar">               
            </form>
        </div>
        <div id="datos">
      <% //Busqueda por nombre del usuario a buscar
          String user=request.getParameter("user");
        Conexion con= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        pst = con.getConexion().prepareStatement("Select * from PERSONAL where Username='"+user+"'");
        rs=pst.executeQuery();
       
        while(rs.next()){
    %>
         <h2>Datos</h2>
         <form  action="" method="post">        
            <input type="text" name="user" value="<%=rs.getString("Username")%>" style="display: none">
            <input type="text" name="id" value="<%=rs.getString("ID_USER")%>" style="display: none">
            
            <label id="titulos">Nombre (s)</label>
            <input type="text" name="nombre" value="<%=rs.getString("NOMBRE")%>" disabled style="color: #273746" ><br>
            <label id="titulos">Apellidos</label>
            &emsp;<input type="text" name="apellidoP" value="<%=rs.getString("APELLIDO")%>" disabled style="color: #273746"><br>
            <label id="titulos">Username</label>
            <input type="text" name="username" value="<%=rs.getString("Username")%>" disabled style="color: #273746"><br>
            <label id="titulos">Nueva Contraseña</label>
            <input type="password" name="contra" style="color: #273746" required ><br>            
            <input type="submit" id="boton1" value="Cambiar contraseña" onclick=this.form.action="CabiaContra">
                    
         </form>
        </div>
        <!--Mando el parametro ID del paciente que encontre-->            
    <% } %>
    </body>
</html>
