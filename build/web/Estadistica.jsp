<%-- 
    Document   : Estadistica
    Created on : 20/06/2018, 05:19:10 PM
    Author     : luis
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Estadistica.css">
        <script type="text/javascript" src="js/NoBack.js"></script>
        <script type="text/javascript" src="js/radios.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>        
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
        <style>
            head,body{
               background-image: url(img/jj.png);
                font-family: 'Roboto', sans-serif;
            }           
        </style>       
        <title>CESS</title>
    </head>
    <body onload="nobackbutton();">
        <div id="titulo">
            <p style="font-weight: 700; font-size: 25px; position: absolute; z-index: 1px; left: 30%; color: #00A99D;">Estadísticas De Consulta</p>
        </div>
        <a id="link" href="inicio.jsp">Regresar</a>
        <br>
        <div  class="contieneForm" >
            <form action="#" method="post" id="myForm">
                <label>Busqueda específica</label>
                <input type="radio" id="siBus"  name="Busqueda" value="Si" onclick="mostrarBus()">
                <label for="siBus" class="label">Si</label>
                <input type="radio" id="noBus"  name="Busqueda" value="No" onclick="ocultarBus()" checked>
                <label for="noBus" class="label">No</label>
                <input id="caja" type="text" name="caja" value="No" style="display: none">
                <section id="MuestraBusqueda" style="display: none;">
                    <div id="contiene_tabla2">                    
                        <div class="checkbox">
                            <table id="tabla2">                        
                                <tr>
                                    <td><input type="radio" id="si1" name="Tipo" value="Tipo" onclick="mostrarEsta()">
                                        <label for="si1" class="label">Tipo de Personoal</label></td>
                                    <td><input type="radio" id="si2" name="Tipo" value="Demanda" onclick="mostrarEsta()">
                                        <label for="si2" class="label">Demanda</label></td>                        
                                    <!--<td><input type="radio" id="si3" name="Tipo" value="Medico" onclick="mostrarEsta()">
                                        <label for="si3" class="label">Medico</label></td>-->
                                    <td><input type="radio" id="si4" name="Tipo" value="Especialidad" onclick="mostrarEsta()">
                                        <label for="si4" class="label">Especialidad</label></td> 
                                </tr>                       
                            </table>
                        </div>
                    </div> 
                    <section id="muestraEs" style="display: none" class="seccion">
                        <label>Dato:</label>
                        <input type="text" name="Valor">
                    </section>
                </section><br>                
                <p1>De</p1>
                <input type="date" id="fecha" name="Rango1">
                <p1>A</p1>
                <input type="date" name="Rango2">
                <input type="submit" value="Consultar" onclick="seleccionado(this.form)">
            </form>
        </div>
        <div class="datos" >
            <% //Busqueda por nombre del usuario a buscar                
                String Tipo=request.getParameter("Tipo");
                String Valor=request.getParameter("Valor");
                String Rango1=request.getParameter("Rango1");
                String Rango2=request.getParameter("Rango2");
                String sql="",sql2=""; 
                System.out.println("Valor:"+Valor);
                if(Tipo==null){
                     sql="Select *from Consulta where Fecha BETWEEN '"+Rango1+"' AND '"+Rango2+"'";
                    sql2="SELECT count(*) as Total,sum(Costo) as Costo FROM Consulta WHERE Fecha BETWEEN '"+Rango1+"' AND '"+Rango2+"'";
                }
                else{
                    sql="SELECT * FROM Consulta WHERE Fecha BETWEEN '"+Rango1+"' AND '"+Rango2+"' and "+Tipo+"='"+Valor+"'";
                    sql2="SELECT count(*) as Total,sum(Costo) as Costo FROM Consulta WHERE Fecha BETWEEN '"+Rango1+"' AND '"+Rango2+"' and "+Tipo+"='"+Valor+"'";
                    System.out.println("Entro");
                }
                System.out.println(Tipo+" "+ Valor);
                System.out.println(sql);
                Conexion con= new Conexion();
                PreparedStatement pst;
                ResultSet rs;
                pst = con.getConexion().prepareStatement(sql);
                rs=pst.executeQuery();
            %>
            <div class="contiene_tabla">
                <table id="tabla">
                    <tr>
                        <th>Fecha</th>                        
                        <th>Medico</th>
                        <th>Especialidad</th>
                        <th>Nombre</th>
                        <th>Personal</th>
                        <th>Costo</th>
                    </tr>
                    <%while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString("Fecha")%></td>
                        <td><%=rs.getString("Medico")%></td>
                        <td><%=rs.getString("Especialidad")%></td>
                        <td><%=rs.getString("Nombre")%></td>
                        <td><%=rs.getString("Tipo")%></td>
                        <td><%=rs.getString("Costo")%></td>
                    </tr>
                    <%                
                        }
                    %>
                </table>
            </div>
                <%
                    float Total2;
                    pst = con.getConexion().prepareStatement(sql2);
                    rs=pst.executeQuery();
                    while(rs.next()){  
                        if(rs.getString("Costo")==null){
                            Total2=0;
                        }else{
                            Total2=Float.parseFloat(rs.getString("Costo"));
                        }%>
                    <div class="Total">
                        <label>Total</label>
                        <input type="text" value="<%=rs.getString("Total")%>"  style="color: black"disabled>
                        <label>Capital</label>
                        <input type="text" value="<%=Total2%>"  style="color: black"disabled>
                    </div>
                    
                <%  } %>
        </div>           
    </body>
    <script language="JavaScript">
		$('#myForm input').on('change', function() {
     		//alert($('input[name=Busqueda]:checked', '#myForm').val()); 
                document.getElementById("caja").value=$('input[name=Busqueda]:checked', '#myForm').val();
  		});
              
	</script>
</html>