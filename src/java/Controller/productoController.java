/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataBaseHelper.DataBaseHelper;
import Models.Categoria;
import Models.Producto;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
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

        Producto P = new Producto();
        P.setDescripcion(request.getParameter("Descripcion"));
        P.setPrecio(Integer.parseInt(request.getParameter("Precio")));
        P.setStock(Integer.parseInt(request.getParameter("Stock")));
        P.setDescuento(Integer.parseInt(request.getParameter("PrecioOferta")));
        if (Boolean.parseBoolean(request.getParameter("enOferta"))) {
            P.setEnOferta(1);
        }else{
            P.setEnOferta(0);
        }
        P.setCategoriaId(Integer.parseInt(request.getParameter("CategoriaId")));
        P.setImagen(getImagen(request.getPart("Imagen"), request));
        
        DataBaseHelper db = new DataBaseHelper();
        
        switch (request.getParameter("Accion")) {
            
            case "Guardar Producto":
                db.addProducto(P);
                response.sendRedirect("productoController");

        }
        
        
        
        
        
    }
    
    
    private String getImagen(Part Imagen, HttpServletRequest request) throws IOException{
    
        String foto = "foto";
        int estado = 1;
        //Ubicamos la ruta en donde se almacenará la imagen
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + "img\\";
        //Declaracion de Stream para subir archivo
        OutputStream out = null;
        InputStream filecontent = null;
        //Configuracion del nombre del archivo
        String format = "";
        DateFormat hourdateFormat = new SimpleDateFormat("HHmmssddMMyyyy");
        String fecha = hourdateFormat.format(new Date());
        //Se Valida la extencion
        if (Imagen.getSubmittedFileName().endsWith(".png")) {
            format = ".png";
        } else if (Imagen.getSubmittedFileName().endsWith(".jpg")) {
            format = ".jpg";
        } else if (Imagen.getSubmittedFileName().endsWith(".jpeg")) {
            format = ".jpeg";
        }
        String file_photo = foto + "_" + fecha + format;
        try {
            out = new FileOutputStream(new File(savePath.replace("\\build", "") + File.separator + file_photo));
            filecontent = Imagen.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }

        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
        }
        return file_photo;
    
    }


}
