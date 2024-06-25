<%@page import="com.emergentes.entidades.Producto"%>
<%@page import="com.emergentes.entidades.Categoria"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="icon" type="image/svg+xml" href="images/logo.svg">

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/cat.css">
        <link rel="stylesheet" href="css/prod.css">
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

        <div class="title-t3">
            <h1>
                <c:if test="${producto.id == null}"></c:if>
                <c:if test="${producto.id != null}"></c:if>
                    Nuevo Producto
                </h1>
            </div>

            <div class="container">
                <form class="row g-4" action="ProductoServlet" method="post">
                <c:if test="${producto.id == null}"><input type="hidden" name="id" value="0"> </c:if>
                <c:if test="${producto.id != null}"><input type="hidden" name="id" value="${producto.id}"> </c:if>

                    <div class="col-md-6">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="${producto.nombre}" required>
                </div>
                <div class="col-md-6">
                    <label for="imagen" class="form-label">Imagen de producto:</label>
                    <input type="file" class="form-control" id="imagen" name="imagen" value="${item.imagen}" required>
                </div>
                <div class="col-12">
                    <label for="descipcion" class="form-label">Descripción:</label>
                    <textarea class="form-control" id="descripcion" name="descripcion" rows="5">${producto.descripcion}</textarea>
                </div>
                <div class="col-md-6">
                    <label for="categoria" class="form-label">Categoria:</label>
                    <select id="categoria" name="categoriaId" class="form-select select-items">
                        <option>Seleccione...</option>
                        <c:forEach var="item" items="${categorias}">
                            <option value="${item.id}" ${item.id == producto.categoriaId.id ? 'selected' : ''}>
                                ${item.nombre}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="precio" class="form-label">Precio:</label>
                    <input type="number" step="0.01" class="form-control" id="precio" name="precio" value="${producto.precio}" placeholder="Bs."  required min="1">
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">GUARDAR</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
