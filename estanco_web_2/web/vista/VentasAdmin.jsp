<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <title>Inicio Administrador</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="/Estanco_web/css/admin.css" rel="stylesheet" type="text/css"/>
        
        
    </head>
    
    <%
        if (session.getAttribute("log") == null || session.getAttribute("log").equals('0')) {
           response.sendRedirect("../vista/Login.jsp");
        }
    %>
    <body>
        
        <div class="wrapper">
            <aside class="sidebar">
                <div class="sidebar-header">
                    <img src="images/logo.png" alt="CodingLab Logo" />
                    <h2>Estanco<br>Currambero</h2>
                </div>
                <ul class="sidebar-links">
                    <div class="menu-separator"></div>
                    <li>
                        <a href="#=inicio">
                            <i class="bi bi-house-door"></i> Inicio
                        </a>
                    </li>
                    <li>
                        <a href="/Estanco_web/vista/ListarProductos.jsp">
                            <i class="bi bi-grid"></i> Productos
                        </a>
                    </li>
                    <li>
                        <a href="/Estanco_web/vista/ListarUsuario.jsp">
                            <i class="bi bi-people"></i> Usuarios
                        </a>
                    </li>
                    <li>
                        <a href="/Estanco_web/vista/PedidosAdmin.jsp">
                            <i class="bi bi-box-seam"></i> Pedidos
                        </a>
                    </li>
                    <li>
                        <a href="/Estanco_web/vista/ListarProveedor.jsp">
                            <i class="bi bi-folder"></i> Proveedores
                        </a>
                    </li>
                    <li>
                        <a href="/Estanco_web/vista/Categorias.jsp">
                            <i class="bi bi-tags"></i> Categorias
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="bi bi-bar-chart"></i> Reportes
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="bi bi-question-circle"></i> Ayuda
                        </a>
                    </li>
                    <li>
                        <a href="/Estanco_web/CtrProducto?accion=salir">
                            <i class="bi bi-box-arrow-left"></i> Salir
                        </a>
                    </li>
                </ul>

                <div class="user-account">
                    <div class="user-profile">
                        <img src="images/profile-img.jpg" alt="Profile Image" />
                        <div class="user-detail">
                            <h3>Alejandra</h3>
                            <span>Administrador</span>
                        </div>
                    </div>
                </div>
            </aside>
            <main class="contentmain">
                <div class="content">
                    <div class="contentmaini">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="alert alert-custom">
                                    <h4 class="alert-heading">¡Hola, Administrador!</h4>
                                    <p class="mb-0">Aquí puedes gestionar los productos, usuarios, pedidos y más.</p>
                                    <p class="mb-0">Navega usando el menú lateral para acceder a las diferentes opciones.</p>
                                    <p class="mb-0">Si necesitas asistencia, por favor contacta al soporte o consulta la sección de <a href="#" class="text-light">Ayuda</a>.</p>
                                </div>
                            </div>
                            <div class="col-md-3 mb-4">
                                <div class="card bg-warning" style="border-radius: 0 15px 15px 0; margin-right: 20px;">
                                    <div class="card-body">
                                        <i class="bi bi-tags card-icon"></i>
                                        <h5 class="card-title">Categorías</h5>
                                        <p class="card-text">Gestiona las diferentes categorías de productos para una mejor organización.</p>
                                    </div>
                                    
                                </div>
                                
                            </div>
                        </div>
                        <div class="card-group">
                            <div class="card bg-primary">
                                <div class="card-body">
                                    <i class="bi bi-beer card-icon"></i>
                                    <h5 class="card-title">Productos</h5>
                                    <p class="card-text">Gestiona los productos disponibles en el estanco, incluyendo agregar, editar y eliminar productos.</p>
                                </div>
                            </div>
                            <div class="card bg-secondary">
                                <div class="card-body">
                                    <i class="bi bi-person-circle card-icon"></i>
                                    <h5 class="card-title">Usuarios</h5>
                                    <p class="card-text">Gestiona la información de los usuarios, incluyendo la asignación de roles y permisos.</p>
                                </div>
                            </div>
                            <div class="card bg-success">
                                <div class="card-body">
                                    <i class="bi bi-truck card-icon"></i>
                                    <h5 class="card-title">Pedidos</h5>
                                    <p class="card-text">Revisa y gestiona los pedidos realizados por los clientes. Asegúrate de seguir el estado de los pedidos.</p>
                                </div>
                            </div>
                            <div class="card bg-danger">
                                <div class="card-body">
                                    <i class="bi bi-people card-icon"></i>
                                    <h5 class="card-title">Proveedores</h5>
                                    <p class="card-text">Mantén actualizada la información de tus proveedores para una gestión eficiente.</p>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="card bg-info">
                                <div class="card-body">
                                    <i class="bi bi-info-circle card-icon"></i>
                                    <h5 class="card-title">Información Adicional</h5>
                                    <p class="card-text">Para asistencia adicional, consulta la sección de <a href="#" class="text-dark">Ayuda</a> o contacta a soporte. Revisa los reportes para obtener información detallada sobre el desempeño del negocio.</p>
                                </div>
                                
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </main>
            
        </div>   
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
    
</html>
