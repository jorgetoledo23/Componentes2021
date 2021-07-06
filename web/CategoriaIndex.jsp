<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <div class="container">
            
            
            <div class="card card-cascade narrower view view-cascade gradient-card-header blue-gradient narrower py-2 mb-3 d-flex justify-content-between align-items-center">
                <h2 href="" class="white-text mx-3">Productos</h2>
                <a class="white-text" href="addProducto.jsp"><i class="fas fa-plus-circle fa-lg mr-2"></i>Agregar Producto</a>
            </div>
            

            <div class="row col-md-12 justify-content-between float-left mt-5">

                <c:forEach var="P" items="${applicationScope.Productos}">

                    <div class="card col-md-3 mr-3 ml-3 mb-3 mx-auto" >
                        <img src="img/${P.imagen}" class="card-img-top mx-auto" alt="..." style="width: 200px; height: 200px;">
                        <div class="card-body text-center">
                            <h5 class="card-title"><strong>${P.descripcion}</strong></h5>
                            <p class="card-text"> <fmt:formatNumber value="${P.precio}" type="currency" currencySymbol="$"></fmt:formatNumber></p>
                            <h6 class="card-text">${P.stock}</h6>
                            <div class="form-group mb-3">
                                <h5 class="card-text">
                                <c:if test="${P.enOferta == 1}">
                                    <label for="chk" class="form-control">En Oferta</label>
                                    <input name="chk" class="form-control disabled" type="checkbox" checked />
                                </c:if>
                                <c:if test="${P.enOferta == 0}">
                                    <label for="chk" class="form-control">En Oferta</label>
                                    <input name="chk" class=" form-control disabled" type="checkbox" />
                                </c:if>
                                </h5>
                            </div>
                            
                            <h5 class="card-text">
                                <fmt:formatNumber value="${P.descuento}" type="currency" currencySymbol="$"></fmt:formatNumber> 
                            </h5>
                        </div>
                        <div class="row justify-content-center mb-3">
                            <div class="col-1 float-left">
                                <a href="ControllerCategoria?opcion=edit&catId=${Categoria.categoriaId}" class="mr-3"><i class="fas fa-edit"></i></a>
                            </div>
                            <div class="col-1 float-left">
                                <a class="mr-3"><i class="fas fa-info-circle"></i></a>
                            </div>
                            <div class="col-1 float-left">
                                <a onclick="return confirm('Estas seguro de eliminar esta Categoria?')" class="mr-3"><i class="fas fa-trash"></i></a>
                            </div>
                        </div>
                    </div>
                
                </c:forEach>

                
                
            </div>
            
        </div>
    <!-- HOLA GITHUB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    </body>
</html>
