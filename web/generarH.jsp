<%-- 
    Document   : generarH.jsp
    Created on : 6/04/2018, 10:49:35 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial Clinico</title>
    </head>
    <body>
        <h1>HISTORIA CLÍNICA GENERAL</h1><br>
        <label>Fecha</label><br><br>
        <input type="text" name="nombre"><br>
        <label>FICHA DE IDENTIDICACIÓN</label><br>
        <label>Nombre</label><br>
        <input type="text" name="nombre" disabled><br>
        <label>Estado Civil</label>
        <input type="text" name="nombre" disabled><br>
        <label>Ocupación</label>
        <input type="text" name="nombre" disabled><br>
        <label>Domicilio</label>
        <input type="text" name="nombre" disabled><br>
        <label>Telefono</label>
        <input type="text" name="nombre" disabled><br>
        <form action="consulaH" method="post">
            <label>ANTECEDENTES PERSONALES NO PATOLÓGICOS</label><br>
            <label>Origen</label><br>
            <input type="text" name="nombre" disabled><br>
            <label>Residencia</label><br>
            <input type="text" name="nombre" disabled><br>
            <label>Religión</label><br>
            <input type="text" name="nombre" disabled><br>
            <label>Escolaridad</label><br>
            <input type="text" name="nombre" disabled><br>
            <label>Habitos higienicos dietéticos</label><br>
            <input type="text" name="nombre" disabled><br>
            <label>Habitación</label>
            <input type="text" name="nombre" disabled><br>
            <label>Toxiconomías</label><br>
            <input type="text" name="nombre" disabled><br><br>
            <label>Zoonosis</label>
            <input type="text" name="nombre" disabled><br>
            <label>Grupo y Rh</label>
            <input type="text" name="nombre" disabled><br>
            <label>Esquema de Vacunación</label>
            <input type="text" name="nombre" disabled><br>
            
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
            
        </form>
    </body>
</html>
