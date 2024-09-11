<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Productos</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .contentmain h1 {
                border-bottom: 4px solid orange;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
            .table {
                background-color: #f8f9fa;
                border-radius: 8px;
                overflow: hidden;
            }
            .table thead {
                background-color: #343a40;
                color: white;
            }
            .table tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            .table tbody tr:hover {
                background-color: #e9ecef;
            }
            .table th, .table td {
                vertical-align: middle;
            }
            .btn-warning, .btn-danger {
                margin-right: 5px;
            }
            .modal-content {
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            .modal-header {
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            .modal-title {
                font-size: 1.25rem;
                font-weight: 500;
            }
            .btn-close {
                display: none;
            }
            .btn-cancel {
                background-color: #6c757d;
                border-color: #6c757d;
            }
            .btn-cancel:hover {
                background-color: #5a6268;
                border-color: #545b62;
            }
            .modal-body {
                padding: 2rem;
            }
            .modal-footer {
                border-top: 2px solid #dee2e6;
                padding: 1rem;
                display: flex;
                justify-content: flex-end;
            }
            .modal-footer .btn {
                margin-left: 0.5rem;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <aside class="sidebar">
                <div class="sidebar-header">
                    <img src="imagenes/logo.png" alt="CodingLab Logo" />
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
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h1>Productos</h1>
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

                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="text-center">Id</th>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Foto</th>
                                <th class="text-center">Descripcion</th>
                                <th class="text-center">Precio</th>
                                <th class="text-center">Stock</th>
                                <th class="text-center">Categoria</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">1</td>
                                <td class="text-center">Producto 1</td>
                                <td class="text-center">Foto Producto</td>
                                <td class="text-center">Prducto 1</td>
                                <td class="text-center">1000</td>
                                <td class="text-center">10</td>
                                <td class="text-center">1</td>
                                <td class="text-center">
                                    <a class="btn btn-warning" href="#" data-bs-toggle="modal" data-bs-target="#editProductModal"><i class="bi bi-pencil-fill"></i></a>
                                    <a class="btn btn-danger" href="#"><i class="bi bi-trash-fill"></i></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Modal para agregar producto -->
                <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addProductModalLabel">Agregar Producto</h5>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="productId" class="form-label">ID</label>
                                        <input type="text" class="form-control" id="productId" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productName" class="form-label">Nombre del Producto</label>
                                        <input type="text" class="form-control" id="productName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productQuantity" class="form-label">Stock</label>
                                        <input type="number" class="form-control" id="productQuantity" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productPrice" class="form-label">Precio</label>
                                        <input type="number" class="form-control" id="productPrice" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productCategory" class="form-label">Categoría</label>
                                        <input type="text" class="form-control" id="productCategory" required>
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

                <!-- Modal para editar producto -->
                <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProductModalLabel">Editar Producto</h5>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="editProductName" class="form-label">Nombre del Producto</label>
                                        <input type="text" class="form-control" id="editProductName" value="Producto A" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProductQuantity" class="form-label">Cantidad</label>
                                        <input type="number" class="form-control" id="editProductQuantity" value="50" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProductPrice" class="form-label">Precio</label>
                                        <input type="number" class="form-control" id="editProductPrice" value="100" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProductCategory" class="form-label">Categoría</label>
                                        <input type="text" class="form-control" id="editProductCategory" value="Electrónica" required>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
