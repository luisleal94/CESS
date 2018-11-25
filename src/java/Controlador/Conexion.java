package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * @author luis
 */
public class Conexion {
    Connection conectar = null;
    
    public Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver"); 
            conectar=DriverManager.getConnection("jdbc:mysql://localhost/CESS","root","1234");
        }catch (ClassNotFoundException ex) {
            System.err.print(ex); 
        }catch(SQLException ex){
           System.err.print(ex);
        } 
    }
    
    public Connection getConexion(){
        return conectar;
    }
    
    public static void main(String[] args){
        Conexion con= new Conexion();

    }
}

