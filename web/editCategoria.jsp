<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="includes/navAdministrador.jsp"></jsp:include>
        <jsp:include page="includes/nav.jsp"></jsp:include>
              
        <div class="container mt-5">

        <div class="card card-cascade narrower view view-cascade gradient-card-header blue-gradient narrower py-2 mb-3 d-flex justify-content-between align-items-center">
            <h2 href="" class="white-text mx-3">Crear Categorias</h2>
            <a class="white-text" href="categoriaController"><i class="fas fa-plus-circle fa-lg mr-2"></i>Volver al listado de Categorias</a>
        </div>
        
            <h2>Editando Categoria <strong>${requestScope.Categoria.descripcion}</strong> </h2>
        <hr>
        <div class="row">
            <div class="col-4">
                <form action="categoriaController" method="post">

                    <input readonly hidden name="CategoriaId"
                        class="form-control" type="text" name="Codigo" value="${requestScope.Categoria.categoriaid}" />

                    <div class="form-group">
                        <label class="control-label" for="CategoriaDescripcion">Descripcion</label>
                        <input class="form-control" type="text" name="CategoriaDescripcion" value="${requestScope.Categoria.descripcion}" required="true" />
                    </div>
                    <div class="form-group">
                        <input name="Accion" class="btn btn-success btn-block" type="submit" value="Guardar Cambios" />
                    </div>
                </form>
                <p></p>
            </div>
        </div>
    </div>
        
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>