package controller;

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import beans.Libro;
import connection.Conexion;



public class LibroController implements ILibroController{
    
    @Override
    public String listar(boolean ordenar , String orden){
        
        Gson gson = new Gson();
        
        Conexion con = new Conexion();
        String sql = "SELECT * FROM libros";
        
        if(ordenar == true){
            sql += " order by categoria" + orden;
        }
        
        List<String> libros = new ArrayList<String>();
        
        try{
            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                Integer id = rs.getInt("id");
                String titulo = rs.getString("titulo");
                String categoria = rs.getString("categoria");
                String sub_categoria = rs.getString("sub_categoria");
                String autor = rs.getString("autor");
                Integer anio_publicacion= rs.getInt("anio_publicacion");
                Integer paginas = rs.getInt("paginas");
                
                Libro libro = new Libro(id, titulo, categoria, sub_categoria, autor, anio_publicacion, paginas);
                
                libros.add(gson.toJson(libro));
                
            }
        } catch (Exception ex){
            System.out.println(ex.getMessage());
        } finally {
            con.Desconectar();
        }
        
        return gson.toJson(libros);
    }
    
    @Override
    public String devolver(Integer id , String username) {
        
        Conexion con = new Conexion();
        String sql = "DELETE from biblioteca where id = " + id + "and username = ' " 
                + username + "'limit 1";
        
        try {
            Statement st = con.getConnection().createStatement();
            st.executeQuery(sql);
            
            this.sumarCantidad(id);
            
            return "true";
        } catch(Exception ex) {
            System.out.println(ex.toString());
        } finally{
            con.Desconectar();
        }
        return "false";
    }
  
    @Override
    public String sumarCantidad(int id) {
        
        Conexion con = new Conexion();
        
        String sql = "UPDATE libros set copias = (Select from peliculas where id= "
                + id + ") + 1 where id= "+ id;
        
        try {
            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);
            
            return "true";
        } catch (Exception ex){
            System.out.println(ex.toString());
            
        } finally {
            con.Desconectar();
        }
        return "false";
    }
}
