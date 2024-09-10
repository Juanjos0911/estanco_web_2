/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelo.Carrito;
import Modelo.Categoria;

import Modelo.CategoriaDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CtrProducto_1", urlPatterns = {"/CtrProducto_1"})
public class CtrProducto extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    List<Producto> productos = new ArrayList();
    List<Categoria> categorias = new ArrayList();
    List<Carrito> listacarrito = new ArrayList();
    Carrito car;
    Usuario us;
    int cantidad;
    int idp;
    int subtotal;
    int item;
    int totalpagar;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null || accion.isEmpty()) {
            // Si no se proporciona una acción, se asigna "inicio" como predeterminado
            accion = "inicio";
        }
        System.out.println("accion= " + accion);
        HttpSession sesion = request.getSession();
        productos = pdao.listar();
        categorias = cdao.Listar();
        Producto p = new Producto();
        switch (accion) {
            case "inicio":
                request.setAttribute("categoria", categorias);
                request.setAttribute("productos", productos);
                if (sesion.getAttribute("tipo") != null) {
                    System.out.println("Tipo en sesión: " + sesion.getAttribute("tipo"));
                    if (sesion.getAttribute("tipo").equals("Cliente")) {
                        System.out.println("Redireccionando a la vista del cliente");
                        request.getRequestDispatcher("/vista/VentasCliente.jsp").forward(request, response);
                    }else if(sesion.getAttribute("tipo").equals("Administrador")){
                        System.out.println("Redireccionando a la vista del Administrador");
                        request.getRequestDispatcher("/vista/VentasAdmin.jsp").forward(request, response);
                    }
                } else {
                    System.out.println("Atributo Tipo es null, redirigiendo a inicio");
                    request.getRequestDispatcher("/vista/Inicio.jsp").forward(request, response);
                }
                break;
            case "buscarcat":
                int idcat = Integer.parseInt(request.getParameter("catid"));
                productos = pdao.buscarcat(idcat);
                request.setAttribute("categorias", categorias);
                request.setAttribute("producto", productos);
                if (sesion.getAttribute("tipo") != null && sesion.getAttribute("tipo").equals("Cliente")) {
                    request.getRequestDispatcher("/Estanco_web/vista/VentasCliente.jsp").forward(request, response);
                } else {
                    System.out.println("Atributo Tipo es null, redirigiendo a inicio");
                    request.getRequestDispatcher("/Estanco_web/vista/Inicio.jsp").forward(request, response);
                }
                break;
            case "buscar":
                String nombre = request.getParameter("buscarr");
                productos = pdao.buscar(nombre);
                request.setAttribute("categorias", categorias);
                request.setAttribute("productos", productos);
                if (sesion.getAttribute("tipo") != null) {
                    System.out.println("Tipo en sesión: " + sesion.getAttribute("tipo"));
                    if (sesion.getAttribute("tipo").equals("Cliente")) {
                        System.out.println("Redireccionando a la vista del cliente");
                        request.getRequestDispatcher("/vista/VentasCliente.jsp").forward(request, response);
                    }
                } else {
                    System.out.println("Atributo Tipo es null, redirigiendo a inicio");
                    request.getRequestDispatcher("/vista/Inicio.jsp").forward(request, response);
                }
                break;
            case "AgregarCarrito":
                if (sesion.getAttribute("tipo") == null || !sesion.getAttribute("tipo").equals("Cliente")) {
                    System.out.println("El usuario no tiene permiso para agregar al carrito. Redirigiendo a Login.");
                    request.getRequestDispatcher("/vista/Login.jsp").forward(request, response);
                    return;
                }

                cantidad = 1;
                int pos = 0;

                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarid(idp);

                if (listacarrito.size() > 0) {
                    for (int i = 0; i < listacarrito.size(); i++) {
                        if (idp == listacarrito.get(i).getIdproducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listacarrito.get(pos).getIdproducto()) {
                        cantidad = cantidad + listacarrito.get(pos).getCantidad();
                        subtotal = cantidad * listacarrito.get(pos).getPreciocompra();
                        listacarrito.get(pos).setCantidad(cantidad);
                        listacarrito.get(pos).setSubtotal(subtotal);
                    } else {
                        item++;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdproducto(idp);
                        car.setNombre(p.getNombre());
                        car.setDescripcion(p.getDescripcion());
                        car.setFoto(p.getFoto());
                        car.setPreciocompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad * p.getPrecio());
                        listacarrito.add(car);
                    }
                } else {
                    item++;
                    car = new Carrito();
                    car.setItem(item);
                    car.setIdproducto(idp);
                    car.setNombre(p.getNombre());
                    car.setDescripcion(p.getDescripcion());
                    car.setFoto(p.getFoto());
                    car.setPreciocompra(p.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubtotal(cantidad * p.getPrecio());
                    listacarrito.add(car);
                }

                request.setAttribute("contador", listacarrito.size());
                request.getRequestDispatcher("CtrProducto?accion=inicio").forward(request, response);
                break;
            case "Carrito":
                if (sesion.getAttribute("tipo") == null) {
                    System.out.println("El usuario no ha iniciado sesión, redirigiendo a Login");
                    request.getRequestDispatcher("/vista/Login.jsp").forward(request, response);
                } else {
                    // Si el usuario ha iniciado sesión, se procede con la vista del carrito
                    totalpagar = 0;
                    for (int i = 0; i < listacarrito.size(); i++) {
                        totalpagar += listacarrito.get(i).getSubtotal();
                    }
                    request.setAttribute("totalpagar", totalpagar);
                    request.setAttribute("carrito", listacarrito);

                    System.out.println("Tipo en sesión: " + sesion.getAttribute("tipo"));
                    if (sesion.getAttribute("tipo").equals("Cliente")) {
                        System.out.println("Redireccionando a la vista del cliente");
                        request.getRequestDispatcher("/vista/Carrito.jsp").forward(request, response);
                    }
                }
                break;
            case "EliminarPro":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listacarrito.size(); i++) {
                    if (idproducto == listacarrito.get(i).getIdproducto()) {
                        listacarrito.remove(i);
                        break;
                    }
                }
                totalpagar = 0;
                for (Carrito item : listacarrito) {
                    totalpagar += item.getSubtotal();
                }
                request.setAttribute("totalpagar", totalpagar);
                request.setAttribute("carrito", listacarrito);
                request.getRequestDispatcher("/vista/Carrito.jsp").forward(request, response);
                break;
            case "verProducto":
                int idProducto = Integer.parseInt(request.getParameter("id"));
                Producto producto = pdao.obtenerProductoPorId(idProducto);
                request.setAttribute("producto", producto);
                request.getRequestDispatcher("/vista/ProductoDes.jsp").forward(request, response);
                break;
            case "ActualizarCant":
                int idpro = Integer.parseInt(request.getParameter("idp"));
                int can = Integer.parseInt(request.getParameter("cantidad"));
                for (Carrito item : listacarrito) {
                    if (idpro == item.getIdproducto()) {
                        item.setCantidad(can);
                        item.setSubtotal(item.getPreciocompra() * can);
                        break;
                    }
                }
                totalpagar = 0;
                for (Carrito item : listacarrito) {
                    totalpagar += item.getSubtotal();
                }
                request.setAttribute("totalpagar", totalpagar);
                request.setAttribute("carrito", listacarrito);
                request.getRequestDispatcher("/vista/Carrito.jsp").forward(request, response);
                break;

            case "salir":
                //HttpSession sesion = request.getSession();
                sesion.invalidate();
                response.sendRedirect("CtrProducto?accion=inicio");
                break;
            case "Ayuda":
                request.setAttribute("Ayuda", true);
                request.getRequestDispatcher("CtrProducto?accion=home").forward(request, response);
                break;
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
