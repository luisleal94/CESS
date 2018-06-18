package servlet;

import Controlador.Conexion;
import Controlador.Consulta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author luis
 */
public class sesion extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
        //Obtengo parametros de mi base de datos
        String usuario=request.getParameter("Usuario");
        String pass=request.getParameter("pass");
        String id="";
        String gerarquia="";
        String cedula="";
        Consulta co= new Consulta();
        if(co.login(usuario, pass)){
            Conexion conecta= new Conexion();
            PreparedStatement pst;
            ResultSet rs;
            try {                
                pst=conecta.getConexion().prepareStatement("select *from PERSONAL where Username='"+usuario+"' and PASSWORD='"+pass+"'");
                rs=pst.executeQuery();
                while(rs.next()){
                    //id=rs.getString("ID_");
                    gerarquia=rs.getString("Gerarquia");   
                    cedula=rs.getString("Cedula");
                    
                }
                System.out.println(id);
                System.out.println(gerarquia);
               
                if(gerarquia.equals("Super")){
                    HttpSession sesion= request.getSession(true);
                    sesion.setAttribute("Usuario", usuario);
                    sesion.setAttribute("Gerarquia", gerarquia);
                    sesion.setAttribute("Cedula", cedula);
                    response.sendRedirect("CessSuper.jsp");
                }
                if(gerarquia.equals("Admin")){
                    HttpSession sesion= request.getSession(true);
                    sesion.setAttribute("Usuario", usuario);
                    sesion.setAttribute("Gerarquia", gerarquia);
                    sesion.setAttribute("Cedula", cedula);
                    response.sendRedirect("CessAdmin.jsp");
                }
                if(gerarquia.equals("usuario")){
                    HttpSession sesion= request.getSession(true);
                    sesion.setAttribute("Usuario", usuario);
                    sesion.setAttribute("Gerarquia", gerarquia);
                    sesion.setAttribute("Cedula", cedula);
                    response.sendRedirect("inicio.jsp");
                }
            
                
            } catch (Exception ex) {
                System.out.println("Error"+ex);
            }
            //Creo la variable sesion
            /*HttpSession sesion= request.getSession(true);
            sesion.setAttribute("Usuario", usuario);
            response.sendRedirect("inicio.jsp");*/
        }else{
            response.sendRedirect("index.jsp");
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
