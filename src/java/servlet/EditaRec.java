package servlet;

import Controlador.Consulta;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author luis
 */
public class EditaRec extends HttpServlet {
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        Consulta con =new Consulta();
        String id=request.getParameter("ID");
        String IdMedico=request.getParameter("Doctor");
        String fecha=request.getParameter("Fecha");
        String Cantidad=request.getParameter("CantR");
        String Valor2=request.getParameter("Valor");
        
        if(Valor2!=""){
            System.out.println("Se agregaon nuevos medicamentos");
            int Q=Integer.parseInt(Valor2);
            int res=Q*9;
            int a=0;
            String [] inputQ=new String[res];
            for(int i=1;i<Q+1;i++){
                for(int j=0;j<9;j++){
                    inputQ[a]=request.getParameter("idM"+i+(j+1));
                    a+=1;
                }
            }
            int ContarM=Integer.parseInt(Cantidad)*9;
            a=ContarM;            
            for(int j=ContarM;j<(Q*9);j+=9){
                System.out.println(inputQ[j]+" " +inputQ[j+1]+" "+inputQ[j+2]+" "+inputQ[j+3]+" "+inputQ[j+4]+" "+inputQ[j+5]
                            +" "+inputQ[j+6]+" "+inputQ[j+7]+" "+inputQ[j+8]);
                new Consulta().Receta(inputQ[j],inputQ[j+1],inputQ[j+2],inputQ[j+3], 
                        inputQ[j+4], inputQ[j+5],inputQ[j+6],inputQ[j+7],inputQ[j+8],IdMedico,id,fecha);
                a+=3;
            }
            //System.out.println(a); 
        }
        System.out.println("Medicamentos editados");
        if(Cantidad!=""){
            int Q=Integer.parseInt(Cantidad);
            int res=Q*9;
            int a=0;
            String [] IdMe=new String[res];
            String [] Medi=new String[res];
            String [] Farma=new String[res];
            String [] Uni=new String[res];
            String [] Admin=new String[res];
            String [] Pres=new String[res];
            String [] Piez=new String[res];
            String [] Dos=new String[res];
            String [] Cad=new String[res];
            String [] Dia=new String[res];
            for(int i=0;i<Q;i++){
                //for(int j=0;j<3;j++){
                    IdMe[i]=request.getParameter("Id"+i);
                    Medi[i]=request.getParameter("Medic"+i);
                    Farma[i]=request.getParameter("Farm"+i);
                    Uni[i]=request.getParameter("Unid"+i);
                    Admin[i]=request.getParameter("Admin"+i);
                    Pres[i]=request.getParameter("Pres"+i);
                    Piez[i]=request.getParameter("Piez"+i);
                    Dos[i]=request.getParameter("Dos"+i);
                    Cad[i]=request.getParameter("Cad"+i);
                    Dia[i]=request.getParameter("Dia"+i);
            }
            a=0; 
            for(int i=0;i<Q;i++){
                if(Medi[i]==null){
                    System.out.println("Se elimino");
                    System.out.println(IdMe[i]+" "+Medi[i]+" "+Farma[i]+" "+Uni[i]+" "+Admin[i]+" "+
                            Pres[i]+" "+Piez[i]+" "+Dos[i]+" "+Cad[i]+" "+Dia[i]);
                    new Consulta().Receta3(IdMe[i]);
                }else{
                    System.out.println("Se edito");
                    System.out.println(IdMe[i]+" "+Medi[i]+" "+Farma[i]+" "+Uni[i]+" "+Admin[i]+" "+
                            Pres[i]+" "+Piez[i]+" "+Dos[i]+" "+Cad[i]+" "+Dia[i]);
                    new Consulta().Receta2(Medi[i],Farma[i],Uni[i],Admin[i],Pres[i],Piez[i],Dos[i],
                            Cad[i],Dia[i],IdMe[i]);
                }
            }            
            //System.out.println(a);  
        }
        
        String path = getServletContext().getRealPath("/Recet_1.jasper");
        Map parameter =new HashMap();  
        File reporfile=new File(getServletContext().getRealPath("/Recet_1.jasper"));
        parameter.put("Paciente",new String(id));        
        parameter.put("Medico",new String(IdMedico));      
        parameter.put("Fecha",new String(fecha));
        System.out.println(path);
        byte[] bytes;
        try {
            bytes = JasperRunManager.runReportToPdf(reporfile.getPath(), parameter,con.getConexion());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream=response.getOutputStream();
            outputstream.write(bytes,0,bytes.length);
            outputstream.flush();
            outputstream.close();
        } catch (JRException ex) {
            Logger.getLogger(GuardaReceta2.class.getName()).log(Level.SEVERE, null, ex);
             System.out.println("Error: "+ex);
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
