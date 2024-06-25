package com.emergentes.bean;

import com.emergentes.entidades.Inventario;
import com.emergentes.jpa.InventarioJpaController;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BeanInventario {
    private EntityManagerFactory emf;
    private InventarioJpaController jpa;
    
    public BeanInventario() {
        emf = Persistence.createEntityManagerFactory("ProyectPU");
        jpa = new InventarioJpaController(emf);
    }
    
    public List<Inventario> listarTodos() {
        return jpa.findInventarioEntities();
    }
    
    public void insertar(Inventario i) {
        jpa.create(i);
    }
    
    public void editar(Inventario i) {
        try {
            jpa.edit(i);
        } catch (Exception ex) {
            Logger.getLogger(BeanInventario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminar(Integer id) {
        try {
            jpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(BeanInventario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Inventario buscar(Integer id) {
        return jpa.findInventario(id);
    }
}
