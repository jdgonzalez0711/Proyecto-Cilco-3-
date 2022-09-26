
package servlests;

import controller.SeleccionarController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementacion class ServletSeleccionarListar
 */
@WebServlet("/ServletSeleccionarListar")
public class ServletSeleccionarListar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet() 
     */
    
    public ServletSeleccionarListar() {
        
        super();
        // TODO Auto_generated contructor stub
    }
    
        /**
         * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
         */
  
     
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        
        SeleccionarController seleccionar = new SeleccionarController();
        String username = request.getParameter("username");
        
        String seleccionarStr = seleccionar.listarSelecciones(username);
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(seleccionarStr);
        out.flush();
        out.close();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) 
     */
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
