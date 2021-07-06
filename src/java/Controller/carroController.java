/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataBaseHelper.DataBaseHelper;
import Models.ItemCarro;
import Models.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Profe
 */
@WebServlet(name = "carroController", urlPatterns = {"/carroController"})
public class carroController extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productoId = request.getParameter("productoId");
        
        if ("delete".equals(request.getParameter("opcion"))) {
            List<ItemCarro> itemsCarro = (List<ItemCarro>) request.getSession().getAttribute("carro");
            ItemCarro item = null;
            for (ItemCarro i : itemsCarro) {
                if (i.getProducto().getProductoId() == Integer.parseInt(productoId)) {
                    //Producto Existe en el Carro
                    item = i;
                    break;
                }
            }
        itemsCarro.remove(item);
        request.getSession().setAttribute("itemscarro", itemsCarro.size());
        response.sendRedirect("carroCompras.jsp");  
        
        }else{
        DataBaseHelper Db = new DataBaseHelper();
        Producto P = Db.seleccionarProductoById(productoId);
        
        
        if (request.getSession().getAttribute("carro") == null) {
            //crear carro (session)
            List<ItemCarro> itemsCarro = new ArrayList<>();
            request.getSession().setAttribute("carro", itemsCarro);
        }
        
        List<ItemCarro> itemsCarro = (List<ItemCarro>) request.getSession().getAttribute("carro");
        Boolean existe = false;
        for (ItemCarro i : itemsCarro) {
            if (i.getProducto().getProductoId() == P.getProductoId()) {
                //Producto Existe en el Carro
                existe = true;
                int cantidad = i.getCantidad();
                i.setCantidad(cantidad + 1);
                break;
            }
        }
        if (!existe) {
            ItemCarro  ic = new ItemCarro();
            ic.setProducto(P);
            ic.setCantidad(1);

            itemsCarro.add(ic); 
        }
        
        //request.getSession().setAttribute("carro", itemsCarro);
        request.getSession().setAttribute("itemscarro", itemsCarro.size());
        response.sendRedirect("carroCompras.jsp");
        }
        
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }


}
