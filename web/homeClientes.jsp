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
        
        <jsp:include page="includes/navAdministrador.jsp"></jsp:include>
        <jsp:include page="includes/nav.jsp"></jsp:include>
        
        <div class="container mt-5">
            <div class="row justify-content-center float-left">
                
            
        <c:forEach var="P" items="${applicationScope.ProductosCategoria}">
                
            <div class="card col-md-3 mr-3 ml-3 mb-3" style="width: auto; min-width: 300px; min-height: 400px;">
                <img src="img/${P.imagen}" class="card-img-top" style="width:100%;" alt="...">
                <div class="card-body text-center">
                    <h5 class="card-title">${P.descripcion}</h5>
                    <h6 class="card-subtitle mb-2 text-muted">${P.precio}</h6>
                </div>
                <div class="row float-left justify-content-center mb-3">
                    <a href="carroController?productoId=${P.productoId}" class="mr-3 btn btn-blue-grey">Agregar al Carro</a>
                </div>
            </div>
            
            
        </c:forEach>
            
            </div>
            
        </div>
        
        
        
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
