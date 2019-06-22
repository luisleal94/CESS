package servlet;

import Controlador.Conexion;
import Controlador.Consulta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author luis
 */
public class HistRec extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=anio+"-"+mes+"-"+dia;
        
        String Paciente=request.getParameter("Paciente");  
        String Doctor=request.getParameter("Doctor");
        String Fecha=request.getParameter("Fecha");
        String IDUSER=request.getParameter("IDUSER");
        out.println(Paciente);
        out.println("Doctor: "+Doctor);
        out.println(Fecha);
        out.println(" Admin:"+IDUSER);
        
        Conexion conecta= new Conexion();
        new Consulta().RecetaAdmin4(Paciente,IDUSER,fecha);
            PreparedStatement pst;
            ResultSet rs;
            try {                
                pst=conecta.getConexion().prepareStatement("select *from Receta WHERE Fecha='"+ Fecha +"'"+
                    " and IdMedico='"+ Doctor +"' and  IdPaciente='"+ Paciente +"'");
                rs=pst.executeQuery();
                while(rs.next()){
                    new Consulta().RecetaAdmin(rs.getString("Medicamento"),rs.getString("Farmacia"),
                            rs.getString("Unidades"),rs.getString("Administracion"),rs.getString("Presentacion"),rs.getString("Piezas"),rs.getString("Dosis"),
                            rs.getString("Cada"),rs.getString("Dias"),IDUSER,Paciente,fecha);
                }
            }catch (Exception ex) {
                System.out.println("Error"+ex);
            }
                    
        request.setAttribute("Paciente",Paciente);
        request.setAttribute("Doctor",Doctor);
        request.setAttribute("Fecha",fecha);
        request.setAttribute("IDUSER",IDUSER);
        request.getRequestDispatcher("HistorialReceta.jsp").forward(request, response);
        
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
