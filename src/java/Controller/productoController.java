/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataBaseHelper.DataBaseHelper;
import Models.Categoria;
import Models.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "productoController", urlPatterns = {"/productoController"})
public class productoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DataBaseHelper Db = new DataBaseHelper();
        if (request.getParameter("op") == null) {

            List<Producto> Productos = Db.seleccionarProductos();
            getServletContext().setAttribute("Productos", Productos);

            response.sendRedirect("indexProductos.jsp");
        }
        
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


}
