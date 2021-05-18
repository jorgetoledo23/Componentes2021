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
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1>App Componentes Web</h1>
                </div>
            </div>
            <div class="row mt-5">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(35).jpg">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(33).jpg">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(31).jpg">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
