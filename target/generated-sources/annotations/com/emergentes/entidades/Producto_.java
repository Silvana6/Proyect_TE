package com.emergentes.entidades;

import com.emergentes.entidades.Categoria;
import com.emergentes.entidades.Inventario;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-06-24T23:41:48")
@StaticMetamodel(Producto.class)
public class Producto_ { 

    public static volatile SingularAttribute<Producto, String> descripcion;
    public static volatile SingularAttribute<Producto, BigDecimal> precio;
    public static volatile ListAttribute<Producto, Inventario> inventarioList;
    public static volatile SingularAttribute<Producto, String> imagen;
    public static volatile SingularAttribute<Producto, Integer> id;
    public static volatile SingularAttribute<Producto, String> nombre;
    public static volatile SingularAttribute<Producto, Categoria> categoriaId;

}