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
public class GuardaH extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         String id=request.getParameter("id");
         
        /*No patologicos*/
        String aseo=request.getParameter("aseo");
        String bucal=request.getParameter("bucal");
        String ropa=request.getParameter("ropa");
        String leche=request.getParameter("leche");
        String carne=request.getParameter("carne");
        String huevos=request.getParameter("huevos");
        String verdura=request.getParameter("verduras");
        String cereal=request.getParameter("cereal");
        String legumbre=request.getParameter("legum");
        
        /*Exploracion fisica*/
        String peso = request.getParameter("peso");
        String talla= request.getParameter("talla");
        String imc= request.getParameter("imc");
        String temp= request.getParameter("temp");
        String FR =request.getParameter("fr");
        String FC= request.getParameter("fc");
       
        /*Imnunizacion*/
        String tetano=request.getParameter("tetano");
        String sarampion=request.getParameter("sarampion");
        String rubeola=request.getParameter("rubeola");
        String hepatica=request.getParameter("hepatica");
        String parasito=request.getParameter("paracitos");
        
        if(new Consulta().historial_fisica(peso, talla, imc, temp, FR, FC, id)
                && new Consulta().historial_NoPato(aseo, bucal, ropa, leche, carne, huevos, verdura, legumbre, cereal, id)
                && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatica, parasito, id)){
            response.sendRedirect("historial.jsp");
        }else{
            response.sendRedirect("inicio.jsp");
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
