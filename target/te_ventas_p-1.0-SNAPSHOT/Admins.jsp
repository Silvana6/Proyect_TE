<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Información</title>
        <link rel="icon" type="image/svg+xml" href="images/logo.svg">
        
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/admins.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <style>
        body {
            background: black;
        }
    </style>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="Admins.jsp"><span>SoundShine S&S</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="MianServlet">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CategoriaServlet">Categorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ProductoServlet">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="InventarioServlet">Inventario</a>
                        </li>
                    </ul>
                </div>
                <div class="container-fluid" id="menu">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </div>
        </nav>
        
        <!-- INICIO DE LA PAGINA -->
        
        <div class="title-t">
            <h1>Información</h1>
        </div>

        <!-- DATOS ADICIONALES -->
        
        <div class="container">
            <div class="content-box">
                <h1>SoundShine S&S</h1>
                <h2>Autores</h2>

                <p>Silvana Callejas Meneses</p>
                <p>Deyvid Chambi Averanga</p>

                <div class="apartado">
                    <h3>Materia</h3>
                    <p>TECNOLOGÍAS EMERGENTES II</p>

                    <h3>Docente</h3>
                    <p>Ing. MSc Mario Torrez C.</p>

                    <h3>Semestre</h3>
                    <p>7 C (NOCHE)</p>
                </div>
            </div>
        </div>

        <footer>
            <p>&copy; 2024 SoundShine S&S. Todos los derechos reservados.</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
