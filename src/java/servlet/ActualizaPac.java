/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Controlador.Consulta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author luis
 */
public class ActualizaPac extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String id,nombre,apellidop,apellidom,edad,tele,ocu,estado,domi,curp,Anio,Mes,Dia;
        id=request.getParameter("id");
        nombre=request.getParameter("nombre");//Obtengo el parametro del texbox
        apellidop=request.getParameter("apellidoP");
        apellidom=request.getParameter("apellidoM");
        tele=request.getParameter("tele");
        ocu=request.getParameter("ocupa");
        estado=request.getParameter("Estado");
        domi=request.getParameter("Domi");
        curp=request.getParameter("Curp");
        Anio=request.getParameter("Anio");
        Mes=request.getParameter("mes");
        Dia=request.getParameter("dia");
        Consulta co= new Consulta();
        if(co.ActualizaPac(nombre, apellidop, apellidom, tele, ocu, estado, domi,curp,Anio,Mes,Dia,id)){
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal ('Correcto','Actualización exitosa','success')");
            out.println("});");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("historial.jsp");
            rd.include(request, response);
        }else{
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal ('Oops','Error en el proceso','error')");
            out.println("});");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("historial.jsp");
            rd.include(request, response);
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
