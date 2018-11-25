/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Controlador.Conexion;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author luis
 */
public class ImprimeBlanco extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        Conexion con= new Conexion();
        String Texto=request.getParameter("texto4");
        String Medico=request.getParameter("IdMedico");
        String Paciente=request.getParameter("Paciente");
        String Edad=request.getParameter("Edad");
         Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=anio+"-"+mes+"-"+dia;
        System.out.println(Texto);
        
        String path = getServletContext().getRealPath("/CertifBlanco.jasper");
        Map parameter =new HashMap();  
        File reporfile=new File(getServletContext().getRealPath("/CertifBlanco.jasper"));
        parameter.put("Paciente",new String(Paciente));        
        parameter.put("Medico",new String(Medico));   
        parameter.put("Fecha",new String(fecha));
        parameter.put("Texto",new String(Texto));
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
