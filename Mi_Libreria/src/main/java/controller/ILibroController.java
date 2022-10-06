
package controller;


public interface ILibroController {
    
    public String listar(boolean ordenar , String orden);
    
    public String devolver(Integer id, String username);
    
    public String sumarCantidad(int id);
    
    public String seleccionar (int id_libro , String username);
    

}
