/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Controlador.Conexion;
import Controlador.Consulta;
import java.io.*;
import java.util.*;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.view.JasperViewer;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

/**
 *
 * @author luis
 */
public class GuardaReceta2 extends HttpServlet {

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
       // PrintWriter out = response.getWriter();
        Conexion con= new Conexion();
        
        String valor=request.getParameter("Valor");
        System.out.println("Valor:"+valor);
        String id=request.getParameter("ID");
        String IdMedico=request.getParameter("Doctor");
        String fecha=request.getParameter("Fecha");
        
        if(valor!=""){
            int Q=Integer.parseInt(valor);
            int res=Q*9;
            int a=0;
            String [] inputQ=new String[res];
            for(int i=1;i<Q+1;i++){
                for(int j=0;j<9;j++){
                    inputQ[a]=request.getParameter("id"+i+(j+1));
                    a+=1;
                }
            }
            a=0;            
            for(int j=0;j<Q;j++){
                System.out.println(inputQ[a]+" " +inputQ[a+1]+" "+inputQ[a+2]);
                System.out.println(inputQ[a+3]+" " +inputQ[a+4]+" "+inputQ[a+5]);
                System.out.println(inputQ[a+6]+" " +inputQ[a+7]+" "+inputQ[a+8]);
                new Consulta().Receta(inputQ[a],inputQ[a+1],inputQ[a+2],inputQ[a+3], 
                        inputQ[a+4], inputQ[a+5],inputQ[a+6],inputQ[a+7],inputQ[a+8],IdMedico,id);
                System.out.println();   
                a+=9;
            }
            //System.out.println(a); 
        }
       
        String path = getServletContext().getRealPath("/Recet.jasper");
        Map parameter =new HashMap();  
        File reporfile=new File(getServletContext().getRealPath("/Recet.jasper"));
        parameter.put("Paciente",new String(id));        
        parameter.put("Medico",new String(IdMedico));      
        parameter.put("Fecha",new String(fecha));
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
