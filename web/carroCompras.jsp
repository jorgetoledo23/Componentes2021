<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Componentes Web</title>
        <jsp:include page="includes/header.jsp"></jsp:include>
    </head>
    <body>
        <fmt:setLocale value="es_CL" scope="application"></fmt:setLocale>
        <jsp:include page="includes/navAdministrador.jsp"></jsp:include>
        <jsp:include page="includes/nav.jsp"></jsp:include>
        
        <div class="container mt-5">
            <div class="card card-cascade narrower view view-cascade gradient-card-header blue-gradient narrower py-2 mb-3 d-flex justify-content-between align-items-center">
                <h2 href="" class="white-text mx-3">Carrito de Compras</h2>              
            </div>
            <hr>
            
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td>Producto</td>
                        <td>Precio</td>
                        <td>Cantidad</td>
                        <td>SubTotal</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                <c:set var="Total" scope="page" value="0"></c:set>
                <c:forEach var="P" items="${sessionScope.carro}">
                    <tr>
                        <td>${P.producto.descripcion}</td>
                        <td><fmt:formatNumber value="${P.producto.precio}" type="currency" currencySymbol="$"></fmt:formatNumber></td>
                        <td>${P.cantidad}</td>
                        <td><fmt:formatNumber value="${P.producto.precio * P.cantidad}" type="currency" currencySymbol="$"></fmt:formatNumber></td>
                        <td><a href="carroController?opcion=delete&productoId=${P.producto.productoId}"><i class="fas fa-trash-alt fa-lg ml-1"></i></a></td>
                    </tr>
                    <c:set var="Total" scope="page" value="${Total + P.producto.precio * P.cantidad}"></c:set>
                </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td style="font-size: 25px; font-weight: bold;">Total: <fmt:formatNumber value="${pageScope.Total}" 
                                  type="currency" currencySymbol="$"></fmt:formatNumber> </td>
                    </tr>
                </tfoot>
            </table>
            
      
        </div>
        
        
        
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
