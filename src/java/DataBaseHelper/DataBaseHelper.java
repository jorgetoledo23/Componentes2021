package DataBaseHelper;

import Models.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class DataBaseHelper {
    
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost/appventas";
    private static final String usuario = "root";
    private static final String pass = "";
    
    private Connection Con;
    private Statement Sentencia;
    private ResultSet Filas;
    
    
    public List<Categoria> seleccionarCategorias(){
        
        List<Categoria> Categorias = new ArrayList<Categoria>();
        try{
        Class.forName(driver);
        Con = DriverManager.getConnection(url, usuario, pass);
        Sentencia = Con.createStatement();
        Filas = Sentencia.executeQuery("select * from tbl_categorias");
        
        while(Filas.next()){
            Categoria C = new Categoria();
            C.setCategoriaid(Filas.getInt("categoriaid"));
            C.setDescripcion(Filas.getString("descripcion"));
            Categorias.add(C);
        }
        Sentencia.close();
        Con.close();
        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return Categorias;   
    }
    
    public int addCategoria(Categoria C) {
        
        int filasAfectadas = 0;
        try{
            Class.forName(driver);
            Con = DriverManager.getConnection(url, usuario, pass);
            Sentencia = Con.createStatement();
            filasAfectadas = Sentencia.executeUpdate("insert into tbl_categorias (descripcion) values ('"+ C.getDescripcion() +"')");
            Sentencia.close();
            Con.close();
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return filasAfectadas;
    }
    
    public int editCategoria(Categoria C) {
        
        int filasAfectadas = 0;
        try{
            Class.forName(driver);
            Con = DriverManager.getConnection(url, usuario, pass);
            Sentencia = Con.createStatement();
            filasAfectadas = Sentencia.executeUpdate("update tbl_categorias set descripcion = '"+ C.getDescripcion() +"' "
                    + "WHERE categoriaid = "+C.getCategoriaid()+"");
            Sentencia.close();
            Con.close();
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return filasAfectadas;
    }
    
    public int deleteCategoria(int CategoriaId) {
        int filasAfectadas = 0;
        try{
            Class.forName(driver);
            Con = DriverManager.getConnection(url, usuario, pass);
            Sentencia = Con.createStatement();
            filasAfectadas = Sentencia.executeUpdate("DELETE FROM tbl_Categorias "
                    + "WHERE categoriaid = "+ CategoriaId +"");
            Sentencia.close();
            Con.close();
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return filasAfectadas;
    }
    
    public Categoria getCategoriaById(int CategoriaId){
        Categoria C = new Categoria();
        try{
        Class.forName(driver);
        Con = DriverManager.getConnection(url, usuario, pass);
        Sentencia = Con.createStatement();
        Filas = Sentencia.executeQuery("select * from tbl_categorias where categoriaid = '"+CategoriaId+"'");
        while(Filas.next()){
            C.setCategoriaid(Filas.getInt("categoriaid"));
            C.setDescripcion(Filas.getString("descripcion"));
        }
        Sentencia.close();
        Con.close();
        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return C;   
    }
    
    public int addProducto(Producto P) {
        //String query = "insert into tbl_Productos "
                            //+ "(descripcion, precio, imagen, categoriaid, stock, enOferta, descuento) "
                            //+ "values "
                            //+ "('"+ P.getDescripcion() +"', '"+ P.getPrecio()+"', '"+ P.getImagen()+"', '"+ P.getCategoriaId()+"','"+ P.getStock()+"', '"+ P.isEnOferta()+"','"+ P.getDescuento()+"')";
        //System.out.println(query);
        int filasAfectadas = 0;
        try{
            Class.forName(driver);
            Con = DriverManager.getConnection(url, usuario, pass);
            Sentencia = Con.createStatement();
            filasAfectadas = Sentencia
                    .executeUpdate("insert into tbl_Productos "
                            + "(descripcion, precio, imagen, categoriaid, stock, enOferta, descuento) "
                            + "values "
                            + "('"+ P.getDescripcion() +"', '"+ P.getPrecio()+"', '"+ P.getImagen()+"', '"+ P.getCategoriaId()+"','"+ P.getStock()+"', '"+ P.getEnOferta()+"','"+ P.getDescuento()+"')");
            Sentencia.close();
            Con.close();
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return filasAfectadas;
    }
    
    public List<Producto> seleccionarProductos(){
        List<Producto> Productos = new ArrayList<Producto>();
        try{
        Class.forName(driver);
        Con = DriverManager.getConnection(url, usuario, pass);
        Sentencia = Con.createStatement();
        Filas = Sentencia.executeQuery("select * from tbl_productos");
        
        while(Filas.next()){
            Producto P = new Producto();
            P.setProductoId(Filas.getInt("productoid"));
            P.setDescripcion(Filas.getString("descripcion"));
            P.setStock(Filas.getInt("stock"));
            P.setPrecio(Filas.getInt("precio"));
            P.setDescuento(Filas.getInt("descuento"));
            P.setImagen(Filas.getString("imagen"));
            P.setEnOferta(Filas.getInt("enoferta"));
            P.setCategoriaId(Filas.getInt("categoriaid"));
            Productos.add(P);
        }
        Sentencia.close();
        Con.close();
        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return Productos;  
    }
    
    
    public Producto seleccionarProductoById(String id){
        Producto Pr = new Producto();
        try{
        Class.forName(driver);
        Con = DriverManager.getConnection(url, usuario, pass);
        Sentencia = Con.createStatement();
        Filas = Sentencia.executeQuery("select * from tbl_productos where productoid = "+id+"");
        
        while(Filas.next()){
            
            Pr.setProductoId(Filas.getInt("productoid"));
            Pr.setDescripcion(Filas.getString("descripcion"));
            Pr.setStock(Filas.getInt("stock"));
            Pr.setPrecio(Filas.getInt("precio"));
            Pr.setDescuento(Filas.getInt("descuento"));
            Pr.setImagen(Filas.getString("imagen"));
            Pr.setEnOferta(Filas.getInt("enoferta"));
            Pr.setCategoriaId(Filas.getInt("categoriaid"));

        }
        Sentencia.close();
        Con.close();
        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return Pr;  
    }
    
    
    
    public List<Producto> seleccionarProductosPorCategoria(int CategoriaId){
        List<Producto> Productos = new ArrayList<Producto>();
        try{
        Class.forName(driver);
        Con = DriverManager.getConnection(url, usuario, pass);
        Sentencia = Con.createStatement();
        Filas = Sentencia.executeQuery("select * from tbl_productos where categoriaid = "+CategoriaId+"");
        
        while(Filas.next()){
            Producto P = new Producto();
            P.setProductoId(Filas.getInt("productoid"));
            P.setDescripcion(Filas.getString("descripcion"));
            P.setStock(Filas.getInt("stock"));
            P.setPrecio(Filas.getInt("precio"));
            P.setDescuento(Filas.getInt("descuento"));
            P.setImagen(Filas.getString("imagen"));
            P.setEnOferta(Filas.getInt("enoferta"));
            P.setCategoriaId(Filas.getInt("categoriaid"));
            Productos.add(P);
        }
        Sentencia.close();
        Con.close();
        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return Productos;  
    }
    
    
    
    
    public int deleteProducto(int ProductoId) {
        int filasAfectadas = 0;
        try{
            Class.forName(driver);
            Con = DriverManager.getConnection(url, usuario, pass);
            Sentencia = Con.createStatement();
            filasAfectadas = Sentencia.executeUpdate("DELETE FROM tbl_Productos "
                    + "WHERE productoId = "+ ProductoId +"");
            Sentencia.close();
            Con.close();
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        return filasAfectadas;
    }
    
    
}
