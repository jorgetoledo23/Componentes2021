<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h2 href="" class="white-text mx-3">Categorias</h2>
                <a class="white-text" href="addCategorias.jsp"><i class="fas fa-plus-circle fa-lg mr-2"></i>Crear Nueva Categoria</a>
            </div>
            
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>
                            Codigo
                        </th>
                        <th>
                            Descripcion
                        </th>
                        <th>
                            Acciones
                        </th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="C" items="${applicationScope.Categorias}">
                    <tr>
                        <td>
                            ${C.categoriaid}
                        </td>
                        <td>
                            ${C.descripcion}
                        </td>
                        <td>
                            <a href="categoriaController?op=edit&cat=${C.categoriaid}"><i class="fas fa-pencil-alt mt-0 fa-lg"></i></a>
                            <a href="categoriaController?op=details&cat=${C.categoriaid}"><i class="fas fa-info-circle mt-0 fa-lg ml-1"></i></a>
                            <a onclick="return confirm('Estas seguro de Eliminar la Categoria Seleccionada?')"
                                href="categoriaController?op=delete&cat=${C.categoriaid}"><i class="fas fa-trash-alt mt-0 fa-lg ml-1"></i></a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            
        </div>

        
        
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
