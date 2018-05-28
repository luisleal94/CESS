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
public class registrarP extends HttpServlet {

       protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String nombre=request.getParameter("nombre");
        String apellidop=request.getParameter("apellido1");
        String apellidom=request.getParameter("apellido2"); 
        String edad=request.getParameter("edad");
        String tele=request.getParameter("telefono");
        String domi=request.getParameter("domicilio");
        String Ecivil=request.getParameter("estado_civil");
        String ocu=request.getParameter("ocupacion");
        String curp=request.getParameter("curp");
        String sexo=request.getParameter("sexo");
        
        Consulta con= new Consulta();
        if(con.reg_paciente(nombre,apellidop,apellidom,edad,tele,ocu,Ecivil,domi,curp,sexo)){
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
