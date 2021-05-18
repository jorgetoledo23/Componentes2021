
package Controller;

import DataBaseHelper.DataBaseHelper;
import Models.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;
import javax.persistence.Convert;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "categoriaController", urlPatterns = {"/categoriaController"})
public class categoriaController extends HttpServlet {


   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataBaseHelper Db = new DataBaseHelper();
        if (request.getParameter("op") == null) {
            //Enviar a la vista Todas las Categorias
            List<Categoria> Categorias = Db.seleccionarCategorias();
            getServletContext().setAttribute("Categorias", Categorias);

            //Ir primero indexCategoria
            response.sendRedirect("indexCategorias.jsp");
        }
        if (request.getParameter("op") != null) {
            //QUIERO EDITAR UNA CATEGORIA
            int CategoriaId = Integer.parseInt(request.getParameter("cat"));
            //System.out.println(CategoriaId);
            Categoria C = Db.getCategoriaById(CategoriaId);
            request.setAttribute("Categoria", C);
            
            switch (request.getParameter("op")) {
                case "edit":
                    //Editar Categoria
                    request.getRequestDispatcher("editCategoria.jsp").forward(request, response);
                    break;
                case "details":
                //Ver dedalles de la Categoria

                break;
                case "delete":
                    //Eliminar (Desactivar) Categoria
                    
                    break;
                default:
                    throw new AssertionError();
            }
        }
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Insertar Categoria
        //Actualizar Categoria
       
        //C = Create, Crear
        //R = Read, Leer
        //U = Update, Actualizar
        //D = Delete, Eliminar
        
        Categoria C = new Categoria();
        C.setDescripcion(request.getParameter("CategoriaDescripcion"));
        
        String Accion = request.getParameter("Accion");
        
        DataBaseHelper db = new DataBaseHelper();
        switch (Accion) {
            case "Guardar Categoria":
                //Insertar Categoria en la BD
                db.addCategoria(C);
                response.sendRedirect("categoriaController");
                break;
            case "Guardar Cambios":
                //Actualizo Categoria en la BD
                C.setCategoriaid(Integer.parseInt(request.getParameter("CategoriaId")));
                db.editCategoria(C);
                response.sendRedirect("categoriaController");
                break;
            default:
                throw new AssertionError();
        }
        

    }


}
