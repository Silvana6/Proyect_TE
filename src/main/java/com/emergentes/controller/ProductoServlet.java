package com.emergentes.controller;

import com.emergentes.bean.BeanCategoria;
import com.emergentes.bean.BeanProducto;
import com.emergentes.entidades.Categoria;
import com.emergentes.entidades.Producto;
import java.io.File;
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
import javax.servlet.http.Part;

@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        BeanProducto daoProducto = new BeanProducto();
        BeanCategoria daoCategoria = new BeanCategoria();
        Producto producto = new Producto();
        List<Categoria> listac;
        int id;
        
        switch (action) {
            case "add":
                listac = daoCategoria.listarTodos();
                request.setAttribute("categorias", listac);
                request.setAttribute("producto", producto);
                request.getRequestDispatcher("PNew-Edit.jsp").forward(request, response);
                break;

            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                producto = daoProducto.buscar(id);
                listac = daoCategoria.listarTodos();
                request.setAttribute("categorias", listac);
                request.setAttribute("producto", producto);
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
        String precioStr = request.getParameter("precio");
        BigDecimal precio = new BigDecimal(request.getParameter("precio"));

        int categoria_id = Integer.parseInt(request.getParameter("categoria_id"));

        Categoria cate = daoCategoria.buscar(categoria_id);

        Producto p = new Producto();
        p.setId(id);
        p.setNombre(nombre);
        p.setDescripcion(descripcion);
        p.setPrecio(precio);
        p.setCategoriaId(cate);

        // Manejar la subida de archivos
        Part filePart = request.getPart("imagen");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String savePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + fileName;
            File fileSaveDir = new File(savePath);
            filePart.write(savePath);
            p.setImagen(UPLOAD_DIR + "/" + fileName);
        }

        if (id > 0) {
            daoProducto.editar(p);
        } else {
            daoProducto.insertar(p);
        }

        response.sendRedirect("ProductoServlet");
    }
    
    private static final String UPLOAD_DIR = "images";

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}