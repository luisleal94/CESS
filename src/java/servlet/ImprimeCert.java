package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.view.JasperViewer;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import Controlador.Conexion;
import Controlador.Consulta;
import java.util.Calendar;
/**
 *
 * @author luis
 */
public class ImprimeCert extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        Conexion con= new Conexion();
        String Doctor=request.getParameter("IdMedico");
        String Paciente=request.getParameter("Paciente");
        String Edad=request.getParameter("Edad");
        String Toxico=request.getParameter("Toxico");
        String Talla=request.getParameter("Talla");
        String IMC=request.getParameter("IMC");
        String Peso=request.getParameter("Peso");
        String Estado=request.getParameter("Estado");
        String FC=request.getParameter("FC");
        String FR=request.getParameter("FR");
        String Visual=request.getParameter("Visual");
        
        System.out.println(Doctor+" "+Paciente+" "+Edad);
        System.out.println(Toxico+" "+Talla+" "+IMC+" "+Estado+" "+FC+" "+FR+" "+Visual);
        Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=anio+"-"+mes+"-"+dia;
        
        String path = getServletContext().getRealPath("/Certificado.jasper");
        Map parameter =new HashMap();  
        File reporfile=new File(getServletContext().getRealPath("/Certificado.jasper"));
        parameter.put("Paciente",new String(Paciente));        
        parameter.put("Medico",new String(Doctor));    
        parameter.put("Edad",new String(Edad));
        parameter.put("Peso",new String(Peso));
        parameter.put("Fecha",new String(fecha));
        parameter.put("Toxico",new String(Toxico));
        parameter.put("Talla",new String(Talla));
        parameter.put("IMC",new String(IMC));
        parameter.put("Estado",new String(Estado));
        parameter.put("FC",new String(FC));
        parameter.put("FR",new String(FR));
        parameter.put("Visual",new String(Visual));
        System.out.println(path);
        byte[] bytes;
        try {
            bytes = JasperRunManager.runReportToPdf(reporfile.getPath(), parameter,con.getConexion());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream=response.getOutputStream();
            outputstream.write(bytes,0,bytes.length);
            outputstream.flush();
            outputstream.close();
        } catch (JRException ex) {
            Logger.getLogger(GuardaReceta2.class.getName()).log(Level.SEVERE, null, ex);
             System.out.println("Error: "+ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
