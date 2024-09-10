<%-- 
    Document   : ListarUsuario
    Created on : 14/08/2024, 11:59:34 AM
    Author     : SENA
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Usuarios</title>
        <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
    </head>
    <%---
        if (session.getAttribute("log") == null || session.getAttribute("log").equals('0')){
            response.sendRedirect("../vista/Login.jsp");
        }
    ---%>
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
                        <a href="/estanco_web_2/vista/VentasAdmin.jsp">
                            <i class="bi bi-house-door"></i> Inicio
                        </a>
                    </li>
                    <li>
                        <a href="/estanco_web_2/vista/ListarProductos.jsp">
                            <i class="bi bi-grid"></i> Productos
                        </a>
                    </li>
                    <li>
                        <a href="/estanco_web_2/vista/ListarUsuario.jsp">
                            <i class="bi bi-people"></i> Usuarios
                        </a>
                    </li>
                    <li>
                        <a href="/estanco_web_2/vista/PedidosAdmin.jsp">
                            <i class="bi bi-box-seam"></i> Pedidos
                        </a>
                    </li>
                    <li>
                        <a href="/estanco_web_2/vista/ListarProveedor.jsp">
                            <i class="bi bi-folder"></i> Proveedores
                        </a>
                    </li>
                    <li>
                        <a href="/estanco_web_2/vista/Categorias.jsp">
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
                        <a href="/estanco_web_2/CtrProducto?accion=salir">
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
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h1>Usuarios</h1>
                        <form class="form-inline mt-4 mb-4" action="#">
                            <div class="input-group">
                                <input type="text" class="form-control form-control-sm" name="txtbuscar" placeholder="Digite nombre">
                                <button type="submit" class="btn btn-success" name="accion" value="buscar">
                                    <i class="bi bi-search"></i> Buscar
                                </button>
                            </div>
                        </form>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
                            <i class="bi bi-plus-square"></i>
                        </button>
                    </div>
                    <div class="row mt-3">
                        <div class="col-sm">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center">Id</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Apellido</th>
                                        <th class="text-center">Fecha de Nacimiento</th>
                                        <th class="text-center">Dirección</th>
                                        <th class="text-center">Telefono</th>
                                        <th class="text-center">Correo</th>
                                        <th class="text-center">Usuario</th>
                                        <th class="text-center">Tipo</th>
                                        <th class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td class="text-center">Usuario</td>
                                        <td class="text-center">Usuario</td>
                                        <td class="text-center">Usuario</td>
                                        <td class="text-center">Usuario</td>
                                        <td class="text-center">Usuario</td>
                                        <td class="text-center">Usuario</td>
                                        <td class="text-center">Usuario</td>
                                        <td class="text-center">Usuario</td>
                                        <td class="text-center">
                                            <a class="btn btn-warning" href="#" data-bs-toggle="modal" data-bs-target="#editProductModal"><i class="bi bi-pencil-fill"></i></a>
                                            <a class="btn btn-danger" href="#"><i class="bi bi-trash-fill"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Modal para agregar usuario -->
                <div class="modal fade" id="agregarUsuarioModal" tabindex="-1" aria-labelledby="agregarUsuarioModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="agregarUsuarioModalLabel">Agregar Usuario</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="userId" class="form-label">Id</label>
                                        <input type="text" class="form-control" id="id" name="id" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userName" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userLastName" class="form-label">Apellido</label>
                                        <input type="text" class="form-control" id="apellido" name="apellido" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userAddress" class="form-label">Dirección</label>
                                        <input type="text" class="form-control" id="direccion" name="direccion" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userPhone" class="form-label">Teléfono</label>
                                        <input type="text" class="form-control" id="telefono" name="telefono" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userBirthDate" class="form-label">Fecha Nacimiento</label>
                                        <input type="date" class="form-control" id="fechanaci" name="fechanaci" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userEmail" class="form-label">Correo</label>
                                        <input type="email" class="form-control" id="correo" name="correo" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userUsername" class="form-label">Usuario</label>
                                        <input type="text" class="form-control" id="usuario" name="usuario" required>
                                    </div>
                                    <div class="mb-3" id="grupo_tipo">
                                        <label for="id" class="formulario_label">Tipo</label> 
                                        <div class="formulario_grupo-input">
                                            <select class="form control formulario_input" name="tipo">
                                                <option value="Administrador">Administrador</option> 
                                                <option value="Usuario">Usuario</option> 
                                                <option value="Invitado">Invitado</option> 
                                                <option value="Cliente">Cliente</option> 
                                            </select><br>
                                        </div><br>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para editar usuario -->
                <div class="modal fade" id="editarUsuarioModal" tabindex="-1" aria-labelledby="editarUsuarioModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editarUsuarioModalLabel">Editar Usuario</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="editUserId" class="form-label">Id</label>
                                        <input type="text" class="form-control" id="editUserId" value="1" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editUserName" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="editUserName" value="Juan" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editUserLastName" class="form-label">Apellido</label>
                                        <input type="text" class="form-control" id="editUserLastName" value="Pérez" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editUserAddress" class="form-label">Dirección</label>
                                        <input type="text" class="form-control" id="editUserAddress" value="Calle Falsa 123" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editUserPhone" class="form-label">Teléfono</label>
                                        <input type="text" class="form-control" id="editUserPhone" value="555-1234" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editUserBirthDate" class="form-label">Fecha Nacimiento</label>
                                        <input type="date" class="form-control" id="editUserBirthDate" value="1990-01-01" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editUserEmail" class="form-label">Correo</label>
                                        <input type="email" class="form-control" id="editUserEmail" value="juan@gmail.com" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editUserUsername" class="form-label">Usuario</label>
                                        <input type="text" class="form-control" id="editUserUsername" value="juanp" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editUserType" class="form-label">Tipo</label>
                                        <input type="text" class="form-control" id="editUserType" value="Admin" required>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-rbsA0bDhUn/TxU+0bD6I4BO15AVY8l+t9f/4coiTrTWGFj1PSJrAKFENIG+9j2N" crossorigin="anonymous"></script>
    
    </body>
    
</html>

