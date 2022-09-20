package controller;

import java.util.Map;



public interface IUsuarioController {
    
    public String login (String username , String password);
    
    public String register(String username, String password, String nombres, String apellidos, String email);
    
}
