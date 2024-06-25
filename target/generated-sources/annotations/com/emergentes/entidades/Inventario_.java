package com.emergentes.entidades;

import com.emergentes.entidades.Producto;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-06-24T23:41:48")
@StaticMetamodel(Inventario.class)
public class Inventario_ { 

    public static volatile SingularAttribute<Inventario, String> ubicacion;
    public static volatile SingularAttribute<Inventario, Producto> productoId;
    public static volatile SingularAttribute<Inventario, Integer> id;
    public static volatile SingularAttribute<Inventario, Integer> cantidad;

}