/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

public class CtrValidar extends HttpServlet {
    
   

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UsuarioDAO usudao = new UsuarioDAO();
    Usuario us = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrValidar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrValidar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    private static final long serialVersionUID = 1L;

    // Método para verificar la contraseña
    public static boolean verificarcontrasena(String password, String contrasenaencriptada) {
        return BCrypt.checkpw(password, contrasenaencriptada);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("Ingresar")) {
            HttpSession sesion = request.getSession();
            String usu = request.getParameter("txtuser");
            String pas = request.getParameter("txtpass");

            // Validar el usuario con el DAO
            UsuarioDAO usudao = new UsuarioDAO(); // Asegúrate de instanciar correctamente
            Usuario us = usudao.validar(usu, pas);

            if (us != null && us.getUsuario() != null) {
                // Verificar la contraseña encriptada
                boolean verificarpassword = verificarcontrasena(pas, us.getContrasena());
                if (verificarpassword) {
                    sesion.setAttribute("log", '1');
                    sesion.setAttribute("User", us.getUsuario());
                    sesion.setAttribute("tipo", us.getTipo());
                    sesion.setAttribute("id", us.getId());
                    sesion.setAttribute("correo", us.getCorreo());
                    sesion.setAttribute("usuario", us);

                    if (us.getTipo().equals("Administrador")) {
                        response.sendRedirect("/estanco_web_2/CtrProducto?accion=inicio");
                    } else if (us.getTipo().equals("Cliente")) {
                        response.sendRedirect("/estanco_web_2/CtrProducto?accion=inicio");
                    }
                } else {
                    response.sendRedirect("/vista/Login.jsp?ingreso=0");
                }
            } else {
                response.sendRedirect("/vista/Login.jsp?ingreso=0");
            }
        }
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
