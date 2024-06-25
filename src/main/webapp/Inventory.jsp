<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.entidades.Inventario"%>
<%@page import="com.emergentes.entidades.Producto"%>

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
            <h1>Inventario</h1>
        </div>
        
        <div class="container box-cat">
            <table class="table transparent-bg">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Precio (Bs.)</th>
                        <th scope="col">Ubicación</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody class="td-img">
                    <c:forEach var="item" items="${inventario}">
                    <tr>
                        <td><img src="${item.productoId.imagen}" alt="p" id="img"/></td><!--IMAGEN DE BD-->
                        <td>${item.productoId.nombre}</td>
                        <td>${item.productoId.descripcion}</td>
                        <td>${item.cantidad}</td>
                        <td>${item.productoId.precio}</td>
                        <td>${item.ubicacion}</td>
                        <td><a class="icon" href="InventarioServlet?action=edit&id=${item.id}"><img src="images/edit.svg" alt="logo"/></a></td>
                        <td><a class="icon" href="InventarioServlet?action=dele&id=${item.id}" onclick="return(confirm('Esta seguro de eliminar?...'))"><img src="images/delete.svg" alt="logo"/></a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
