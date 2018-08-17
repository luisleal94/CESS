<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="javax.servlet.ServletResponse" %>
<%@page import="Controlador.Conexion"%>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

    <%
        Conexion con= new Conexion();
        
        String IdPaciente=request.getParameter("ID");
        String Medico=request.getParameter("Doctor");
        String fecha=request.getParameter("Fecha");
        System.out.println(IdPaciente);
        System.out.println(Medico);
        System.out.println(fecha);
        
        File reporfile=new File(application.getRealPath("Recet_1.jasper"));
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