<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        
    <fmt:setLocale value="es_CL" scope="application"></fmt:setLocale>
        
        <jsp:include page="includes/navAdministrador.jsp"></jsp:include>
        <jsp:include page="includes/nav.jsp"></jsp:include>
        <div class="container mt-5">
            
            <div class="card card-cascade narrower view view-cascade gradient-card-header blue-gradient narrower py-2 mb-3 d-flex justify-content-between align-items-center">
                <h2 href="" class="white-text mx-3">Productos</h2>
                <a class="white-text" href="addProducto.jsp"><i class="fas fa-plus-circle fa-lg mr-2"></i>Agregar Producto</a>
            </div>
            
            <table class="table table-hover fs-1">
                <thead>
                    <tr>
                        <th class="fs-1">
                            Codigo
                        </th>
                        <th>
                            Descripcion
                        </th>
                        <th>
                            Imagen
                        </th>
                        <th>
                            Precio
                        </th>
                        <th>
                            Stock
                        </th>
                        <th>
                            en Oferta
                        </th>
                        <th>
                            Descuento
                        </th>
                        <th>
                            Acciones
                        </th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="P" items="${applicationScope.Productos}">
                    <tr>
                        <td>
                            ${P.productoId}
                        </td>
                        <td>
                            ${P.descripcion}
                        </td>
                        <td>
                            <img style="height: 100px; width: 100px;" src="img/${P.imagen}" />
                        </td>
                        <td>
                            <fmt:formatNumber value="${P.precio}" type="currency" currencySymbol="$"></fmt:formatNumber>
                        </td>
                        <td>
                            ${P.stock}
                        </td>
                        <td class="text-center">
                            <c:if test="${P.enOferta == 1}">
                                <input class="form-check-input disabled" type="checkbox" checked />
                            </c:if>
                            <c:if test="${P.enOferta == 0}">
                                <input class="form-check-input disabled" type="checkbox" />
                            </c:if>
                        </td>
                        <td>
                            <fmt:formatNumber value="${P.descuento}" type="currency" currencySymbol="$"></fmt:formatNumber> 
                        </td>
                        <td>
                            <a href="productoController?op=edit&cat=${P.productoId}"><i class="fas fa-pencil-alt mt-0 fa-lg"></i></a>
                            <a href="productoController?op=details&cat=${P.productoId}"><i class="fas fa-info-circle mt-0 fa-lg ml-1"></i></a>
                            <a onclick="return confirm('Estas seguro de Eliminar el Prodcuto Seleccionado?')"
                                href="productoController?op=delete&cat=${P.productoId}"><i class="fas fa-trash-alt mt-0 fa-lg ml-1"></i></a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            
        </div>

        
        
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
