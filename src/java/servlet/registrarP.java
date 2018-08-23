package servlet;

import Controlador.Conexion;
import Controlador.Consulta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Calendar calender = Calendar.getInstance();
        int anio=calender.get(Calendar.YEAR);
        String nombre=request.getParameter("nombre");
        String apellidop=request.getParameter("apellido1");
        String apellidom=request.getParameter("apellido2"); 
        String Anio=request.getParameter("Anio");
        String Mes=request.getParameter("mes");
        String Dia=request.getParameter("dia");
        String tele=request.getParameter("telefono");
        String domi=request.getParameter("domicilio");
        String Ecivil=request.getParameter("estado_civil");
        String ocu=request.getParameter("ocupacion");
        String curp=request.getParameter("curp");
        String sexo=request.getParameter("sexo");
        int Edad=anio-Integer.parseInt(Anio);
        String curp2="";
        Consulta con= new Consulta();
        Conexion conecta= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        System.out.println(nombre+apellidom);
        try {                
            pst=conecta.getConexion().prepareStatement("Select * from Pacientes where Curp='"+curp+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                curp2=rs.getString("Curp");
            }
            //System.out.println(curp2);
                if(curp2.equals("")){
                    //System.out.println("No hay pacientes similares");
                    if(con.reg_paciente(nombre,apellidop,apellidom,Anio,Mes,Dia,tele,ocu,Ecivil,domi,curp,sexo)){       
                    String id="";
                    try {                
                        pst=conecta.getConexion().prepareStatement("Select * from Pacientes where Curp='"+curp+"'");
                        rs=pst.executeQuery();
                        while(rs.next()){
                            id=rs.getString("idPacientes");
                        }
                        System.out.println(id);
                        request.setAttribute("id",id);       
                        request.setAttribute("Edad",Edad);       
                        request.getRequestDispatcher("HistoriaClinica.jsp").forward(request, response);
                       
                    } catch (Exception ex) {
                        System.out.println("Error 1: "+ex);                        
                    }                 
                    //System.out.println("Registrado");
                    }else{  
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal ('Oops','Error en el registro','error')");
                        out.println("});");
                        out.println("</script>");
                        System.out.println("No se registro correctamente");
                        response.sendRedirect("inicio.jsp");
                    }
                }else{
                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal ('Oops','Paciente repedito','error')");
                    out.println("});");
                    out.println("</script>");
                    //System.out.println("Paciente Repetido");       
                    RequestDispatcher rd=request.getRequestDispatcher("inicio.jsp");
                    rd.include(request, response);
                    //response.sendRedirect("inicio.jsp");  
                }
            } catch (Exception ex) {
                System.out.println("Error 2: "+ex);
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
