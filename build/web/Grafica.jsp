<%-- 
    Document   : Grafica.jsp
    Created on : 3/08/2018, 06:43:06 PM
    Author     : luis
--%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.io.*" %>
<%@page import="org.jfree.chart.*"  %>
<%@page import="org.jfree.data.general.*"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estadistica</title>
    </head>
    <body>
        <%
            String idPaciente=request.getParameter("Id");
            System.out.println(idPaciente);
            DefaultCategoryDataset data= new DefaultCategoryDataset();
            Conexion con= new Conexion();
            PreparedStatement pst;
            ResultSet rs;
            pst = con.getConexion().prepareStatement("select Peso,Fecha from ExploracionF where IdPaciente='"+idPaciente+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                //data.setValue(rs.getFloat(0),rs.getString("Fecha"),rs.getString("Fecha")+"="+rs.getFloat(0));
                data.setValue(rs.getFloat(1),rs.getString("Fecha"),rs.getString("Fecha")+"="+rs.getFloat(1));
                System.out.println(rs.getFloat("Peso"));
                System.out.println(rs.getDate("Fecha"));
            }
            JFreeChart grafico=ChartFactory.createBarChart("Grafico del Peso Corporal","Peso","Fecha",data,PlotOrientation.VERTICAL,true,true,true);
            response.setContentType("image/JPGE");
            OutputStream sa=response.getOutputStream();
            ChartUtilities.writeChartAsJPEG(sa,grafico,600,600);
        %>
    </body>
</html>
