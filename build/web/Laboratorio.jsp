<%-- 
    Document   : Laboratorio
    Created on : 10/08/2018, 07:12:44 AM
    Author     : luis
--%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="javax.servlet.ServletResponse" %>
<%@page import="Controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudios</title>
    </head>
    <body>
        <%
        Conexion con= new Conexion();
        String IdPaciente=request.getParameter("ID");
        String Medico=request.getParameter("Doctor");
        String fecha=request.getParameter("Fecha");
        File reporfile=new File(application.getRealPath("Receta2.jasper"));
        Map parameter =new HashMap();     
        
        parameter.put("Paciente",new String(IdPaciente));        
        parameter.put("Medico",new String(Medico));      
        parameter.put("Fecha",new String(fecha));
        byte[] bytes=JasperRunManager.runReportToPdf(reporfile.getPath(), parameter,con.getConexion());
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream=response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();
        %>
    </body>
</html>
