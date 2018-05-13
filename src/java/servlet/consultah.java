package servlet;

import Controlador.Consulta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author luis
 */
public class consultah extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String id=request.getParameter("id");
        String origen=request.getParameter("origen");
        String residencia=request.getParameter("residen");
        String religion=request.getParameter("reli"); 
        String escolaridad=request.getParameter("escola");
        String habitosH=request.getParameter("habitos");
        String toxiconomia=request.getParameter("toxico");
        String zoonosis=request.getParameter("zoo");
        String grupoRg=request.getParameter("gru");
        String vacunacion=request.getParameter("esq");
        
        String familia=request.getParameter("ant0");
        String patologicos=request.getParameter("ant1");
        String actual=request.getParameter("ant2");
        String ApSistemas=request.getParameter("ant3");
        String EstAux=request.getParameter("ant4");
        String terapeutica=request.getParameter("ant5");
        
       // Consulta con= new Consulta();
        
        /*if(new Consulta ().reg_historial(id, origen, residencia, religion,escolaridad, habitosH, toxiconomia, 
                zoonosis,grupoRg, vacunacion)&&
                new Consulta ().historial_texto(id, familia,patologicos, actual,ApSistemas, EstAux, terapeutica)){
                response.sendRedirect("historial.jsp");
        }else{
            response.sendRedirect("inicio.jsp");
        }
        
        /*if(con.reg_historial(id, origen, residencia, religion,escolaridad, habitosH, toxiconomia, 
                zoonosis,grupoRg, vacunacion)){
            if(con.historial_texto(id, familia,patologicos, actual,ApSistemas, EstAux, terapeutica)){
                response.sendRedirect("historial.jsp");
            }
        }else{
            response.sendRedirect("pruebas.jsp");
        }*/
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