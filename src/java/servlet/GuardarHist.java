/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class GuardarHist extends HttpServlet {

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
        
        String id=request.getParameter("id");
        String sexo=request.getParameter("sexo");
        
        /*No patologicos*/
        String aseo=request.getParameter("aseo");
        String bucal=request.getParameter("bucal");
        String ropa=request.getParameter("ropa");
        String leche=request.getParameter("leche");
        String carne=request.getParameter("carne");
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
        String hepatica=request.getParameter("hepatitis");
        String parasito=request.getParameter("paracitos");
        
        /*Sistema 1*/
        String estomago=request.getParameter("estomago");
        String Vomito=request.getParameter("vomito");
        String otros3=request.getParameter("otros3");
        
        String tos=request.getParameter("tos");
        String pecho=request.getParameter("pecho");
        String otros4=request.getParameter("otros4");
        
        String ejercicio=request.getParameter("fatiga");
        String cabeza=request.getParameter("dolCab");
        String otros2=request.getParameter("otros2");
        
        
        /*Vicios*/
        String toma=request.getParameter("alcol");
        String fuma=request.getParameter("fuma");
        String relacion=request.getParameter("rela");
        String inicio=request.getParameter("inicio1"); //Inicio de beber
        String cantidad=request.getParameter("cantidad1"); //Cuanto beb
        String inicioF=request.getParameter("inicio2"); //Inicio de fumar
        String cantidadF=request.getParameter("cantidad2"); //Cuanto fuma
        String inicioR=request.getParameter("inicio3"); //Inicio de relaciones
        String protec=request.getParameter("proteccion");
        
        /*Patologicos*/
        String combre=request.getParameter("combe");
        String cirujia=request.getParameter("ciru");
        String alergia=request.getParameter("alergia");
        String diabetes=request.getParameter("diabe");
        String hiper=request.getParameter("hiper");
        //String convul=request.getParameter("convul");
        String causaQ=request.getParameter("causaQ");
        String fechaQ=request.getParameter("fechaQ");
        String CompQ=request.getParameter("CompQ");
        String fechaA=request.getParameter("fechaA");
        String medicaA=request.getParameter("medicA");
        String fechaDI=request.getParameter("cuandoDA");
        String medicDia=request.getParameter("medicDA");
        String compli=request.getParameter("compliDA");
        String fechaHi=request.getParameter("cuandoHI");
        String medicHI=request.getParameter("medicHI");
        String compliHI=request.getParameter("compliHI");
        String texto=request.getParameter("texto");
        
        /*String fechaConv=request.getParameter("cuandoConv");
        String CausaConv=request.getParameter("ocaciona");
        String medicConv=request.getParameter("medicConv");
        String compliConv=request.getParameter("compliConv");*/
        
        if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)){
            //String id=request.getParameter("id");
            request.setAttribute("id",id);
            request.getRequestDispatcher("Consulta.jsp").forward(request, response);
            //response.sendRedirect("Consulta.jsp");
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
