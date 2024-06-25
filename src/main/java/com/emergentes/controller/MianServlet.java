package com.emergentes.controller;

import com.emergentes.bean.BeanProducto;
import com.emergentes.entidades.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MianServlet", urlPatterns = {"/MianServlet"})
public class MianServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        BeanProducto daoProducto = new BeanProducto();

        if (action.equals("view")) {
            List<Producto> lista = daoProducto.listarTodos();
            request.setAttribute("productos", lista);
            request.getRequestDispatcher("Main.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
