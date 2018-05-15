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
        
        /*Sistema 1*/
        String estomago=request.getParameter("estomago");
        String Vomito=request.getParameter("vomito");
        String agruras=request.getParameter("agruras");
        String tos=request.getParameter("tos");
        String pecho=request.getParameter("pecho");
        String espalda=request.getParameter("esplada");
        String palpitaciones=request.getParameter("palpita");
        String ejercicio=request.getParameter("fatiga");
        String cabeza=request.getParameter("dolCab");
        
        /*Vicios*/
        String toma=request.getParameter("alcol");
        String fuma=request.getParameter("fuma");
        String relacion=request.getParameter("rela");
        String inicio=request.getParameter("inicio1"); //Inicio de beber
        String cantidad=request.getParameter("cantidad1"); //Cuanto beb
        String inicioF=request.getParameter("inicio2"); //Inicio de fumar
        String cantidadF=request.getParameter("cantidad2"); //Cuanto fuma
        String inicioR=request.getParameter("inicio3"); //Inicio de relaciones
        String frecuenciaR=request.getParameter("frecuencia3");
        String parejaR=request.getParameter("parejas");
        String servidoras=request.getParameter("servidoras");
        String protec=request.getParameter("proteccion");
        
        /*Patologicos*/
        String cirujia=request.getParameter("ciru");
        String alergia=request.getParameter("alergia");
        String diabetes=request.getParameter("diabe");
        String hiper=request.getParameter("hiper");
        String convul=request.getParameter("convul");
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
        String fechaConv=request.getParameter("cuandoConv");
        String CausaConv=request.getParameter("ocaciona");
        String medicConv=request.getParameter("medicConv");
        String compliConv=request.getParameter("compliConv");

       if(sexo.equals("Femenino")){
            String menarca=request.getParameter("menarca");
            String duracionM=request.getParameter("duracion");
            String dolorM=request.getParameter("dolorM");
            String MedicaM=request.getParameter("MedicaM");
            String embara=request.getParameter("embara");
            if(embara.equals("Si")){
                String NoEmba=request.getParameter("NoEmba");
                String abortos=request.getParameter("abortos");
                String Cesareas=request.getParameter("Cesareas");
                String CompliEmba=request.getParameter("CompliEmba");
                String UltimaRe=request.getParameter("UltimaRe");
                if(toma.equals("No")&&fuma.equals("No")&&relacion.equals("No")){
                    if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")&&convul.equals("No")){
                        if(new Consulta().historial_fisica(peso, talla, imc, temp, FR, FC, id)
                            && new Consulta().historial_NoPato(aseo, bucal, ropa, leche, carne, huevos, verdura, legumbre, cereal, id)
                            && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatica, parasito, id)
                            && new Consulta().historial_Sistema1(estomago, Vomito, agruras, tos, pecho, espalda, palpitaciones,
                                ejercicio, cabeza, id)
                            &&new Consulta().historial_Vicio(toma, fuma, relacion, id)
                            &&new Consulta().Patologicos(cirujia, alergia, diabetes, hiper, convul, id)
                            &&new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)
                            &&new Consulta().ResGineco(NoEmba, abortos, Cesareas, CompliEmba, UltimaRe, id)){
                            response.sendRedirect("historial.jsp");
                        }else{
                            response.sendRedirect("inicio.jsp");
                        }
                    }else{/*Si cirujia Si alerjia*/
                        if(new Consulta().historial_fisica(peso, talla, imc, temp, FR, FC, id)
                            && new Consulta().historial_NoPato(aseo, bucal, ropa, leche, carne, huevos, verdura, legumbre, cereal, id)
                            && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatica, parasito, id)
                            && new Consulta().historial_Sistema1(estomago, Vomito, agruras, tos, pecho, espalda, palpitaciones,
                                ejercicio, cabeza, id)
                            &&new Consulta().historial_Vicio(toma, fuma, relacion, id)
                            &&new Consulta().Patologicos(cirujia, alergia, diabetes, hiper, convul, id)
                            &&new Consulta().ResPatolo(causaQ, fechaQ, CompQ, fechaA, medicaA, fechaDI, medicDia, compli, fechaHi, medicHI, compliHI, fechaConv, CausaConv, medicConv, compliConv, id)
                            &&new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)
                            &&new Consulta().ResGineco(NoEmba, abortos, Cesareas, CompliEmba, UltimaRe, id)){
                            response.sendRedirect("historial.jsp");
                        }else{
                            response.sendRedirect("inicio.jsp");
                        }
                    }
                }else{/*Si toma Si fuma Si rela*/
                    if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")&&convul.equals("No")){
                        if(new Consulta().historial_fisica(peso, talla, imc, temp, FR, FC, id)
                            && new Consulta().historial_NoPato(aseo, bucal, ropa, leche, carne, huevos, verdura, legumbre, cereal, id)
                            && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatica, parasito, id)
                            && new Consulta().historial_Sistema1(estomago, Vomito, agruras, tos, pecho, espalda, palpitaciones,
                                ejercicio, cabeza, id)
                            &&new Consulta().historial_Vicio(toma, fuma, relacion, id)
                            &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,frecuenciaR,parejaR,servidoras,protec, id)
                            &&new Consulta().Patologicos(cirujia, alergia, diabetes, hiper, convul, id)
                            &&new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)
                            &&new Consulta().ResGineco(NoEmba, abortos, Cesareas, CompliEmba, UltimaRe, id)){
                            response.sendRedirect("historial.jsp");
                        }else{
                            response.sendRedirect("inicio.jsp");
                        }
                    }else{/*Si cirujia Si alerjia*/
                        if(new Consulta().historial_fisica(peso, talla, imc, temp, FR, FC, id)
                            && new Consulta().historial_NoPato(aseo, bucal, ropa, leche, carne, huevos, verdura, legumbre, cereal, id)
                            && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatica, parasito, id)
                            && new Consulta().historial_Sistema1(estomago, Vomito, agruras, tos, pecho, espalda, palpitaciones,
                                ejercicio, cabeza, id)
                            &&new Consulta().historial_Vicio(toma, fuma, relacion, id)
                            && new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,frecuenciaR,parejaR,servidoras,protec, id)
                            &&new Consulta().Patologicos(cirujia, alergia, diabetes, hiper, convul, id)
                            &&new Consulta().ResPatolo(causaQ, fechaQ, CompQ, fechaA, medicaA, fechaDI, medicDia, compli, fechaHi, medicHI, compliHI, fechaConv, CausaConv, medicConv, compliConv, id)
                            &&new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)
                            &&new Consulta().ResGineco(NoEmba, abortos, Cesareas, CompliEmba, UltimaRe, id)){
                            response.sendRedirect("historial.jsp");
                        }else{
                            response.sendRedirect("inicio.jsp");
                        }
                    }
                }
            }else{/*No embarazo*/
                
            }
       }else{/*Es hombre*/
           
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
