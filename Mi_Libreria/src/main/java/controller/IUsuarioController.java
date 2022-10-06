package controller;

import java.util.Map;



public interface IUsuarioController {
    
    public String login (String username , String password);
    
    public String register(String username, String password, String nombres, String apellidos, String email);
    
    public String pedir(String username);
    
    public String modificar(String username, String nuevaContrasena, 
            String nuevoNombre, String nuevosApellidos, String nuevoEmail);
    

    
    public String eliminar(String username);
}
