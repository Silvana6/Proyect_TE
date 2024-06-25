package com.emergentes.bean;

import com.emergentes.entidades.Categoria;
import com.emergentes.jpa.CategoriaJpaController;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BeanCategoria {
    private EntityManagerFactory emf;
    private CategoriaJpaController jpa;
    
    public BeanCategoria() {
        emf = Persistence.createEntityManagerFactory("ProyectPU");
        jpa = new CategoriaJpaController(emf);
    }
    
    public List<Categoria> listarTodos() {
        return jpa.findCategoriaEntities();
    }
    
    public void insertar(Categoria c) {
        jpa.create(c);
    }
    
    public void editar(Categoria c) {
        try {
            jpa.edit(c);
        } catch (Exception ex) {
            Logger.getLogger(BeanCategoria.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminar(Integer id) {
        try {
            jpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(BeanCategoria.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Categoria buscar(Integer id) {
        return jpa.findCategoria(id);
    }
}
