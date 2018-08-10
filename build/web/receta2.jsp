<%-- 
    Document   : receta2
    Created on : 7/08/2018, 09:21:45 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/Posoble2.js"></script>
        <link rel="stylesheet" href="css/PosibleEstilo2.css">
        <title>Receta 2</title>
    </head>
    <body>
        <div class="boton">
        <input type="button" id="add" class="input" value="Agregar Alergia" onclick="Javascript:addRow()">
        </div>  
        <form method="post" action="GuardaReceta2" >
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
            <input type="text" id="Valor" name="Valor">
      <input type="submit" value="Imprimir">
    </form>
    </body>
</html>
