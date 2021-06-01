<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>App Ventas - Administracion de Productos del Sistema</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="includes/navAdministrador.jsp"></jsp:include>
        <jsp:include page="includes/nav.jsp"></jsp:include>
              
        <div class="container mt-5">

        <div class="card card-cascade narrower view view-cascade gradient-card-header blue-gradient narrower py-2 mb-3 d-flex justify-content-between align-items-center">
            <h2 href="" class="white-text mx-3">Agregar Prodcutos</h2>
            <a class="white-text" href="prodcutoController"><i class="fas fa-plus-circle fa-lg mr-2"></i>Volver al listado de Productos</a>
        </div>
        
        <h2>Agregar nuevo Producto</h2>
        <hr>
        <div class="row">
            <div class="col-4">
                <form action="productoController" method="post">
                    <div class="form-group">
                        <label class="control-label" for="CategoriaDescripcion">Descripcion</label>
                        <input class="form-control" type="text" name="CategoriaDescripcion" placeholder="Descripcion" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label" for="CategoriaDescripcion">Precio</label>
                        <input class="form-control" type="text" name="CategoriaDescripcion" placeholder="Descripcion" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label" for="CategoriaDescripcion">Stock</label>
                        <input class="form-control" type="text" name="CategoriaDescripcion" placeholder="Descripcion" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label" for="CategoriaDescripcion">Descuento</label>
                        <input class="form-control" type="text" name="CategoriaDescripcion" placeholder="Descripcion" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <input name="Accion" class="btn btn-success btn-block" type="submit" value="Guardar Categoria" />
                    </div>
                </form>
                <p></p>
            </div>
        </div>
    </div>
        
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
