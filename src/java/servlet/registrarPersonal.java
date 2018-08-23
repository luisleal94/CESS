/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author luis
 */
public class registrarPersonal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String nombre=request.getParameter("nombre");
        String apellido=request.getParameter("apellido");
        String pass=request.getParameter("pass");
        String tele=request.getParameter("tele");
        String Profesion=request.getParameter("General");
        String espe=request.getParameter("Especialidad");
        String cedula=request.getParameter("Cedula");
        String gerar=request.getParameter("gerar");
        String user=request.getParameter("user");
        if(Profesion.equals("Si")){
            espe="Medico General";
        }
        
        Consulta con= new Consulta();  
        String usuario="";
        Conexion conecta= new Conexion();
        PreparedStatement pst;
        ResultSet rs;
        String encriptMD5=DigestUtils.md5Hex(pass);
        System.out.println("md5:"+encriptMD5);
   
        /*if(con.registro(nombre, apellido, pass, tele, espe, gerar, cedula,user)){
            response.sendRedirect("MostrarPersonal.jsp");
        }else{
            response.sendRedirect("CessSuper.jsp");
        }*/
        
        try {                
            pst=conecta.getConexion().prepareStatement("Select * from PERSONAL where Username='"+user+"'");
            rs=pst.executeQuery();
            while(rs.next()){
                usuario=rs.getString("Username");
            }
            System.out.println(usuario);
                if(usuario.equals("")){
                    System.out.println("No hay pacientes similares");
                    if(con.registro(nombre, apellido, encriptMD5, tele, espe, gerar, cedula,user)){
                        response.sendRedirect("MostrarPersonal.jsp");
                    }else{
                        response.sendRedirect("CessSuper.jsp");
                    }                    
                }else{                  
                    System.out.println("Usuario Repetido");                     
                    response.sendRedirect("CessSuper.jsp");  
                }
            } catch (Exception ex) {
                System.out.println("Error"+ex);
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
