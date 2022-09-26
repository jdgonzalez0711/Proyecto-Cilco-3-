
package controller;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;
import com.google.gson.Gson;

import beans.Biblioteca;
import connection.Conexion;

public class SeleccionarController implements ISeleccionarController{
    
    @Override
    
    public String listarSelecciones(String username) {
        
        Gson gson = new Gson();
        
        Conexion con = new Conexion();
        
        String sql = "Select l.id, l.titulo, l.categoria, s.fecha_seleccion from libros l" 
                + "inner join biblioteca s on l.id= s.id_libro inner join usuarios u on s.id_username= u.id" 
                + "where s.username = '" + username + "'";
        
        List<String> seleccion = new ArrayList<String>();
        
        try{
            
            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next()) {
                Integer id = rs.getInt("id");
                String titulo = rs.getString("titulo");
                String categoria = rs.getString("categoria");
                Date fecha_seleccion = rs.getDate("fecha_seleccion");
                
                Biblioteca biblioteca = new Biblioteca(id, titulo, categoria,fecha_seleccion);
                
                seleccion.add(gson.toJson(biblioteca));
            }
        } catch (Exception ex){
            System.out.println(ex.getMessage());
        } finally {
            con.Desconectar();
        }
        
        return gson.toJson(seleccion);
    }
  
}
