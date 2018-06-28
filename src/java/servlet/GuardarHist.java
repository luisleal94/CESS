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
        
        /*Imnunizacion*/
        String tetano=request.getParameter("tetano");
        String sarampion=request.getParameter("sarampion");
        String rubeola=request.getParameter("rubeola");
        String hepatitis=request.getParameter("hepatitis");
        
        /*Vicios*/
        String toma=request.getParameter("alcol");
        String fuma=request.getParameter("fuma");
        String relacion=request.getParameter("rela");
        String inicio=request.getParameter("inicio1"); //Inicio de beber
        String cantidad=request.getParameter("cantidad1"); //Cuanto beb
        String inicioF=request.getParameter("inicio2"); //Inicio de fumar
        String cantidadF=request.getParameter("cantidad2"); //Cuanto fuma
        String parejas=request.getParameter("parejas");
        String inicioR=request.getParameter("inicio3"); //Inicio de relaciones
        String protec=request.getParameter("proteccion");        
   
        /*Patologicos*/
        String combe=request.getParameter("combe");
        String cirujia=request.getParameter("ciru");
        String alergia=request.getParameter("alergia");
        String diabetes=request.getParameter("diabe");
        String hiper=request.getParameter("hiper");
        String otrosP=request.getParameter("otrosP");
        String textoP=request.getParameter("texto"); //Text area para Patologicos
        
        
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
        
         /*Sistema 1,2*/
        String estomago=request.getParameter("estomago");
        String estre=request.getParameter("estre");
        String freEs=request.getParameter("freEs");//Respuesta de estreñimiento
        String diarrea=request.getParameter("diarrea");
        String freDea=request.getParameter("freDea");//Respuesta Diarrea
        String vomito=request.getParameter("vomito"); 
        String otros3=request.getParameter("otros3");
        String textoSis=request.getParameter("texto3");       
        
        String tos=request.getParameter("tos");
        String pecho=request.getParameter("pecho");
        String otros4=request.getParameter("otros4");
        String texto4=request.getParameter("texto4");        
        
        String ejercicio=request.getParameter("fatiga");
        String cabeza=request.getParameter("dolCab");
        String otros2=request.getParameter("otros2"); 
        String texto2=request.getParameter("texto2");
    
        /*Gineco*/
        String menarca=request.getParameter("menarca");
        String duracionM=request.getParameter("duracion");
        String dolorM=request.getParameter("dolorM");
        String MedicaM=request.getParameter("MedicaM");
        String embara=request.getParameter("embara");
        
        String gestas=request.getParameter("gestas");
        String Partos=request.getParameter("Partos");
        String abortos=request.getParameter("abortos");
        String Cesareas=request.getParameter("Cesareas");
        String CompliEmba=request.getParameter("CompliEmba");
        String UltimaRe=request.getParameter("UltimaRe");
        if(estre.equals("No")){
            freEs="No";
        }
        if(diarrea.equals("No")){
            freDea="No";
        }
        if(otrosP.equals("No")){
            textoP="Ninguno";
        }
        if(otros3.equals("No")){
            textoSis="Ninguno";
        }
        if(otros4.equals("No")){
            texto4="No";
        }
        if(otros2.equals("No")){
            texto2="No";
        }
        if(sexo.equals("Femenino")){         
            if(embara.equals("Si")){                
                if(toma.equals("No")&&fuma.equals("No")&&relacion.equals("No")){
                    if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){                        
                       
                            System.out.println("Es mujer,Si embarazo,No toma,No cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    && new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco(gestas, Partos, abortos, Cesareas, compli, estre, id)
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_2(id, freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }
                                             
                    }else{ //Si cirujia                        
                            System.out.println("Es mujer,Si embarazo,No toma,So cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    && new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco(gestas, Partos, abortos, Cesareas, compli, estre, id)
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(causaQ, fechaQ, CompQ, fechaA, medicaA, fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }
                    }
                }else{ //Si Fuma
                    if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){                        
                      
                            System.out.println("Es mujer,Si embarazo,No toma,No cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec, id)
                                    && new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco(gestas, Partos, abortos, Cesareas, compli, estre, id)
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }
                                               
                    }else{ //Si cirujia                       
                            System.out.println("Es mujer,Si embarazo,No toma,So cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec, id)
                                    && new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco(gestas, Partos, abortos, Cesareas, compli, estre, id)
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(causaQ, fechaQ, CompQ, fechaA, medicaA, fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }                       
                    }
                }
            }else{ //No esta ebarazada
                if(toma.equals("No")&&fuma.equals("No")&&relacion.equals("No")){
                    if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){                        
                      
                            System.out.println("Es mujer,Si embarazo,No toma,No cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    && new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }
                                              
                    }else{ //Si cirujia                        
                            System.out.println("Es mujer,Si embarazo,No toma,So cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    && new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(causaQ, fechaQ, CompQ, fechaA, medicaA, fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }                       
                    }
                }else{ //Si Fuma
                    if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){                        
                      
                            System.out.println("Es mujer,Si embarazo,No toma,No cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec, id)
                                    && new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }                                              
                    }else{ //Si cirujia                       
                            System.out.println("Es mujer,Si embarazo,No toma,So cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec, id)
                                    && new Consulta().Ginecologo(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(causaQ, fechaQ, CompQ, fechaA, medicaA, fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }                       
                    }
                }
            }
        }else{ //Es Hombre
            if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){                        
                      
                            System.out.println("Es mujer,Si embarazo,No toma,No cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec, id)
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }                                               
            }else{ //Si cirujia
                        
                            System.out.println("Es mujer,Si embarazo,No toma,So cirujia,No estreñimiento ");
                            if(new Consulta().historial_NoPato(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema1(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec, id)
                                    &&new Consulta().Patologicos(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(causaQ, fechaQ, CompQ, fechaA, medicaA, fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_2(id,freEs,freDea, textoSis, texto4, texto2)){                
                                request.setAttribute("id",id);
                                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
                                //response.sendRedirect("Consulta.jsp");
                            }else{
                                response.sendRedirect("inicio.jsp");
                            }                       
            }
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
