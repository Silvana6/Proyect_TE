package com.emergentes.controller;

import com.emergentes.bean.BeanInventario;
import com.emergentes.bean.BeanProducto;
import com.emergentes.entidades.Inventario;
import com.emergentes.entidades.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "InventarioServlet", urlPatterns = {"/InventarioServlet"})
public class InventarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        BeanInventario daoInventario = new BeanInventario();
        BeanProducto daoProducto = new BeanProducto();
        Inventario i = new Inventario();
        List<Producto> p;
        int id;
        
        switch (action) {
            case "add":
                p = daoProducto.listarTodos();
                request.setAttribute("productos", p);
                request.setAttribute("inventario", i);
                request.getRequestDispatcher("INew-Edit.jsp").forward(request, response);
                break;

            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                i = daoInventario.buscar(id);
                p = daoProducto.listarTodos();
                request.setAttribute("productos", p);
                request.setAttribute("inventario", i);
                request.getRequestDispatcher("INew-Edit.jsp").forward(request, response);
                break;

            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                daoInventario.eliminar(id);
                response.sendRedirect("InventarioServlet");
                break;

            case "view":
                List<Inventario> lista = daoInventario.listarTodos();
                request.setAttribute("inventario", lista);
                request.getRequestDispatcher("Inventory.jsp").forward(request, response);
                break;
                
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanInventario daoInventario = new BeanInventario();
        BeanProducto daoProducto = new BeanProducto();
        
        int id = Integer.parseInt(request.getParameter("id"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        String ubicacion = request.getParameter("ubicacion");
        int producto_id = Integer.parseInt(request.getParameter("producto_id"));
        
        Producto prod = daoProducto.buscar(producto_id);
        
        Inventario i = new Inventario();
        i.setId(id);
        i.setCantidad(cantidad);
        i.setUbicacion(ubicacion);
        i.setProductoId(prod);
        
        if (id > 0) {
            daoInventario.editar(i);
        } else {
            daoInventario.insertar(i);
        }
        
        response.sendRedirect("InventarioServlet");
    }
}
