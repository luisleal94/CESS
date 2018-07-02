package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
           String consulta="select *from PERSONAL where Username=? and PASSWORD=?"; 
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
    public boolean registro(String user,String apellido,String pass,String tele,String Espe,String gerar,String cedula,String username){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into PERSONAL(NOMBRE,APELLIDO,PASSWORD,telefono,Gerarquia,Cedula,Username,Especialidad) values(?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, user);
            pst.setString(2, apellido);
            pst.setString(3, pass);     
            pst.setString(4, tele);
            pst.setString(5, gerar);
            pst.setString(6, cedula);
            pst.setString(7, username);
            pst.setString(8, Espe);
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
        String status="0";
         PreparedStatement pst=null;
         
         try{
            String consulta="insert into Pacientes(fecha,Nombre,Apellido_P,Apellido_M,Edad,telefono,"
                    + "Ocupacion,EstadoC,Domicilio,Curp,Genero,Historial) values(?,?,?,?,?,?,?,?,?,?,?,?)";
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
            pst.setString(12, status);
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
   
    public boolean historial_NoPato(String aseo,String bucal,String ropa,String lacteos,String prote,
            String verdura,String legum,String cereal,String id){
        PreparedStatement pst=null;
        
        try{
             String consulta="insert into NoPatologicos(Aseo,Cepillado,Ropa,Lacteos,Proteinas,"
                    + "Verduras,Cereales,Legumbres,idPaciente) values(?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, aseo);
            pst.setString(2, bucal);
            pst.setString(3, ropa);
            pst.setString(4,lacteos);
            pst.setString(5, prote);           
            pst.setString(6, verdura);
            pst.setString(7, cereal);
            pst.setString(8, legum);
            pst.setString(9, id);
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
    
    public boolean historial_Imnume(String tetano,String saram,String rubeola,String hepatitis,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into Inmune(Tetano,Sarampion,Rubeola,hepatitis,idPaciente)"
                    + " values(?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, tetano);
            pst.setString(2, saram);
            pst.setString(3, rubeola);
            pst.setString(4, hepatitis);
            pst.setString(5, id);
           
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
    
    
    public boolean historial_Sistema1(String estoma,String Vomi,String tos,String pecho,
            String ejercicio,String cabeza,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into Sistema1(DolorEstomago,Nauseas,Tos,"
                + "DolorPecho,Fatiga,DolorCabeza,idPaciente)"
                    + " values(?,?,?,?,?,?,?)";
            
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, estoma);
            pst.setString(2, Vomi);          
            pst.setString(3, tos);
            pst.setString(4, pecho);            
            pst.setString(5, ejercicio);
            pst.setString(6, cabeza);
            pst.setString(7, id);
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
    
    public boolean historial_Sistema1_2(String id,String estre,String diarrea,String tex1,String text2,String text3){
        PreparedStatement pst=null;
        try{
            String consulta="insert into Sistema1_2(Estreñimiento,Diarrea,IdPaciente,Otros2,Otros3,Otros4)"
                    + " values(?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, estre);
            pst.setString(2, diarrea);
            pst.setString(3, id);
            pst.setString(4, tex1);
            pst.setString(5, text2);
            pst.setString(6, text3);
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
    
    public boolean historial_resSistema1_2(String frecEs,String FrecDia,String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into ResSistema1_2(FrecuenciaEstre,FrecuenciaDia,idPaciente)"
                    + " values(?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, frecEs);
            pst.setString(2, FrecDia);
            pst.setString(3, id);
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
            String resR3,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into ResVicios(EdadInicio,CantidadAlco,EdadFum,CigarrosDia,"
                    + "EdadRela,NoParejas,Proteccion,IdPaciente)"
                    + " values(?,?,?,?,?,?,?,?)";
           
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, resT);
            pst.setString(2, resT2);
            pst.setString(3, resF);
            pst.setString(4, resF2);
            pst.setString(5, resR1);
            pst.setString(6, resR2);
            pst.setString(7, resR3);          
            pst.setString(8, id);
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
    
    public boolean Patologicos(String combe,String cirujia,String alergia,String diabetes,String hiper,String texto,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into Patologicos(Combe,Cirujia,Alergia,Diabetico,Hipertenso,OtrosPato,idPaciente)"
                    + " values(?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, combe);
            pst.setString(2, cirujia);
            pst.setString(3, alergia);
            pst.setString(4, diabetes);
            pst.setString(5, hiper);
            pst.setString(6, texto);
            pst.setString(7, id);
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
            String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into ResPatologicos(fechaQ,CausaQ,ComplicacionesQ,"
                    + "FechaA,CuasaA,FechaDia,MedicamentoDia,ComplicacionesDia,CuandoHi,"
                    + "MedicamentoHi,CompliHip,idPacientes)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,?)";
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
            pst.setString(12, id);
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
   
    public boolean ResGineco(String Gestas,String Partos,String Abortos,String Cesareas,String Compli,String ultRe,String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into ResGineco(Gestas,Partos,Abortos,Cesareas,Complicaciones,UltimaRegla,IdPaciente)"
                    + " values(?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, Gestas);
            pst.setString(2,Partos);
            pst.setString(3, Abortos);
            pst.setString(4, Cesareas);
            pst.setString(5, Compli);
            pst.setString(6, ultRe);
            pst.setString(7, id);
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
      
    public boolean GenerarConsulta(String id,String ExploF,String padeci,String diagnos,String Estudios,String gabine,String labora,String tratamiento,String medico
                    ,String Costo,String Tipo,String Nombre,String Demanda,String folio){
        
            String NombreMayus=Nombre.toUpperCase();
            PreparedStatement pst=null;
            Calendar calender = Calendar.getInstance();
            String fecha;
            int dia=calender.get(Calendar.DAY_OF_MONTH);
            int mes=(calender.get(Calendar.MONTH))+1;
            int anio=calender.get(Calendar.YEAR);
            fecha=anio+"-"+mes+"-"+dia;
        try{
            String consulta="insert into Consulta(Fecha,ExploracionF,Padecimiento,Diagnostico,Estudios,Laboratorio,"
                    + "Gabinete,Tratamiento,Medico,Costo,Tipo,Nombre,Demanda,Folio,IdPaciente)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);           
            pst.setString(1, fecha);
            pst.setString(2, ExploF);
            pst.setString(3, padeci);
            pst.setString(4, diagnos);
            pst.setString(5, Estudios);
            pst.setString(6, labora);
            pst.setString(7, gabine);
            pst.setString(8, tratamiento);
            pst.setString(9, medico);
            pst.setString(10, Costo);
            pst.setString(11, Tipo);
            pst.setString(12, NombreMayus);
            pst.setString(13, Demanda);
            pst.setString(14, folio);
            pst.setString(15, id);
            
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
    
    public ArrayList<String> getDiagnostico(String buscar){
        ArrayList<String> nombre= new ArrayList<>();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            String sql="select dec10 from db29179_cie10 where dec10 like ? limit 10";
            pst=getConexion().prepareStatement(sql);
            pst.setString(1,buscar+"%");
            rs=pst.executeQuery();
            while(rs.next()){
                nombre.add(rs.getString("dec10"));
            }
            System.out.println(nombre);
        }catch(Exception e){  
            System.out.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(rs!=null)rs.close();
                if(pst!=null)pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
            }
        }
        return nombre;
    }
   /*public static void main(String[] args){
        Consulta re= new Consulta();
        re.getDiagnostico("Co");
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
        /*re.Ginecologo("Si","1 dia","Si","Paracetamol","No","3");*/
    //}
     
}

