package DataBaseHelper;

import Models.Categoria;
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
    
    public int addProducto(Categoria C) {
        
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
    
    
}
