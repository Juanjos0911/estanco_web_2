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
public class CategoriaDAO {
    Connection con;
    PreparedStatement pstm;
    Conectar Conexion;
    ResultSet rs;
    
    public List Listar(){
        List<Categoria> categoria = new ArrayList();
        try {
            Conexion = new Conectar();
            Connection con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexion con la base de datos");

            }
            pstm = con.prepareStatement("select * from categoria");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setDescripcion(rs.getString(3));
                categoria.add(c);
            }

        } catch (Exception e) {
            System.out.println("Error al listar las categorias " + e);
        }
        return categoria;
    }
     public boolean crear(Categoria cat){
        try{
            Conexion = new Conectar();
            Connection con = Conexion.crearconexion();
            if (con != null) {
                System.out.println("Se ha establecido una conexcion con la base de datos");

            }
            pstm = con.prepareStatement("insert into categoria (nombre, descripcion, ofertas) Value(?,?,?)");
            
            pstm.setInt(1, cat.getId());
            System.out.println(cat.getId());
            pstm.setString(2, cat.getNombre());
            System.out.println(cat.getNombre());
            pstm.setString(3, cat.getDescripcion());
            System.out.println(cat.getDescripcion());
            pstm.executeUpdate();
            return true;
        }catch(Exception e){
             System.out.println("Error al crear los productos" + e);
             return false;
        }
    }

    public void eliminar(String id) {
        
    }
}
