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
    
    
    public boolean reg_historial(String id,String origen,String resi,String reli,String esco,String habitos,
            String toxico,String zoo,String Rh,String Vacun){
            PreparedStatement pst=null;
            
            try{
            String consulta="insert into Pesonal_NoPat("
                    + "Origen,Residencia,Religion,Escolaridad,Habitos,Toxiconomias,"
                    + "Zoonosis,GrupuRh,Vacunacion,Id_Pacientes) values(?,?,?,?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            
            pst.setString(1,origen);
            pst.setString(2,resi);
            pst.setString(3,reli);
            pst.setString(4,esco);
            pst.setString(5,habitos);
            pst.setString(6,toxico);
            pst.setString(7,zoo);
            pst.setString(8,Rh);
            pst.setString(9,Vacun);
            pst.setString(10,id);
            if(pst.executeUpdate()==1){
                return true;
            } 
        }catch(Exception e){
             System.out.println("Error"+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error"+e);
            }
        }   
        return false;
    }
    
    
    public boolean historial_texto(String id,String famili,String Patolo,String SisActual,String ApaSis,
            String EstAux,String Terapeutica){
        PreparedStatement pst=null;
        
        try{
            String consulta="insert into Antecedentes("
                    + "heredofamiliares,Perso_patologicos,Pade_actual,Aparat_sistemas,Estu_auxi,Tera_emple_result,"
                    + "Id_Pacientes) values(?,?,?,?,?,?,?)";
            pst=getConexion().prepareStatement(consulta);
            
            pst.setString(1,famili);
            pst.setString(2,Patolo);
            pst.setString(3,SisActual);
            pst.setString(4,ApaSis);
            pst.setString(5,EstAux);
            pst.setString(6,Terapeutica);
            pst.setString(7,id);
            if(pst.executeUpdate()==1){
                return true;
            } 
        }catch(Exception e){
            System.out.println("Error"+e);
        }
        finally{
            try{
                if(getConexion()!=null) getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error"+e);
            }
        }       
        return false;
    }
   
   /*public static void main(String[] args){
        Consulta re= new Consulta();
        //re.registro("jose luis","Rosas Leal","1234");
        //re.reg_paciente("Eduardo","Rosas","Leal","21","1234","Ingeniero","Soltero","Tapicer","roll940909","masculino");
        
        /*re.reg_historial("6", "veracruz","La loma","catolica","licenciatura",
                "gym", "nose","perros", "A+","si");
        
        re.historial_texto("8", "ninguno","Alergia al tapcin", "Ninguno", "lleso en el "
                + "brazo izquierdo", "rayos x", "Estiramiento");
    }*/
     
}

