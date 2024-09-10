/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Configuracion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class ProductoDAO {

    Connection con;
    PreparedStatement pstm;
    Conectar Conexion;
    ResultSet rs;

    public List listar() {
        List<Producto> producto = new ArrayList();
        try {
            Conexion = new Conectar();
            Connection con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexion con la base de datos");

            }
            pstm = con.prepareStatement("select * from producto where Stock >0");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setFoto(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setFecha_vencimiento(rs.getString(5));
                p.setPrecio(rs.getInt(6));
                p.setStock(rs.getInt(7));
                p.setCategoria(rs.getInt(8));
                p.setId_proveedor(rs.getInt(9));
                producto.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return producto;
    }

    public List buscarcat(int idcat) {
        List<Producto> producto = new ArrayList();
        try {
            Conexion = new Conectar();
            Connection con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexion con la base de datos");

            }
            pstm = con.prepareStatement("select * from producto where Stock >0 and Categoria = ?");
            pstm.setInt(1, idcat);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setFoto(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setFecha_vencimiento(rs.getString(5));
                p.setPrecio(rs.getInt(6));
                p.setStock(rs.getInt(7));
                p.setCategoria(rs.getInt(8));
                p.setId_proveedor(rs.getInt(9));
                producto.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos por categoria " + e);
        }
        return producto;
    }

    public Producto listarid(int idp) {
        Producto p = new Producto();
        try {
            Conexion = new Conectar();
            Connection con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("select * from producto where Stock >0 and id = ?");
            pstm.setInt(1, idp);
            rs = pstm.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setFoto(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getInt(5));
                p.setStock(rs.getInt(6));
            }

        } catch (Exception e) {
            System.out.println("Error al listar los productos " + e);
        }
        return p;
    }

    public Producto obtenerProductoPorId(int idp) {
        Producto p = new Producto();
        try {
            Conexion = new Conectar();
            con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexión con la base de datos");
            }
            pstm = con.prepareStatement("SELECT * FROM producto WHERE id = ?");
            pstm.setInt(1, idp);
            rs = pstm.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setFoto(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setFecha_vencimiento(rs.getString(5));
                p.setPrecio(rs.getInt(6));
                p.setStock(rs.getInt(7));
                p.setCategoria(rs.getInt(8));
                p.setId_proveedor(rs.getInt(9));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener el producto por ID " + e);
        }
        return p;
    }

    public List buscar(String nombre) {
        List<Producto> producto = new ArrayList();
        try {
            Conexion = new Conectar();
            Connection con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            nombre = "%" + nombre + "%";
            pstm = con.prepareStatement("select * from producto where Stock >0 and Nombre like ?");
            pstm.setString(1, nombre);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setFoto(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setFecha_vencimiento(rs.getString(5));
                p.setPrecio(rs.getInt(6));
                p.setStock(rs.getInt(7));
                p.setCategoria(rs.getInt(8));
                p.setId_proveedor(rs.getInt(9));
                producto.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al buscar los productos" + e);
        }
        return producto;
    }
}
