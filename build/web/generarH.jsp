<%-- 
    Document   : generarH.jsp
    Created on : 6/04/2018, 10:49:35 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
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
        <title>Historial Clinico</title>
    </head>
    <body>
        <h1>HISTORIA CLÍNICA GENERAL</h1><br>
        <label>Fecha</label><br><br>
        <!--Area para fecha, se hará con java-->
        <% 
            Calendar calender = Calendar.getInstance();
            String fecha;
            int dia=calender.get(Calendar.DAY_OF_MONTH);
            int mes=(calender.get(Calendar.MONTH))+1;
            int anio=calender.get(Calendar.YEAR);
            fecha=dia+" / "+mes+" / "+anio;
        %>
        <input type="text" name="fecha" value="<%=fecha%>"><br>
        <label>FICHA DE IDENTIDICACIÓN</label><br>
         <% //Busqueda por ID del usuario a buscar
            String id=request.getParameter("id");
            Conexion con= new Conexion();
            PreparedStatement pst;
            ResultSet rs;
            pst = con.getConexion().prepareStatement("Select * from Pacientes where idPacientes='"+id+"'");
            rs=pst.executeQuery();
             while(rs.next()){
        %>
            <label>Nombre</label>
            <input type="text" name="nombre" disabled value=" <%=rs.getString("Nombre")%>"><br>
            <label>Estado Civil</label>
            <input type="text" name="nombre" disabled><br>
            <label>Ocupación</label>
            <input type="text" name="nombre" disabled><br>
            <label>Domicilio</label>
            <input type="text" name="nombre" disabled><br>
            <label>Telefono</label>
            <input type="text" name="nombre" disabled value="<%=rs.getString("telefono")%>" ><br>
            <% } %>            
        <form action="consultah" method="post">
            
            <label>ANTECEDENTES PERSONALES NO PATOLÓGICOS</label><br>
            <input type="text" value="<%=id%>" name="id" style="visibility:hidden"><br>
            <label>Origen</label><br>
            <input type="text" name="origen" ><br>
            <label>Residencia</label><br>
            <input type="text" name="residen" ><br>
            <label>Religión</label><br>
            <input type="text" name="reli" ><br>
            <label>Escolaridad</label><br>
            <input type="text" name="escola" ><br>
            <label>Habitos higienicos dietéticos</label><br>
            <input type="text" name="habitos" ><br>
            <!--Faltaria agregar a la DB-->
            <!--<label>Habitación</label>
            <input type="text" name="habitacion" disabled><br>-->
            <label>Toxiconomías</label><br>
            <input type="text" name="toxico" ><br><br>
            <label>Zoonosis</label>
            <input type="text" name="zoo" ><br>
            <label>Grupo y Rh</label>
            <input type="text" name="gru" ><br>
            <label>Esquema de Vacunación</label>
            <input type="text" name="esq" ><br>
            
            <label>ANTECEDENTES PERSONALES PATOLÓGICOS
                (Medicos,Qx,Tx,Transfusionales,Alergicos</label><br>
            <textarea name="ant1" autofocus cols="30" rows="5"></textarea><br>
            
            <label>Padecimiento Actual</label><br>
            <textarea name="ant2" autofocus cols="30" rows="5"></textarea><br>
        
            <label>Aparatos y Sistemas</label><br>
            <textarea name="ant2" autofocus cols="30" rows="5"></textarea><br>
            
            <label>Equipos Auxiliares de Diagnóstico Previso
            (Laboratorio y Gabinete</label><br>
            <textarea name="ant2" autofocus cols="30" rows="5"></textarea><br>
            
            <label>Terapéutica Empleada y Resultados Obtenidos</label><br>
            <textarea name="ant2" autofocus cols="30" rows="3"></textarea>
            <input type="submit" value="Guardar" >
        </form>
    </body>
</html>
