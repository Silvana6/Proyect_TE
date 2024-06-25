<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.entidades.Categoria"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
        <link rel="icon" type="image/svg+xml" href="images/logo.svg">

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/cat.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <style>
        body {
            background-color: black;
        }
    </style>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary nav" data-bs-theme="dark">
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

        <!-- CONTENIDO DE PAGINA -->

        <div class="title-t">
            <h1>Categorias</h1>
        </div>

        <div class="btns-new">
            <a class="create-btn" href="CategoriaServlet?action=add">
                <img src="images/add.svg" alt="+"> Crear nueva categoria
            </a>
        </div>

        <div class="container box-cat">
            <table class="table transparent-bg">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripción</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${categorias}">
                    <tr>
                        <td><img src="images/logo.svg" alt="logo"/></td>
                        <td>${item.nombre}</td>
                        <td>${item.descripcion}</td>
                        <td><a class="icon" href="CategoriaServlet?action=edit&id=${item.id}"><img src="images/edit.svg" alt="logo"/></a></td>
                        <td><a class="icon" href="CategoriaServlet?action=dele&id=${item.id}" onclick="return(confirm('Esta seguro de eliminar?...'))"><img src="images/delete.svg" alt="logo"/></a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
