<%@page import="com.emergentes.entidades.Producto"%>
<%@page import="com.emergentes.entidades.Inventario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventario</title>
        <link rel="icon" type="image/svg+xml" href="images/logo.svg">

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/invt.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <style>
        body {
            background-color: black;
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
                            <a class="nav-link" href="InventarioSevlet">Inventario</a>
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

        <!-- CONTENIDO DE PAGINA -->

        <div class="title-t">
            <h1>
                <c:if test="${inventario.id != null}"></c:if>
                Editar Inventario
            </h1>
        </div>

        <div class="container">
            <form class="row g-4" action="InventarioServlet" method="post">                
                <div class="col-md-4">
                    <label for="cantidad" class="form-label">Cantidad:</label>
                    <input type="number" class="form-control" id="cantidad" name="cantidad" value="${inventario.cantidad}" required min="0">
                </div>
                <div class="col-12">
                    <label for="ubicacion" class="form-label">Ubicación:</label>
                    <textarea class="form-control" id="ubicacion" name="ubicacion" rows="7">${inventario.ubicacion}</textarea>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">GUARDAR</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
