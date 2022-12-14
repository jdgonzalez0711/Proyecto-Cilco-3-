
package servlests;

import controller.LibroController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jdgon
 */
@WebServlet("/ServletLibroSeleccionar")
public class ServletLibroSeleccionar extends HttpServlet {
      private static final long serialVersionUID = 1L;
    
    /**
     *@see HttpServlet#HttpServlet() 
     */
    
    public ServletLibroSeleccionar() {
        super();
        //TODO Auto-generated constructor stub
    }



    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)  
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        
        LibroController libro = new LibroController();
        
        Integer id_libro = Integer.parseInt(request.getParameter("id_libro"));
        String username = request.getParameter("username");
        
        String libroStr = libro.seleccionar(id_libro, username);
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(libroStr);
        out.flush();
        out.close();
        
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) 
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

 }
