package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

/**
 *
 * @author luis
 */
public class Consulta extends Conexion{
    
    //Metodo para el login del personal CESS
    public boolean login(String usuario, String pass){
        PreparedStatement pst=null;
        ResultSet rs=null;
            
        try{
           String consulta="select *from PERSONAL where NOMBRE=? and PASSWORD=?"; 
           pst = getConexion().prepareStatement(consulta);
           pst.setString(1,usuario);
           pst.setString(2,pass);
           rs=pst.executeQuery();
           
           if(rs.absolute(1)){
               return true;
           }
        }catch(Exception e){
            System.err.println("Error"+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
                if(rs!=null)rs.close();
            }catch(Exception e){
                System.err.println("Error"+e);
            }
        }
        return false;
    }
    
    //Metodo para registro de personal CESS
    public boolean registro(String user,String apellido,String pass){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into PERSONAL(NOMBRE,APELLIDO,PASSWORD) values(?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, user);
            pst.setString(2, apellido);
            pst.setString(3, pass);
            
            if(pst.executeUpdate()==1){
                return true;
            }
        }catch(Exception e){
             System.err.println("Error"+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.err.println("Error"+e);
            }
        }
        return false;
    }
    
    //Metodo para registrar pacientes
    public boolean reg_paciente(String nombre,String apellidoP,String apellidoM,String edad,String tele,
        String ocupacion,String EstadoC,String domicilio,String curp,String genero){
        Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=dia+"-"+mes+"-"+anio;
        System.out.println(fecha);
        
         PreparedStatement pst=null;
         
         try{
            String consulta="insert into Pacientes(fecha,Nombre,Apellido_P,Apellido_M,Edad,telefono,"
                    + "Ocupacion,EstadoC,Domicilio,Curp,Genero) values(?,?,?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, fecha);
            pst.setString(2, nombre);
            pst.setString(3, apellidoP);
            pst.setString(4, apellidoM);
            pst.setString(5, edad);
            pst.setString(6, tele);
            pst.setString(7, ocupacion);
            pst.setString(8, EstadoC);
            pst.setString(9, domicilio);
            pst.setString(10, curp.toUpperCase()); //La covierto a mayuscula
            pst.setString(11, genero);
            if(pst.executeUpdate()==1){
                return true;
            }
        }catch(Exception e){
             System.err.println("Error"+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.err.println("Error"+e);
            }
        }
        
        return false;
    }
    
    //Metodo para registrar historial    
    public boolean historial_fisica(String peso,String talla,String imc,String tem,String FR,String FC,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into ExploracionF(Peso,Talla,IMC,FrecuenciaC,FrecuenciaR,IdPaciente,"
                    + "Temperatura) values(?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            
            pst.setString(1,peso);
            pst.setString(2,talla);
            pst.setString(3,imc);
            pst.setString(4,FR);
            pst.setString(5,FC);
            pst.setString(6,id);
            pst.setString(7,tem);
            if(pst.executeUpdate()==1){
                return true;
            } 
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        
        return false;
    }
   
    public boolean historial_NoPato(String aseo,String bucal,String ropa,String leche,String carne,
            String huevos,String verdura,String legum,String cereal,String id){
        PreparedStatement pst=null;
        
        try{
             String consulta="insert into NoPatologicos(Aseo,Cepillado,Ropa,Leche,Carne,Huevos,"
                    + "Verduras,Cereales,Legumbres,idPaciente) values(?,?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, aseo);
            pst.setString(2, bucal);
            pst.setString(3, ropa);
            pst.setString(4,leche);
            pst.setString(5, carne);
            pst.setString(6, huevos);
            pst.setString(7, verdura);
            pst.setString(8, cereal);
            pst.setString(9, legum);
            pst.setString(10, id);
            if(pst.executeUpdate()==1){
                return true;
            } 
        }catch(Exception e){
             System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean historial_Imnume(String tetano,String saram,String rubeola,String hepatica,String parasito,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into Inmune(Tetano,Sarampion,Hepatica,Rubeola,Desparacitacion,idPaciente)"
                    + " values(?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, tetano);
            pst.setString(2, saram);
            pst.setString(3, hepatica);
            pst.setString(4, rubeola);
            pst.setString(5, parasito);
            pst.setString(6, id);
           
            if(pst.executeUpdate()==1){
                return true;
            } 
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return false;
    }
    
    
    public boolean historial_Sistema1(String estoma,String Vomi,String agru,String tos,String pecho,
            String espalda,String palpitaciones, String ejercicio,String cabeza,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into Sistema1(DolorEstomago,Nauseas,Agruras,Tos,DolorPecho,"
                + "Espalda,Palpitaciones,Fatiga,DolorCabeza,idPaciente)"
                    + " values(?,?,?,?,?,?,?,?,?,?)";
            
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, estoma);
            pst.setString(2, Vomi);
            pst.setString(3, agru);
            pst.setString(4, tos);
            pst.setString(5, pecho);
            pst.setString(6, espalda);
            pst.setString(7, palpitaciones);
            pst.setString(8, ejercicio);
            pst.setString(9, cabeza);
            pst.setString(10, id);
            if(pst.executeUpdate()==1){
                return true;
            }             
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean historial_Vicio(String toma,String fuma,String rela,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into VIcios(Fuma,Toma,Relaciones,idPaciente)"
                    + " values(?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, toma);
            pst.setString(2, fuma);
            pst.setString(3, rela);
            pst.setString(4, id);
            if(pst.executeUpdate()==1){
                return true;
            }             
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return false;
    }
    
    
    public boolean ResVicio(String resT,String resT2,String resF,String resF2,String resR1,String resR2,
            String resR3,String resR4,String resR5,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into ResVicios(EdadInicio,CantidadAlco,EdadFum,CigarrosDia,"
                    + "EdadRela,Frecuencia,NoParejas,Sexoservidoras,Proteccion,IdPaciente)"
                    + " values(?,?,?,?,?,?,?,?,?,?)";
           
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, resT);
            pst.setString(2, resT2);
            pst.setString(3, resF);
            pst.setString(4, resF2);
            pst.setString(5, resR1);
            pst.setString(6, resR2);
            pst.setString(7, resR3);
            pst.setString(8, resR4);
            pst.setString(9, resR5);
            pst.setString(10, id);
            if(pst.executeUpdate()==1){
                return true;
            }             
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean Patologicos(String cirujia,String alergia,String diabetes,String hiper,String convul,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into Patologicos(Cirujia,Alergia,Diabetico,Hipertenso,Convulciones,idPaciente)"
                    + " values(?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, cirujia);
            pst.setString(2, alergia);
            pst.setString(3, diabetes);
            pst.setString(4, hiper);
            pst.setString(5, convul);
            pst.setString(6, id);
            if(pst.executeUpdate()==1){
                return true;
            }             
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return false;
    }
    
    
    public boolean ResPatolo(String causaQ,String fechaQ,String CompQ,String fechaA,String cual,
            String cuandoDA,String medicDA,String compliDA,String cuandoHI,String medicHI,String compliHI,
            String cuandoConv,String causaCon,String medicConv,String compliConv,String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into ResPatologicos(fechaQ,CausaQ,ComplicacionesQ,"
                    + "FechaA,CuasaA,FechaDia,MedicamentoDia,ComplicacionesDia,CuandoHi,"
                    + "MedicamentoHi,CompliDia,FechaCon,CausaCon,MedicamentoCon,ConplicacionCon,idPacientes)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, causaQ);
            pst.setString(2, fechaQ);
            pst.setString(3, CompQ);
            pst.setString(4, fechaA);
            pst.setString(5, cual);
            pst.setString(6, cuandoDA);
            pst.setString(7, medicDA);
            pst.setString(8, compliDA);
            pst.setString(9, cuandoHI);
            pst.setString(10, medicHI);
            pst.setString(11, compliHI);
            pst.setString(12, cuandoConv);
            pst.setString(13, causaCon);
            pst.setString(14, medicConv);
            pst.setString(15, compliConv);
            pst.setString(16, id);
            if(pst.executeUpdate()==1){
                return true;
            }             
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return false;
    }
    
    public boolean Ginecologo(String menarca,String duracion,String dolor,String medica,String Embarazo,String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into Ginecologo(Menarca,Duracion,Dolor,Medicamentos,Embarazo,IdPaciente)"
                    + " values(?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, menarca);
            pst.setString(2, duracion);
            pst.setString(3, dolor);
            pst.setString(4, medica);
            pst.setString(5, Embarazo);
            pst.setString(6, id);
            if(pst.executeUpdate()==1){
                return true;
            }             
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return false;
    }
   
    public boolean ResGineco(String cuantosEm,String Abortos,String Cesareas,String Compli,String ultRe,String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into ResGineco(Cuantos,Abortos,Cesareas,Complicaciones,UltimaRegla,IdPaciente)"
                    + " values(?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, cuantosEm);
            pst.setString(2, Abortos);
            pst.setString(3, Cesareas);
            pst.setString(4, Compli);
            pst.setString(5, ultRe);
            pst.setString(6, id);
            if(pst.executeUpdate()==1){
                return true;
            }             
        }catch(Exception e){
            System.out.println("Error "+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
       return false; 
    }
        
    /*public static void main(String[] args){
        Consulta re= new Consulta();
        //re.registro("jose luis","Rosas Leal","1234");
        //re.reg_paciente("Eduardo","Rosas","Leal","21","1234","Ingeniero","Soltero","Tapicer","roll940909","masculino");
        
        /*re.reg_historial("6", "veracruz","La loma","catolica","licenciatura",
                "gym", "nose","perros", "A+","si");*/
        
        /*re.historial_texto("8", "ninguno","Alergia al tapcin", "Ninguno", "lleso en el "
                + "brazo izquierdo", "rayos x", "Estiramiento");*/
        /*re.historial_fisica("68","1.78","24.5","36","86xseg","60xSeg","1");*/
        
        /*re.historial_NoPato("2", "3","5","3","3","4","6","8","6","1");*/
        
        /*re.historial_Imnume("24/54", "11/18", "25/18", "31/18","05/78","1");*/
        /*re.historial_Sistema1("si", "No","Si","No","No", "si","NO","SI","NO","1");*/
        /*re.Ginecologo("Si","1 dia","Si","Paracetamol","No","3");
    }*/
     
}

