package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class generarH_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

    HttpSession sesion=request.getSession(false); //Sesion
    //Obtengo atributo
    
    String usuario=(String)sesion.getAttribute("Usuario");
    if(usuario==null){
        response.sendRedirect("index.jsp"); 
    }
    /*if(usuario.equals("")){
        response.sendRedirect("index.jsp"); 
    }*/

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Historial Clinico</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>HISTORIA CLÍNICA GENERAL</h1><br>\n");
      out.write("        <label>Fecha</label><br><br>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <input type=\"text\" name=\"nombre\"><br>\n");
      out.write("        <label>FICHA DE IDENTIDICACIÓN</label><br>\n");
      out.write("        <label>Nombre</label><br>\n");
      out.write("        <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("        <label>Estado Civil</label>\n");
      out.write("        <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("        <label>Ocupación</label>\n");
      out.write("        <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("        <label>Domicilio</label>\n");
      out.write("        <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("        <label>Telefono</label>\n");
      out.write("        <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("        <form action=\"consulaH\" method=\"post\">\n");
      out.write("            <label>ANTECEDENTES PERSONALES NO PATOLÓGICOS</label><br>\n");
      out.write("            <label>Origen</label><br>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            <label>Residencia</label><br>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            <label>Religión</label><br>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            <label>Escolaridad</label><br>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            <label>Habitos higienicos dietéticos</label><br>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            <label>Habitación</label>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            <label>Toxiconomías</label><br>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br><br>\n");
      out.write("            <label>Zoonosis</label>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            <label>Grupo y Rh</label>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            <label>Esquema de Vacunación</label>\n");
      out.write("            <input type=\"text\" name=\"nombre\" disabled><br>\n");
      out.write("            \n");
      out.write("            <label>ANTECEDENTES PERSONALES PATOLÓGICOS\n");
      out.write("                (Medicos,Qx,Tx,Transfusionales,Alergicos</label><br>\n");
      out.write("            <textarea name=\"ant1\" autofocus cols=\"30\" rows=\"5\"></textarea><br>\n");
      out.write("            \n");
      out.write("            <label>Padecimiento Actual</label><br>\n");
      out.write("            <textarea name=\"ant2\" autofocus cols=\"30\" rows=\"5\"></textarea><br>\n");
      out.write("        \n");
      out.write("            <label>Aparatos y Sistemas</label><br>\n");
      out.write("            <textarea name=\"ant2\" autofocus cols=\"30\" rows=\"5\"></textarea><br>\n");
      out.write("            \n");
      out.write("            <label>Equipos Auxiliares de Diagnóstico Previso\n");
      out.write("            (Laboratorio y Gabinete</label><br>\n");
      out.write("            <textarea name=\"ant2\" autofocus cols=\"30\" rows=\"5\"></textarea><br>\n");
      out.write("            \n");
      out.write("            <label>Terapéutica Empleada y Resultados Obtenidos</label><br>\n");
      out.write("            <textarea name=\"ant2\" autofocus cols=\"30\" rows=\"3\"></textarea>\n");
      out.write("            \n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
