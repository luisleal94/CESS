package servlet;

import Controlador.Consulta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registrarCon extends HttpServlet {

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String id=request.getParameter("id");  //Id del paciente
        String NombrePaci=request.getParameter("NombrePaci");
        String peso=request.getParameter("peso");
        String talla=request.getParameter("talla");
        String imc=request.getParameter("imc");
        String temp=request.getParameter("temp");
        String fc=request.getParameter("fc");
        String fr=request.getParameter("fr");
        String padeci=request.getParameter("padeci");
        String explo=request.getParameter("exploracion");
        String diagnos=request.getParameter("diagnos");
        String canali=request.getParameter("canali");// Canalizacion?
        String gabinete=request.getParameter("gabinete");  //Gabinete
        String ResGabi=request.getParameter("ResGabi");  //Si gabinete
        String laboratorio=request.getParameter("laboratorio"); //Laboratorio?
        String Reslabora=request.getParameter("Reslabora"); //SI laboratirio
        String tratamiento=request.getParameter("tratamiento");  
        String medico=request.getParameter("Doctor");
        String costo=request.getParameter("Costo");
        String tipo=request.getParameter("Tipo");
        String Demanda=request.getParameter("Demanda");
        String folio=request.getParameter("folio");
        
        System.out.println(NombrePaci);
        if(canali.equals("No")){
            ResGabi="Ninguno";
            Reslabora="Ninguno";
        }       
        else{
            if(gabinete.equals("No")){
                ResGabi="Ninguno";
            }
            if(laboratorio.equals("No")){
                Reslabora="Ninguno";
            }
        }
        System.out.println(medico);
        Consulta con= new Consulta();
        if(con.GenerarConsulta(id, explo, padeci, diagnos, canali, ResGabi, Reslabora, tratamiento, medico,costo,tipo,NombrePaci,Demanda,folio)){
            response.sendRedirect("Receta.jsp");
        }else{
            response.sendRedirect("CessSuper.jsp");
        }
//response.sendRedirect("Receta.jsp");
       
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
