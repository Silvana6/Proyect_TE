package com.emergentes.controller;

import com.emergentes.bean.BeanCategoria;
import com.emergentes.bean.BeanProducto;
import com.emergentes.entidades.Categoria;
import com.emergentes.entidades.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        BeanProducto daoProducto = new BeanProducto();
        BeanCategoria daoCategoria = new BeanCategoria();
        Producto p = new Producto();
        List<Categoria> c;
        int id;
        
        switch (action) {
            case "add":
                c = daoCategoria.listarTodos();
                request.setAttribute("categorias", c);
                request.setAttribute("producto", p);
                request.getRequestDispatcher("PNew-Edit.jsp").forward(request, response);
                break;

            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                p = daoProducto.buscar(id);
                c = daoCategoria.listarTodos();
                request.setAttribute("categorias", c);
                request.setAttribute("producto", p);
                request.getRequestDispatcher("PNew-Edit.jsp").forward(request, response);
                break;

            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                daoProducto.eliminar(id);
                response.sendRedirect("ProductoServlet");
                break;

            case "view":
                List<Producto> lista = daoProducto.listarTodos();
                request.setAttribute("productos", lista);
                request.getRequestDispatcher("Products.jsp").forward(request, response);
                break;
                
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanProducto daoProducto = new BeanProducto();
        BeanCategoria daoCategoria = new BeanCategoria();
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        BigDecimal precio = new BigDecimal(request.getParameter("precio"));
        String imagen = request.getParameter("imagen");
        int categoria_id = Integer.parseInt(request.getParameter("categoria_id"));
        
        Categoria cate = daoCategoria.buscar(categoria_id);
        
        Producto p = new Producto();
        p.setId(id);
        p.setNombre(nombre);
        p.setDescripcion(descripcion);
        p.setPrecio(precio);
        p.setImagen(imagen);
        p.setCategoriaId(cate);
        
        if (id > 0) {
            daoProducto.editar(p);
        } else {
            daoProducto.insertar(p);
        }
        
        response.sendRedirect("ProductoServlet");
    }
}