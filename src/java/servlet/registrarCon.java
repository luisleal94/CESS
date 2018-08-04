package servlet;

import Controlador.Consulta;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registrarCon extends HttpServlet {

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        /**************************************/       
        String pediatra=request.getParameter("pediatra");
        String Ginecologia=request.getParameter("Ginecologia");
        String Gastro=request.getParameter("Gastro");
        String Neuro=request.getParameter("Neuro");
        
        String Trauma=request.getParameter("Trauma");
        String Endocri=request.getParameter("Endocri");
        String Geriatria=request.getParameter("Geriatria");
        String Urolo=request.getParameter("Urolo");
        
        String Otorri=request.getParameter("Otorri");
        String Gene=request.getParameter("Gene");
        String Psiqui=request.getParameter("Psiqui");
        String Cardio=request.getParameter("Cardio");
        
        String Olfta=request.getParameter("Olfta");
        String Neomo=request.getParameter("Neomo");
        String Nefro=request.getParameter("Nefro");
        String Hemato=request.getParameter("Hemato");
        
        String Vascular=request.getParameter("Vascular");
        String inmuno=request.getParameter("inmuno");
        
        System.out.println(pediatra);
        System.out.println(Trauma);
        /***********************************/
         String idDoc=request.getParameter("IdDoctor");
        String id=request.getParameter("id");  //Id del paciente
        String NombrePaci=request.getParameter("NombrePaci");
        String peso=request.getParameter("peso");
        String talla=request.getParameter("talla");
        String imc=request.getParameter("imc");
        String temp=request.getParameter("temp");
        String fc=request.getParameter("fc");
        String fr=request.getParameter("fr");
        String presion=request.getParameter("PresionArterial");
        String padeci=request.getParameter("padeci");
        String explo=request.getParameter("exploracion");
        String diagnos=request.getParameter("Diagnos");
        String canali=request.getParameter("canali");// Canalizacion?
        String gabinete=request.getParameter("gabinete");  //Gabinete
        String ResGabi=request.getParameter("ResGabi");  //Si gabinete
        String laboratorio=request.getParameter("laboratorio"); //Laboratorio?
        String Reslabora=request.getParameter("Reslabora"); //SI laboratirio
        String tratamiento=request.getParameter("tratamiento");  
        String medico=request.getParameter("Doctor");
        String costo=request.getParameter("Costo");
        String tipo=request.getParameter("Tipo");
        String Demanda=request.getParameter("Demanda");
        String folio=request.getParameter("folio");
        String Especialidad=request.getParameter("Especialidad");
        double altura=Double.parseDouble(talla)/100;
        double IMC=Double.parseDouble(peso)/(altura*altura);
        DecimalFormat formato= new DecimalFormat("#.00");
        System.out.println(formato.format(IMC));
        System.out.println(NombrePaci);
        System.out.println(Especialidad);
        if(canali.equals("No")){
            ResGabi="Ninguno";
            Reslabora="Ninguno";
        }       
        else{
            if(gabinete.equals("No")){
                ResGabi="Ninguno";
            }
            if(laboratorio.equals("No")){
                Reslabora="Ninguno";
            }
        }
        System.out.println(medico);
        Consulta con= new Consulta();
        if(con.GenerarConsulta(id, explo, padeci, diagnos, canali, ResGabi, Reslabora, tratamiento, medico,costo,tipo,NombrePaci,Demanda,folio,Especialidad,idDoc)
            && new Consulta().historial_fisica(peso, talla,formato.format(IMC), temp, fr, fc, presion, id)
            && new Consulta().referencias(pediatra, Ginecologia, Gastro, Neuro, Trauma, Endocri, Geriatria, Urolo, Otorri, Gene, Psiqui, Cardio, Olfta, Neomo, 
                    Nefro, Hemato, Vascular, inmuno, id)){
            request.setAttribute("id",id);
            request.getRequestDispatcher("Receta.jsp").forward(request, response);
        }else{
            response.sendRedirect("CessSuper.jsp");
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
