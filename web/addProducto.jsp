<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        

        <hr>
        
        <form action="productoController" method="post" enctype="multipart/form-data">
                <div class="row">
                <div class="col-6">
                    <div class="form-group col-md-12">
                        <label class="control-label" for="Descripcion">Descripcion</label>
                        <input class="form-control" type="text" name="Descripcion" placeholder="Descripcion" required="true" />
                    </div>

                    <div class="form-group col-md-6">
                        <label class="control-label" for="Precio">Precio</label>
                        <input class="form-control" type="number" name="Precio" placeholder="Precio" required="true" />
                    </div>

                    <div class="form-group col-md-6">
                        <label class="control-label" for="Stock">Stock</label>
                        <input class="form-control" type="text" name="Stock" placeholder="Stock" required="true" />
                    </div>

                    <div class="form-group col-md-6">
                        <label class="control-label" for="CategoriaId">Categoria</label>
                        
                        <select class="form-control" name="CategoriaId">
                            <option>Seleccione...</option>
                            <c:forEach var="C" items="${applicationScope.Categorias}">
                                <option value="${C.categoriaid}">${C.descripcion}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <p></p>
                </div>
                <div class="col-6">
                    <div class="form-group col-md-12">
                        <label for="Imagen" class="control-label">Imagen</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="Imagen">
                            <label class="custom-file-label" for="Imagen">Elegir Imagen</label>
                        </div>
                    </div>
                    
                    <div class="form-group col-md-6">
                        <div class="form-check">
                            <input name="enOferta" class="form-check-input" type="checkbox" id="flexCheckDefault" />
                            <label class="form-check-label" for="flexCheckDefault"> En Oferta?</label>
                        </div>
                    </div>
                    
                    <div class="form-group col-md-6">
                        <label class="control-label" for="PrecioOferta">Precio Oferta</label>
                        <input class="form-control" type="number" name="PrecioOferta" placeholder="Precio Oferta" />
                    </div>

                    <p>${msgError}</p>
                    <div class="form-group  float-right">
                        <input name="Accion" class="btn btn-success btn-block" type="submit" value="Guardar Producto" />
                    </div>
                </div>
                
                    
                
                </div>
            </form>
        
    </div>
        
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
