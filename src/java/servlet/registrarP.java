package servlet;

import Controlador.Conexion;
import Controlador.Consulta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        
        String curp2="";
        Consulta con= new Consulta();
        Conexion conecta= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        
        try {                
            pst=conecta.getConexion().prepareStatement("Select * from Pacientes where Curp='"+curp+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                curp2=rs.getString("Curp");
            }
            System.out.println(curp2);
                if(curp2.equals("")){
                    System.out.println("No hay pacientes similares");
                    if(con.reg_paciente(nombre,apellidop,apellidom,edad,tele,ocu,Ecivil,domi,curp,sexo)){       
                    String id="";
                    try {                
                        pst=conecta.getConexion().prepareStatement("Select * from Pacientes where Curp='"+curp+"'");
                        rs=pst.executeQuery();
                        while(rs.next()){
                            id=rs.getString("idPacientes");
                        }
                        System.out.println(id);
                        request.setAttribute("id",id);               
                        request.getRequestDispatcher("HistoriaClinica.jsp").forward(request, response);
                    } catch (Exception ex) {
                        System.out.println("Error"+ex);
                    }                 
                    System.out.println("Registrado");
                    }else{  
                        response.sendRedirect("inicio.jsp");
                    }
                }else{
                    System.out.println("Paciente registrado");                     
                    response.sendRedirect("inicio.jsp");  
                }
            } catch (Exception ex) {
                System.out.println("Error"+ex);
            }
        
        /*if(con.reg_paciente(nombre,apellidop,apellidom,edad,tele,ocu,Ecivil,domi,curp,sexo)){       
            String id="";
            try {                
                pst=conecta.getConexion().prepareStatement("Select * from Pacientes where Curp='"+curp+"'");
                rs=pst.executeQuery();
                while(rs.next()){
                    id=rs.getString("idPacientes");
                }
                System.out.println(id);
                request.setAttribute("id",id);               
                request.getRequestDispatcher("HistoriaClinica.jsp").forward(request, response);
            } catch (Exception ex) {
                System.out.println("Error"+ex);
            }
            //response.sendRedirect("historial.jsp");
            System.out.println("Registrado");
        }else{  
            response.sendRedirect("inicio.jsp");
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
