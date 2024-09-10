<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : PedAdmin
    Created on : 15/08/2024, 11:28:44 PM
--%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <title>Pedidos</title>
        <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
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
                        <a href="/Estanco_web/vista/VentasAdmin.jsp">
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
                <div class="container mt-5">
                        <h1>Usuarios</h1>
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <form class="d-flex" action="#" method="post">
                                <input class="form-control me-2" type="search" placeholder="idpedido" aria-label="Search" name="busqueda">
                                <button class="btn btn-success" type="submit">Buscar</button>
                            </form>
                        </div>
                        <div class="col-sm-6">
                            <form class="d-flex" action="#" method="post">
                                <select class="form-control me-2" name="busest" aria-label="Search">
                                    <option value="En Proceso">En Proceso</option>
                                    <option value="Despachado">Despachado</option>
                                    <option value="Entregado">Entregado</option>
                                </select>
                                <button class="btn btn-success" type="submit">Buscar</button>
                            </form>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-sm">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center">Id Pedido</th>
                                        <th class="text-center">Id Usuario</th>
                                        <th class="text-center">Id Pago</th>
                                        <th class="text-center">Fecha de Pago</th>
                                        <th class="text-center">Monto</th>
                                        <th class="text-center">Estado</th>
                                        <th class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td class="text-center">3</td>
                                        <td class="text-center">2</td>
                                        <td class="text-center">24/07/2022</td>
                                        <td class="text-center">$3334</td>
                                        <td class="text-center">Entregado</td>
                                        <td class="text-center">
                                            <button class="btn btn-info text-center" data-bs-toggle="modal" data-bs-target="#verModal"><i class="bi bi-eye"></i> Ver</button>
                                            <button class="btn btn-warning text-center" data-bs-toggle="modal" data-bs-target="#editarModal"><i class="bi bi-pencil"></i> Editar</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </div>

        <!-- Modales para Ver y Editar -->
        <!-- Modal Ver -->
        <div class="modal fade" id="verModal" tabindex="-1" aria-labelledby="verModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="verModalLabel">Detalles del Pedido</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Contenido de los detalles del pedido -->
                        <p>Pedido: 1</p>
                        <p>Fecha: 12/08/2024</p>
                        <p>Valor: $100.000</p>
                        <p>Estado: En Proceso</p>
                        <!-- Otros detalles del pedido -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Editar -->
        <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarModalLabel">Editar Pedido</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario para editar los detalles del pedido -->
                        <form>
                            <div class="mb-3">
                                <label for="pedidoId" class="form-label">ID Pedido</label>
                                <input type="text" class="form-control" id="pedidoId" value="1" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="pedidoFecha" class="form-label">Fecha</label>
                                <input type="date" class="form-control" id="pedidoFecha" value="2024-08-12">
                            </div>
                            <div class="mb-3">
                                <label for="pedidoValor" class="form-label">Valor</label>
                                <input type="text" class="form-control" id="pedidoValor" value="$100.000">
                            </div>
                            <div class="mb-3">
                                <label for="pedidoEstado" class="form-label">Estado</label>
                                <select class="form-control" id="pedidoEstado">
                                    <option value="En Proceso" selected>En Proceso</option>
                                    <option value="Despachado">Despachado</option>
                                    <option value="Entregado">Entregado</option>
                                </select>
                            </div>
                          
                            
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-cancel" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>
</html>
