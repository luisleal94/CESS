package Controlador;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.digest.DigestUtils;
import servlet.Respaldo;
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
            pst.setString(7, username.toUpperCase());
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
        
    public boolean ActualizaConta(String user,String pass,String id){
        PreparedStatement pst=null;       
        try{
            String consulta="Update PERSONAL set PASSWORD= ? where ID_USER = ?";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, pass);       
            pst.setString(2, id);
            if(pst.executeUpdate()==1){
                return true;
            }
        }catch(Exception e){
             System.out.println("Error "+e);
        }finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error "+e);
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
        fecha=anio+"-"+mes+"-"+dia;
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
    public boolean historial_fisica(String peso,String talla,String imc,String tem,String FR,String FC,String Presion,String id,String Doc){
        PreparedStatement pst=null;
        Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=anio+"-"+mes+"-"+dia;
        try{
            String consulta="insert into ExploracionF(Peso,Talla,IMC,FrecuenciaC,FrecuenciaR,Temperatura,"
                    + "PresionArterial,Fecha,IdPaciente,IdMedico) values(?,?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            
            pst.setString(1,peso);
            pst.setString(2,talla);
            pst.setString(3,imc);
            pst.setString(4,FR);
            pst.setString(5,FC);
            pst.setString(6,tem);
            pst.setString(7,Presion);
            pst.setString(8,fecha);
            pst.setString(9,id);
            pst.setString(10,Doc);
            
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
            String resR3,String metodo,String id){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into ResVicios(EdadInicio,CantidadAlco,EdadFum,CigarrosDia,"
                    + "EdadRela,NoParejas,Proteccion,Anticonceptivo,IdPaciente)"
                    + " values(?,?,?,?,?,?,?,?,?)";
           
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, resT);
            pst.setString(2, resT2);
            pst.setString(3, resF);
            pst.setString(4, resF2);
            pst.setString(5, resR1);
            pst.setString(6, resR2);
            pst.setString(7, resR3);
            pst.setString(8, metodo);
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
    
    
    public boolean ResPatolo(String cuandoDA,String medicDA,String compliDA,String cuandoHI,String medicHI,String compliHI,
            String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into ResPatologicos(FechaDia,MedicamentoDia,ComplicacionesDia,CuandoHi,"
                    + "MedicamentoHi,CompliHip,idPacientes)"
                    + " values(?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);            
            pst.setString(1, cuandoDA);
            pst.setString(2, medicDA);
            pst.setString(3, compliDA);
            pst.setString(4, cuandoHI);
            pst.setString(5, medicHI);
            pst.setString(6, compliHI);            
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
                    ,String Costo,String Tipo,String Nombre,String Demanda,String folio,String Especialidad,String doc){
        
            //String NombreMayus=Nombre.toUpperCase();            
            PreparedStatement pst=null;
            Calendar calender = Calendar.getInstance();
            String fecha;
            int dia=calender.get(Calendar.DAY_OF_MONTH);
            int mes=(calender.get(Calendar.MONTH))+1;
            int anio=calender.get(Calendar.YEAR);
            fecha=anio+"-"+mes+"-"+dia;
        try{
            String consulta="insert into Consulta(Fecha,ExploracionF,Padecimiento,Diagnostico,Estudios,Laboratorio,"
                    + "Gabinete,Tratamiento,Medico,Costo,Tipo,Nombre,Demanda,Folio,Especialidad,IdPaciente,IdMedico)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            pst.setString(12, Nombre);
            pst.setString(13, Demanda);
            pst.setString(14, folio);
            pst.setString(15, Especialidad);            
            pst.setString(16, id);
            pst.setString(17, doc);
            
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
    
    public boolean EliminaCon(String Id,String Medico,String fecha){
        PreparedStatement pst=null;
         try{
            String consulta="Delete from Consulta where IdPaciente=? and IdMedico=? and Fecha=?";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, Id);
            pst.setString(2,Medico);
            pst.setString(3, fecha);
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
    
    public boolean AbueloPa(String Viv,String DM,String hta, String neoplas,String obesi,String tbp,
            String cardio,String alergi,String formac,String toxico,String cancer,String id,int tipo){
        PreparedStatement pst=null;
        try{
            String consulta="";
            if(tipo==1){
                consulta="insert into AbueloPa(Vive,DM,HTA,Neoplasia,Obesidad,TBP,Cardiopatias,"
                    + "Alergias,Formaciones,Toxicomanias,Cancer,IdPaciente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            }
            if(tipo==2){
                consulta="insert into AbuelaPa(Vive,DM,HTA,Neoplasia,Obesidad,TBP,Cardiopatias,"
                    + "Alergias,Formaciones,Toxicomanias,Cancer,IdPaciente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            } 
            if(tipo==3){
                consulta="insert into AbueloMa(Vive,DM,HTA,Neoplasia,Obesidad,TBP,Cardiopatias,"
                    + "Alergias,Formaciones,Toxicomanias,Cancer,IdPaciente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            }
            if(tipo==4){
                consulta="insert into AbuelaMa(Vive,DM,HTA,Neoplasia,Obesidad,TBP,Cardiopatias,"
                    + "Alergias,Formaciones,Toxicomanias,Cancer,IdPaciente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            }
            if(tipo==5){
                consulta="insert into Hermanos(Vive,DM,HTA,Neoplasia,Obesidad,TBP,Cardiopatias,"
                    + "Alergias,Formaciones,Toxicomanias,Cancer,IdPaciente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            }
            if(tipo==6){
                consulta="insert into Madre(Vive,DM,HTA,Neoplasia,Obesidad,TBP,Cardiopatias,"
                    + "Alergias,Formaciones,Toxicomanias,Cancer,IdPaciente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            }
            if(tipo==7){
                consulta="insert into Padre(Vive,DM,HTA,Neoplasia,Obesidad,TBP,Cardiopatias,"
                    + "Alergias,Formaciones,Toxicomanias,Cancer,IdPaciente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            }
            if(tipo==8){
                consulta="insert into Tios(Vive,DM,HTA,Neoplasia,Obesidad,TBP,Cardiopatias,"
                    + "Alergias,Formaciones,Toxicomanias,Cancer,IdPaciente) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            }
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1,Viv);
            pst.setString(2,DM);
            pst.setString(3,hta);
            pst.setString(4,neoplas);
            pst.setString(5,obesi);
            pst.setString(6,tbp);
            pst.setString(7,cardio);
            pst.setString(8,alergi);
            pst.setString(9,formac);
            pst.setString(10,toxico);
            pst.setString(11,cancer);
            pst.setString(12,id);
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
    
    public boolean Cirujia(String fecha,String Motivo,String Causa,String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into Cirujias(Fecha,Motivo,Tipo,IdPaciente) values(?,?,?,?) ";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, fecha);
            pst.setString(2, Motivo);
            pst.setString(3, Causa);
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
    
    public boolean Alergia(String fecha,String Motivo,String id){
        PreparedStatement pst=null;
        try{
            String consulta="insert into Alergias(Fecha,Causa,IdPaciente) values(?,?,?) ";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, fecha);
            pst.setString(2, Motivo);           
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
    
    public boolean Receta(String nombre,String farmacia,String unidad,String dosis,String via,
            String presenta,String pieza,String cada,String dias,String IdMedico,String id){
        Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=anio+"-"+mes+"-"+dia;
        PreparedStatement pst=null;
        try{
            String consulta="insert into Receta(Medicamento,Farmacia,Unidades,Administracion,Presentacion,"
                    + "Piezas,Dosis,Cada,Dias,Fecha,IdPaciente,IdMedico) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            pst.setString(2, farmacia);
            pst.setString(3, unidad);
            pst.setString(4, via);
            pst.setString(5, presenta);
            pst.setString(6, pieza);
            pst.setString(7, dosis);
            pst.setString(8, cada);
            pst.setString(9, dias);
            pst.setString(10, fecha);
            pst.setString(11, id);
            pst.setString(12,IdMedico);
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
    
    public boolean referencias(String pediatra,String Ginecologia,String Gastro,String Neuro,String Trauma,
            String Endocri,String Geriatria,String Urolo,String Otorri,String Gene,String Psiqui,String Cardio,
            String Olfta,String Neomo,String Nefro,String Hemato,String Vascular,String inmuno,String id,String Medico,String Otra){
        Calendar calender = Calendar.getInstance();
        String fecha;
        int dia=calender.get(Calendar.DAY_OF_MONTH);
        int mes=(calender.get(Calendar.MONTH))+1;
        int anio=calender.get(Calendar.YEAR);
        fecha=anio+"-"+mes+"-"+dia;
        PreparedStatement pst=null;
        try{
            String consulta="insert into Referencia(Pediatra,Ginecologia,Gastro,Neurolo,Trauma,Endocri,Geriatria,"
                    + "Urolo,Otorri,Genetica,Psiqui,Cardio,Olfta,Neomo,Nefro,Hemato,Vascular,Inmuno,Fecha,IdMedico,Otra,IdPaciente)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1, pediatra);
            pst.setString(2,Ginecologia);
            pst.setString(3,Gastro);
            pst.setString(4,Neuro);
            pst.setString(5,Trauma);
            pst.setString(6,Endocri);
            pst.setString(7,Geriatria);
            pst.setString(8,Urolo);
            pst.setString(9,Otorri);
            pst.setString(10,Gene);
            pst.setString(11,Psiqui);
            pst.setString(12,Cardio);
            pst.setString(13,Olfta);
            pst.setString(14,Neomo);
            pst.setString(15,Nefro);
            pst.setString(16,Hemato);
            pst.setString(17,Vascular);
            pst.setString(18,inmuno);
            pst.setString(19,fecha);
            pst.setString(20,Medico);
            pst.setString(21,Otra);
            pst.setString(22, id);
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
    
    /*public boolean respaldo(){
        try{
            Process P=Runtime.getRuntime().exec("mysqldump -u root -p1234 CESS");
            InputStream is=P.getInputStream();
         
            FileOutputStream fos= new FileOutputStream("Respaldo.sql");
            byte[] buffer = new byte[10000];
            int leido=is.read(buffer);
            while(leido>0){
                fos.write(buffer,0,leido);
                leido=is.read(buffer);
            }
            fos.close();
            
        }catch(IOException ex){
            Logger.getLogger(Respaldo.class.getName()).log(Level.SEVERE,null,ex);
        }
        return false;
    }*/
    /*public static void main(String[] args){
        Consulta re= new Consulta();
        //re.respaldo();
        //re.GenerarConsulta("7","Dolor","Pecho","Fiebre","No","No","No","Reposo","Joel","180.5","Espontanea","Lucero","Urgencia","12354","Medicina","25");
        //re.ActualizaConta("karina94","123","23");
        //re.Receta("1","2","3","4","5","6","8","9","10","45");
        //re.AbueloPa("si","si","si","si","si","no","si","si","si","no","no1","2");*/
        //re.getDiagnostico("Co");
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

