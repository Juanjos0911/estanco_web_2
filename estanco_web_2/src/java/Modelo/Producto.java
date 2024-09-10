/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 */
public class Producto {
    private int Id;
    private String Nombre;
    private String Foto;
    private String Descripcion;
    private String Fecha_vencimiento;
    private int Precio;
    private int Stock;
    private int Categoria;
    private int Id_proveedor;

    public Producto() {
    }

    public Producto(int Id, String Nombre, String Foto, String Descripcion, String Fecha_vencimiento, int Precio, int Stock, int Categoria, int Id_proveedor) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.Foto = Foto;
        this.Descripcion = Descripcion;
        this.Fecha_vencimiento = Fecha_vencimiento;
        this.Precio = Precio;
        this.Stock = Stock;
        this.Categoria = Categoria;
        this.Id_proveedor = Id_proveedor;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getFecha_vencimiento() {
        return Fecha_vencimiento;
    }

    public void setFecha_vencimiento(String Fecha_vencimiento) {
        this.Fecha_vencimiento = Fecha_vencimiento;
    }

    public int getPrecio() {
        return Precio;
    }

    public void setPrecio(int Precio) {
        this.Precio = Precio;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

    public int getCategoria() {
        return Categoria;
    }

    public void setCategoria(int Categoria) {
        this.Categoria = Categoria;
    }

    public int getId_proveedor() {
        return Id_proveedor;
    }

    public void setId_proveedor(int Id_proveedor) {
        this.Id_proveedor = Id_proveedor;
    }
    
}
