package controller;

import java.sql.ResultSet;
import java.sql.Statement;
import com.google.gson.Gson;
import beans.Usuario;
import connection.Conexion;
import java.util.HashMap;
import java.util.Map;

public class UsuarioController implements IUsuarioController {

    @Override
    public String login(String username, String password) {

        Gson gson = new Gson();
        Conexion con = new Conexion();

        String sql = "SELECT * FROM usuarios WHERE  username= '" + username
                + "' and password = '" + password + "'";

        try {
            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next()){
                Integer id = rs.getInt("id");
                String nombres = rs.getString("nombres");
                String apellidos = rs.getString("apellidos");
                String email = rs.getString("email");
                Usuario usuario = new Usuario(id,username, password, nombres, apellidos,email);
                
                return gson.toJson(usuario);
                
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        finally{
            con.Desconectar();
        }
        
        return "false";
    }
    @Override
    public String register(String username, String password, String nombres , String apellidos, String email){
        
        Gson gson = new Gson();
        Conexion con = new Conexion();
        
        String sql = "INSERT INTO usuarios (username , password , nombres , apellidos,email)"
                + " values('" + username + "','"+ password +"' , '"+ nombres 
                +"' ,'"+ apellidos + "' , '"+ email +"')";
        
        try {
            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);
            
            Usuario usuario = new Usuario(username , password, nombres , apellidos , email);
            
            st.close();
            
            return gson.toJson(usuario);
        } catch(Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            con.Desconectar();
        }
        return "false";
    }
    @Override
     public String pedir(String username){
         
         Gson gson = new Gson();
         
         Conexion con = new Conexion();
         String sql = "Select * from usuarios where username = '" + username + "'";
         
         try{
             
             Statement st = con.getConnection().createStatement();
             ResultSet rs = st.executeQuery(sql);
             
             while (rs.next()){
                 String password = rs.getString("password");
                 String nombres = rs.getString("nombres");
                 String apellidos = rs.getString("apellidos");
                 String email = rs.getString("email");
                 
                 Usuario usuario = new Usuario(username, password, nombres, apellidos,email);
                 
                 return gson.toJson(usuario);
             }
         } catch(Exception ex){
             System.out.println(ex.getMessage());
         } finally {
             con.Desconectar();
         }
         return "false";
     }
     
@Override
    public String modificar(String username, String nuevaContrasena,
            String nuevoNombre, String nuevosApellidos,
            String nuevoEmail) {

        Conexion con = new Conexion();

        String sql = "Update usuarios set password = '" + nuevaContrasena
                + "', nombres = '" + nuevoNombre + "', "
                + "apellidos = '" + nuevosApellidos + "', email = '";

        

        sql += " where username = '" + username + "'";

        try {

            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);

            return "true";
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            con.Desconectar();
        }

        return "false";

    }
         
     @Override
     public String eliminar(String username) {
         
         Conexion con = new Conexion();
         
         
         String sql2 = "Delete from usuarios where username = '" + username + "'";
         
         try {
             
             Statement st = con.getConnection().createStatement();
            
             st.executeUpdate(sql2);
             
             return "true";
         } catch (Exception ex) {
             System.out.println(ex.getMessage());
         } finally {
             con.Desconectar();
         }
         
         return "false";
     }
}
