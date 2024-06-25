package com.emergentes.bean;

import com.emergentes.entidades.Producto;
import com.emergentes.jpa.ProductoJpaController;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BeanProducto {
    private EntityManagerFactory emf;
    private ProductoJpaController jpa;
    
    public BeanProducto() {
        emf = Persistence.createEntityManagerFactory("ProyectPU");
        jpa = new ProductoJpaController(emf);
    }
    
    public List<Producto> listarTodos() {
        return jpa.findProductoEntities();
    }
    
    public void insertar(Producto p) {
        jpa.create(p);
    }
    
    public void editar(Producto p) {
        try {
            jpa.edit(p);
        } catch (Exception ex) {
            Logger.getLogger(BeanProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminar(Integer id) {
        try {
            jpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(BeanProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Producto buscar(Integer id) {
        return jpa.findProducto(id);
    }
}
