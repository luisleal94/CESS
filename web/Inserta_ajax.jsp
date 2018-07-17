<%-- 
    Document   : Inserta_ajax
    Created on : 15/07/2018, 02:48:22 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario con Ajax</title>
         <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
         <script>
             function validaForm(){
                // Campos de texto
                if($("#nombre").val() == ""){
                    alert("El campo Nombre no puede estar vacío.");
                    $("#nombre").focus();       // Esta función coloca el foco de escritura del usuario en el campo Nombre directamente.
                    return false;
                }
                if($("#apellidos").val() == ""){
                    alert("El campo Apellidos no puede estar vacío.");
                    $("#apellidos").focus();
                    return false;
                }
                if($("#direccion").val() == ""){
                    alert("El campo Dirección no puede estar vacío.");
                    $("#direccion").focus();
                    return false;
                }

                // Checkbox
                if(!$("#mayor").is(":checked")){
                    alert("Debe confirmar que es mayor de 18 años.");
                    return false;
                }

                return true; // Si todo está correcto
            }
            
            $(document).ready( function() {   // Esta parte del código se ejecutará automáticamente cuando la página esté lista.
                $("#botonenviar").click( function() {     // Con esto establecemos la acción por defecto de nuestro botón de enviar.
                    if(validaForm()){                               // Primero validará el formulario.
                        $.post("enviar",$("#formdata").serialize());
                    }
                });    
            });
         </script>
    </head>
    <body>
        <div id="formulario">
            <form method="post" id="formdata">
                <label for="nombre">Nombre: </label><input type="text" name="nombre" id="nombre" required="required"></br>
                <label for="apellidos">Apellidos: </label><input type="text" name="apellidos" id="apellidos" required="required"></br>
                <label for="direccion">Dirección: </label><input type="text" name="direccion" id="direccion" required="required"></br>
                Género: <input type="radio" name="genero" id="hombre" checked="checked"><label for="hombre"> Hombre - </label><input type="radio" name="genero" id="mujer"><label for="mujer"> Mujer</label>
                <label for="mayor">Es mayor de 18 años: </label><input type="checkbox" name="mayor" id="mayor" required="required">
                <input type="button" id="botonenviar" value="Enviar">
            </form>
        </div>
        <div id="exito" style="display:none">
            Sus datos han sido recibidos con éxito.
        </div>
        <div id="fracaso" style="display:none">
            Se ha producido un error durante el envío de datos.
        </div>
    </body>
</html>
