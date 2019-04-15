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
public class HistorialNuevo extends HttpServlet {

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
        String id=request.getParameter("id");
        String sexo=request.getParameter("sexo");
        System.out.println(id+" - "+sexo);
        
        String abueloP0=request.getParameter("AbueloP0");
        String abueloP1=request.getParameter("AbueloP1");
        String abueloP2=request.getParameter("AbueloP2");
        String abueloP3=request.getParameter("AbueloP3");
        String abueloP4=request.getParameter("AbueloP4");
        String abueloP5=request.getParameter("AbueloP5");
        String abueloP6=request.getParameter("AbueloP6");
        String abueloP7=request.getParameter("AbueloP7");
        String abueloP8=request.getParameter("AbueloP8");
        String abueloP9=request.getParameter("AbueloP9");
        String abueloP10=request.getParameter("AbueloP10");        
        
        String AbuelaP0=request.getParameter("AbuelaP0");
        String AbuelaP1=request.getParameter("AbuelaP1");
        String AbuelaP2=request.getParameter("AbuelaP2");
        String AbuelaP3=request.getParameter("AbuelaP3");
        String AbuelaP4=request.getParameter("AbuelaP4");
        String AbuelaP5=request.getParameter("AbuelaP5");
        String AbuelaP6=request.getParameter("AbuelaP6");
        String AbuelaP7=request.getParameter("AbuelaP7");
        String AbuelaP8=request.getParameter("AbuelaP8");
        String AbuelaP9=request.getParameter("AbuelaP9");
        String AbuelaP10=request.getParameter("AbuelaP10");
        
        String AbueloMa0=request.getParameter("AbueloMa0");
        String AbueloMa1=request.getParameter("AbueloMa1");
        String AbueloMa2=request.getParameter("AbueloMa2");
        String AbueloMa3=request.getParameter("AbueloMa3");
        String AbueloMa4=request.getParameter("AbueloMa4");
        String AbueloMa5=request.getParameter("AbueloMa5");       
        String AbueloMa6=request.getParameter("AbueloMa6");
        String AbueloMa7=request.getParameter("AbueloMa7");
        String AbueloMa8=request.getParameter("AbueloMa8");
        String AbueloMa9=request.getParameter("AbueloMa9");
        String AbueloMa10=request.getParameter("AbueloMa10");
        
        String AbuelaMa1=request.getParameter("AbuelaMa1");
        String AbuelaMa2=request.getParameter("AbuelaMa2");
        String AbuelaMa3=request.getParameter("AbuelaMa3");
        String AbuelaMa4=request.getParameter("AbuelaMa4");
        String AbuelaMa5=request.getParameter("AbuelaMa5");
        String AbuelaMa6=request.getParameter("AbuelaMa6");
        String AbuelaMa7=request.getParameter("AbuelaMa7");
        String AbuelaMa8=request.getParameter("AbuelaMa8");
        String AbuelaMa9=request.getParameter("AbuelaMa9");
        String AbuelaMa10=request.getParameter("AbuelaMa10");
        String AbuelaMa11=request.getParameter("AbuelaMa11");
        
        String Padre0=request.getParameter("Padre0");
        String Padre1=request.getParameter("Padre1");
        String Padre2=request.getParameter("Padre2");
        String Padre3=request.getParameter("Padre3");
        String Padre4=request.getParameter("Padre4");
        String Padre5=request.getParameter("Padre5");
        String Padre6=request.getParameter("Padre6");
        String Padre7=request.getParameter("Padre7");
        String Padre8=request.getParameter("Padre8");
        String Padre9=request.getParameter("Padre9");
        String Padre10=request.getParameter("Padre10");
        
        String Madre0=request.getParameter("Madre0");
        String Madre1=request.getParameter("Madre1");
        String Madre2=request.getParameter("Madre2");
        String Madre3=request.getParameter("Madre3");
        String Madre4=request.getParameter("Madre4");
        String Madre5=request.getParameter("Madre5");
        String Madre6=request.getParameter("Madre6");
        String Madre7=request.getParameter("Madre7");
        String Madre8=request.getParameter("Madre8");
        String Madre9=request.getParameter("Madre9");
        String Madre10=request.getParameter("Madre10");
        
        
        String Hermanos0=request.getParameter("Hermanos0");
        String Hermanos1=request.getParameter("Hermanos1");
        String Hermanos2=request.getParameter("Hermanos2");
        String Hermanos3=request.getParameter("Hermanos3");
        String Hermanos4=request.getParameter("Hermanos4");
        String Hermanos5=request.getParameter("Hermanos5");
        String Hermanos6=request.getParameter("Hermanos6");
        String Hermanos7=request.getParameter("Hermanos7");
        String Hermanos8=request.getParameter("Hermanos8");
        String Hermanos9=request.getParameter("Hermanos9");
        String Hermanos10=request.getParameter("Hermanos10");
        
        String Tios0=request.getParameter("Tios0");
        String Tios1=request.getParameter("Tios1");
        String Tios2=request.getParameter("Tios2");
        String Tios3=request.getParameter("Tios3");
        String Tios4=request.getParameter("Tios4");
        String Tios5=request.getParameter("Tios5");
        String Tios6=request.getParameter("Tios6");
        String Tios7=request.getParameter("Tios7");
        String Tios8=request.getParameter("Tios8");
        String Tios9=request.getParameter("Tios9");
        String Tios10=request.getParameter("Tios10");
        
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
        String ResTetano=request.getParameter("ResTetano");
        String tetano=request.getParameter("tetano");
        if(ResTetano.equals("No")){
            tetano="No";
        }
        String ResSaram=request.getParameter("ResSaram");
        String sarampion=request.getParameter("sarampion");
        if(ResSaram.equals("No")){
            sarampion="No";
        }
        String ResRubeo=request.getParameter("ResRubeo");
        String rubeola=request.getParameter("rubeola");
        if(ResRubeo.equals("No")){
            rubeola="No";
        }
        String ResANTI=request.getParameter("ResANTI");
        String hepatitis=request.getParameter("hepatitis");
        if(ResANTI.equals("No")){
            hepatitis="No";
        }
        
        /*Vicios*/
        String toma=request.getParameter("alcol");
        String fuma=request.getParameter("fuma");
        String relacion=request.getParameter("rela");
        String inicio=request.getParameter("inicio1"); //Inicio de beber
        String cantidad=request.getParameter("cantidad1"); //Cuanto beb
        String inicioF=request.getParameter("inicio2"); //Inicio de fumar
        String cantidadF=request.getParameter("cantidad2"); //Cuanto fuma
        String inicioR=request.getParameter("inicio3"); //Inicio de relaciones
        String parejas=request.getParameter("parejas");       
        String protec=request.getParameter("proteccion");
        String metodo=request.getParameter("anticonceptivo");        
        String NombreAnticon=request.getParameter("NombreAnticon");
        System.out.println(inicio+cantidad+inicioF+cantidadF+parejas+inicioR+protec+NombreAnticon);
        
        String Beber=request.getParameter("Beber");
        String Fumar=request.getParameter("Fumar");
        String Relaciones=request.getParameter("Relaciones");
        /*Patologicos*/
        String combe=request.getParameter("combe");
        String cirujia=request.getParameter("ciru");
        String alergia=request.getParameter("alergia");
        String diabetes=request.getParameter("diabe");
        String hiper=request.getParameter("hiper");
        String otrosP=request.getParameter("otrosP");
        String textoP=request.getParameter("texto"); //Text area para Patologicos  
        
        String Diabetico=request.getParameter("Diabetico");
        String Hipertenso=request.getParameter("Hipertenso");
        
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
        
        
        String Cirujias=request.getParameter("CantidadC");
        String Alergias=request.getParameter("CantidadA");
        //Obtengo el total de los inputs nuevos
        String Valor1=request.getParameter("Valor1");
        String Valor2=request.getParameter("Valor2");
        System.out.println("Cantidad: "+Cirujias+" Alergias:"+Alergias);
        System.out.println("Valor1: "+Valor1+" Valor2:"+Valor2);
        
        if(Valor1!=""){
            System.out.println("Se agregaon nuevas cirujias");
            int Q=Integer.parseInt(Valor1);
            int res=Q*3;
            int a=0;
            String [] inputQ=new String[res];
            for(int i=1;i<Q+1;i++){
                for(int j=0;j<3;j++){
                    inputQ[a]=request.getParameter("idQ"+i+(j+1));
                    a+=1;
                }
            }
            int ContarQ=Integer.parseInt(Cirujias)*3;
            a=ContarQ;            
            for(int j=ContarQ;j<(Q*3);j+=3){
                System.out.println("Entro");
                System.out.println(inputQ[j]+" " +inputQ[j+1]+" "+inputQ[j+2]);
                new Consulta().Cirujia(inputQ[a],inputQ[a+1],inputQ[a+2],id);
                a+=3;
            }
            //System.out.println(a); 
        } 
        if(Valor2!=""){
            System.out.println("Se agregaon nuevas alergias");
            int A=Integer.parseInt(Valor2);
            int res=A*2;
            int a=0;
            String [] inputA=new String[res];
            for(int i=1;i<A+1;i++){
                for(int j=0;j<2;j++){
                    inputA[a]=request.getParameter("idA"+i+(j+1));
                    a+=1;
                }               
            }        
            System.out.println("Dato optenido: "+Valor2);    
            //int contarA=Integer.parseInt(Valor2);
            //a=contarA*2;    
            a=0;
            //for(int j=contarA;j<(A*2);j+=2){
            //    System.out.println(inputA[j]+" " +inputA[j+1]);              
            //    new Consulta().Alergia(inputA[a],inputA[a+1], id);
            //    a+=2;
            //}
            for(int j=0;j<A;j++){
                //System.out.println(inputA[a]+" " +inputA[a+1]);              
                new Consulta().Alergia(inputA[a],inputA[a+1], id);
                //System.out.println();
                a+=2;
            }
        }
        
        System.out.println("Cirujias editadas");
        if(Cirujias!=""){
            int Q=Integer.parseInt(Cirujias);
            int res=Q*3;
            int a=0;
            String [] IdC=new String[res];
            String [] Fechas=new String[res];
            String [] Motivos=new String[res];
            String [] Tipo=new String[res];
            for(int i=0;i<Q;i++){
                //for(int j=0;j<3;j++){
                    IdC[i]=request.getParameter("Id"+i);
                    Fechas[i]=request.getParameter("Fechas"+i);
                    Motivos[i]=request.getParameter("Motivo"+i);
                    Tipo[i]=request.getParameter("Tipo"+i);
            }
            a=0; 
            for(int i=0;i<Q;i++){
                if(Fechas[i]==null){
                    System.out.println("Se elimino");
                    System.out.println(IdC[i]+" "+Fechas[i]+" "+Motivos[i]+" "+Tipo[i]);
                    new Consulta().Cirujia3(IdC[i]);
                }else{
                    System.out.println(IdC[i]+" "+Fechas[i]+" "+Motivos[i]+" "+Tipo[i]);
                    new Consulta().Cirujia2(Fechas[i],Motivos[i],Tipo[i],IdC[i]);
                }
            }            
            //System.out.println(a);  
        }
        System.out.println("Alergias editadas");
        if(Alergias!=""){
            System.out.println("Entro en edicion de alergias: "+Alergias);
            int A=Integer.parseInt(Alergias);
            int res=A*3;
            String [] IdC=new String[A];
            String [] Fechas=new String[A];
            String [] Motivos=new String[A];
            for(int i=0;i<A;i++){
                //for(int j=0;j<3;j++){
                    IdC[i]=request.getParameter("AID"+i);
                    Fechas[i]=request.getParameter("AFecha"+i);
                    Motivos[i]=request.getParameter("ACausa"+i);
            }
            System.out.println("Cantidad de fechas: "+Fechas.length);
            for(int i=0;i<A;i++){
                if(Fechas[i]==null){
                    System.out.println("Se elimino: "+IdC[i]+" "+Fechas[i]+" "+Motivos[i]);
                    new Consulta().Alergia3(IdC[i]);
                }else{
                    System.out.println("Se actualizo: "+IdC[i]+" "+Fechas[i]+" "+Motivos[i]);
                    new Consulta().Alergia2(Fechas[i],Motivos[i],IdC[i]);
                }
            }            
            //System.out.println(a);  
        }
        
       
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
        
        
       new Consulta().Acutaliza_Fecha(id);
        if(sexo.equals("Femenino")){ 
            if(embara.equals("Si")){    
                if(toma.equals("No")&&fuma.equals("No")&&relacion.equals("No")){
                    if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 1");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 2");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                        && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                        && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 3");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }                            
                        }
                    }else{//Fuma
                        if(Beber.equals("Si")||Fumar.equals("Si")||Relaciones.equals("Si")){
                            if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 4");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 5");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                        &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                        && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                        && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 6");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                                    }else{
                                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                        out.println("<script>");
                                        out.println("$(document).ready(function(){");
                                        out.println("swal ('Oops','Error en el proceso','error')");
                                        out.println("});");
                                        out.println("</script>");
                                        RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                        rd.include(request, response);
                                    }
                                }                            
                            }
                        }else{
                            if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 7");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 8");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                        &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                        && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                        && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 9");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)                                    
                                    && new Consulta().ResGineco2(gestas, Partos, abortos, Cesareas, CompliEmba, UltimaRe, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                    }else{
                                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                        out.println("<script>");
                                        out.println("$(document).ready(function(){");
                                        out.println("swal ('Oops','Error en el proceso','error')");
                                        out.println("});");
                                        out.println("</script>");
                                        RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                        rd.include(request, response);
                                    }
                                }                            
                            }
                        }                        
                    }
                }else{ //No ha estado embarazada
                    if(toma.equals("No")&&fuma.equals("No")&&relacion.equals("No")){
                        if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 10");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 11");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                        && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)  
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 12");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)           
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
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
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }                            
                        }
                    }else{//Fuma
                        if(Beber.equals("Si")||Fumar.equals("Si")||Relaciones.equals("Si")){
                            if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 13");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    &&new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)  
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)
                                    ){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 14");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                        &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                        && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id) 
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 15");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)  
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                                    }else{
                                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                        out.println("<script>");
                                        out.println("$(document).ready(function(){");
                                        out.println("swal ('Oops','Error en el proceso','error')");
                                        out.println("});");
                                        out.println("</script>");
                                        RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                        rd.include(request, response);
                                    }
                                }                            
                            }
                        }else{
                            if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 16");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)  
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 17");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                        &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                        && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id) 
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 18");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    && new Consulta().Ginecologo2(menarca, duracionM, dolorM, MedicaM, embara, id)   
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                                    }else{
                                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                        out.println("<script>");
                                        out.println("$(document).ready(function(){");
                                        out.println("swal ('Oops','Error en el proceso','error')");
                                        out.println("});");
                                        out.println("</script>");
                                        RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                        rd.include(request, response);
                                    }
                                }                            
                            }
                        }                        
                    }
                }
            }else{  //Es hombre
                 //No ha estado embarazada
                    if(toma.equals("No")&&fuma.equals("No")&&relacion.equals("No")){
                        if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 19");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 20");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id) 
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 21");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)           
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }                            
                        }
                    }else{//Fuma
                        if(Beber.equals("Si")||Fumar.equals("Si")||Relaciones.equals("Si")){
                            if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 22");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                               out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 23");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                        &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 24");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio2(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                                    }else{
                                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                        out.println("<script>");
                                        out.println("$(document).ready(function(){");
                                        out.println("swal ('Oops','Error en el proceso','error')");
                                        out.println("});");
                                        out.println("</script>");
                                        RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                        rd.include(request, response);
                                    }
                                }                            
                            }
                        }else{
                            if(cirujia.equals("No")&&alergia.equals("No")&&diabetes.equals("No")&&hiper.equals("No")){
                            System.out.println("Entro 25");
                            if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().historial_Sistema1_22(id, freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }else{
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Oops','Error en el proceso','error')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                            }
                        }else{
                            if(Diabetico.equals("Si")||Hipertenso.equals("Si")){
                                System.out.println("Entro 26");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                        && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                        && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                        && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                        &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                        &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                        &&new Consulta().ResPatolo2(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                        &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                        &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                        && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                        && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                        && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                        && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                        && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                        && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                        && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Correcto','Actualización exitosa','success')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }else{
                                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                    out.println("<script>");
                                    out.println("$(document).ready(function(){");
                                    out.println("swal ('Oops','Error en el proceso','error')");
                                    out.println("});");
                                    out.println("</script>");
                                    RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                    rd.include(request, response);
                                }
                            }else{
                                System.out.println("Entro 27");
                                if(new Consulta().historial_NoPato2(aseo, bucal, ropa, leche,carne, verdura, legumbre, cereal, id)
                                    && new Consulta().historial_Imnume2(tetano, sarampion, rubeola, hepatitis, id)
                                    && new Consulta().historial_Sistema12(estomago, vomito, tos, pecho, ejercicio, cabeza, id)
                                    && new Consulta().historial_Vicio2(toma, fuma, relacion, id)
                                    &&new Consulta().ResVicio(inicio,cantidad,inicioF,cantidadF,inicioR,parejas,protec,NombreAnticon, id)
                                    &&new Consulta().Patologicos2(combe,cirujia, alergia, diabetes, hiper,textoP, id)
                                    &&new Consulta().ResPatolo(fechaDI, medicDia, compli, fechaHi, medicHI, compliHI,id)
                                    &&new Consulta().historial_Sistema1_22(id,freEs,freDea, textoSis, texto4, texto2)
                                    &&new Consulta().AbueloPa2(abueloP0,abueloP1,abueloP2,abueloP3,abueloP4,abueloP5,abueloP6,abueloP7,abueloP8,abueloP9,abueloP10,id,1)
                                    && new Consulta().AbueloPa2(AbuelaP0,AbuelaP1,AbuelaP2,AbuelaP3,AbuelaP4,AbuelaP5,AbuelaP6,AbuelaP7,AbuelaP8,AbuelaP9,AbuelaP10,id,2)
                                    && new Consulta().AbueloPa2(AbueloMa0,AbueloMa1,AbueloMa2,AbueloMa3,AbueloMa4,AbueloMa5,AbueloMa6,AbueloMa7,AbueloMa8,AbueloMa9,AbueloMa10,id,3)
                                    && new Consulta().AbueloPa2(AbuelaMa1,AbuelaMa2,AbuelaMa3,AbuelaMa4,AbuelaMa5,AbuelaMa6,AbuelaMa7,AbuelaMa8,AbuelaMa9,AbuelaMa10,AbuelaMa11,id,4)
                                    && new Consulta().AbueloPa2(Padre0,Padre1,Padre2,Padre3,Padre4,Padre5,Padre6,Padre7,Padre8,Padre9,Padre10,id,7)
                                    && new Consulta().AbueloPa2(Madre0,Madre1,Madre2,Madre3,Madre4,Madre5,Madre6,Madre7,Madre8,Madre9,Madre10,id,6)
                                    && new Consulta().AbueloPa2(Hermanos0,Hermanos1,Hermanos2,Hermanos3,Hermanos4,Hermanos5,Hermanos6,Hermanos7,Hermanos8,Hermanos9,Hermanos10,id,5)
                                    && new Consulta().AbueloPa2(Tios0,Tios1,Tios2,Tios3,Tios4,Tios5,Tios6,Tios7,Tios8,Tios9,Tios10,id,8)){                
                                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                out.println("<script>");
                                out.println("$(document).ready(function(){");
                                out.println("swal ('Correcto','Actualización exitosa','success')");
                                out.println("});");
                                out.println("</script>");
                                RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                rd.include(request, response);
                                    }else{
                                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                                        out.println("<script>");
                                        out.println("$(document).ready(function(){");
                                        out.println("swal ('Oops','Error en el proceso','error')");
                                        out.println("});");
                                        out.println("</script>");
                                        RequestDispatcher rd=request.getRequestDispatcher("CessSuper.jsp");
                                        rd.include(request, response);
                                    }
                                }                            
                            }
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
