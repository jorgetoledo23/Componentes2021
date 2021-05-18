<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><img height="50" src="img/Home.png" alt=""/></a>   
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
            aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse ml-5" id="basicExampleNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                      aria-haspopup="true" aria-expanded="false"><i class="fas fa-bars mr-3"></i>Categorias</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">

                    </div>
                </li>
                <li class="nav-item ml-5"> 
                    <form class="form-inline">
                        <div class="md-form my-0">
                            <input name="filtro" class="form-control mr-sm-2" type="text" placeholder="¿Que estas buscando?" aria-label="Buscar">
                        </div>
                    </form>
                </li>
            </ul> 
            
        </div>
        <ul class="navbar-nav ml-auto nav-flex-icons">
            <li class="nav-item">
                <a href="CarroCompras.jsp" class="nav-link waves-effect waves-light">
                    <i class="fas fa-shopping-cart fa-2x"></i>
                    <span class="badge badge-danger ml-2">${length}</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="" class="nav-link waves-effect waves-light">
                  <i class="fas fa-credit-card fa-2x"></i>
                </a>
            </li>
        </ul>
    </div>
</nav>