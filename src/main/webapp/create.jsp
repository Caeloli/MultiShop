<%-- 
    Document   : create
    Created on : 19 ene. 2023, 23:54:33
    Author     : caelo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@page import="java.util.List, com.mycompany.multishop.model.entity.User, com.mycompany.multishop.model.entity.Category, com.mycompany.multishop.model.entity.Product" %>
<%@page import="com.mycompany.multishop.model.dao.CategoryDAO" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>MultiFashion - Tienda de Abarrotes</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex mt-0">
                <div class="col-lg-4">
                    <a href="" class="text-decoration-none">
                        <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span>
                        <span class="h1 text-uppercase text-secondary bg-primary px-2 ml-n1">Fashion</span>
                    </a>
                </div>
                <div class="col-lg-4 col-6 text-left">
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products">
                            <div class="input-group-append">
                                <span class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4 col-6 text-right">
                    <p class="m-0">Servicio al Cliente</p>
                    <h5 class="m-0">+52 55268 37904</h5>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid bg-dark mb-30">
            <div class="row px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                        <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categorias</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                        <div class="navbar-nav w-100">
                            <%
                            CategoryDAO dao = new CategoryDAO();
                            List list = dao.readAll();
                            
                            for(int i=0; i<list.size(); i++){
                                Category category = (Category) list.get(i);
                            %>
                            <a href="ShopServlet?idCategory=<%=category.getIdCategory()%>" class="nav-item nav-link"><%=category.getName()%></a>
                            <%}%>
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                            <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Fashion</span>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="index.jsp" class="nav-item nav-link active">Inicio</a>
                                <a href="ShopServlet?idCategory=0" class="nav-item nav-link">Tienda</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <div class="btn-group mx-2">
                                    <% 
                                        System.out.println(request.getSession(false));
                                        if(request.getSession(false) != null){  
                                        HttpSession session = request.getSession(false);
                                        System.out.println(session.getAttribute("user"));
                                        User user = (User) session.getAttribute("user");
                                        System.out.println(user.getFirstName());
                                    %>
                                    <button type="button" class="btn btn-sm nav-link dropdown-toggle" data-toggle="dropdown"><%=(user.getFirstName()+ " " + user.getPaternalName())%></button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <% if(user.getType() == 1){ %>
                                        <a class="dropdown-item" type="button" href="CreateServlet">Crear Datos</a>
                                        <a class="dropdown-item" type="button" href="UpdateServlet">Modificar Datos</a>
                                        <a class="dropdown-item" type="button" href="DisplayServlet">Visualizar Datos</a>
                                        <%}%>
                                        <a class="dropdown-item" type="button" href="ModifyUserServlet">Detalles</a>
                                        <a class="dropdown-item" type="button" href="ExitSessionServlet">Salir</a>
                                    </div>                         
                                    <% }else{%>

                                    <button type="button" class="btn btn-sm nav-link dropdown-toggle" data-toggle="dropdown">Mi Cuenta</button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" type="button" href="LoginServlet">Ingresar</a>
                                        <a class="dropdown-item" type="button" href="register.jsp">Registrarse</a>
                                    </div>
                                    <% } %>
                                </div>
                                <%
                                if(request.getSession(false) != null){
                                %>
                                <a href="" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                </a>
                                <%}%>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="#">Inicio</a>
                        <span class="breadcrumb-item active">Crear</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Usert Start -->
        <div class="container-fluid">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Usuarios</span></h2>
            <div class="row px-xl-5">
                <div class="col-12 mb-5">
                    <div class="user-form bg-light p-30">
                        <div id="success"></div>
                        <form id="newUserForm" action="CreateUserServlet" method="POST">
                            <div class="control-group">
                                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap">
                                    <input type="text" class="form-control mb-3 mb-lg-0" name="newFirstName" id="newFirstName" placeholder="Primer Nombre"
                                           required="required" data-validation-required-message="Por favor coloque su primer nombre" />
                                    <input type="text" class="form-control mb-3 mb-lg-0" name="newPaternalName" id="newPaternalName" placeholder="Apellido Paterno"
                                           required="required" data-validation-required-message="Por favor coloque su apellido paterno" />
                                    <input type="text" class="form-control" name="newMaternalName" id="newMaternalName" placeholder="Apellido Materno"
                                           required="required" data-validation-required-message="Por favor coloque su apellido materno" />
                                </div>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="email" class="form-control" name="newEmail" id="newEmail" placeholder="Correo Electrónico"
                                       required="required" data-validation-required-message="Por favor coloque su correo electrónico" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Contraseña"
                                       required="required" data-validation-required-message="Por favor coloque su contraseña" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <select class="form-control" name="newType" id="newType">
                                    <option value="0">Usuario Normal</option>
                                    <option value="1">Usuario Administrador</option>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div>
                                <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Crear Usuario</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- User End -->

        <!-- Category Start -->
        <div class="container-fluid">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categorias</span></h2>
            <div class="row px-xl-5">
                <div class="col-lg-7 mb-5">
                    <div class="category-form bg-light p-30">
                        <div id="success"></div>
                        <form id="newCategoryForm" action="CreateCategoryServlet" method="POST" enctype="multipart/form-data">
                            <div class="control-group">
                                <input type="text" class="form-control" name="newCategoryName" id="newCategoryName" placeholder="Nombre Categoria"
                                       required="required" data-validation-required-message="Por favor coloque el nombre de la categoria" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <textarea class="form-control" rows="8" name="newDescription" id="newDescription" placeholder="Descripción"
                                          required="required"
                                          data-validation-required-message="Por favor coloque la descripcion"></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="file" class="form-control" accept="image/*" name="inputCategoryImg" id="inputCategoryImg" placeholder="Imagen" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div>
                                <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Crear Categoria</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 mb-5">
                    <div class="bg-light p-30 mb-30">
                        <img id="categoryImg" src="#" style="width: 100%; height: 250px;"/>
                    </div>
                </div>
            </div>
        </div>
        <!-- Category End -->       

        <!-- Product Start -->
        <div class="container-fluid">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Productos</span></h2>
            <div class="row px-xl-5">
                <div class="col-lg-7 mb-5">
                    <div class="category-form bg-light p-30">
                        <div id="success"></div>
                        <form id="newProductForm" action="CreateProductServlet" method="POST" enctype="multipart/form-data">
                            <div class="control-group">
                                <input type="text" class="form-control" id="newProductName" name="newProductName" placeholder="Nombre Producto"
                                       required="required" data-validation-required-message="Por favor coloque el nombre del producto" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <textarea class="form-control" rows="8" id="newDescription" name="newDescription" placeholder="Descripción"
                                          required="required"
                                          data-validation-required-message="Por favor coloque la descripcion"></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap">
                                    <input type="text" class="form-control" id="newPrice" name="newPrice" placeholder="Precio Producto"
                                           required="required" data-validation-required-message="Por favor coloque el precio del producto" />
                                    <input type="text" class="form-control" id="newQuantity" name="newQuantity" placeholder="Cantidad Producto"
                                           required="required" data-validation-required-message="Por favor coloque la cantidad del producto" />
                                </div>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <select class="form-control" name="newIdCategory" id="newIdCategory">
                                    <c:forEach var="category" items="${categories}">
                                        <option value="<c:out value="${category.idCategory}"></c:out>"><c:out value="${category.name}"></c:out></option>
                                    </c:forEach>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="file" class="form-control" accept="image/*" id="inputProductImg" name="inputProductImg" placeholder="Imagen" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div>
                                <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Crear Producto</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 mb-5">
                    <div class="bg-light p-30 mb-30">
                        <img id="productImg" src="#" style="width: 100%; height: 250px;"/>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product End --> 

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
                    <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor. Rebum tempor no vero est magna amet no</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                            <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Your Email Address">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary">Sign Up</button>
                                    </div>
                                </div>
                            </form>
                            <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                            <div class="d-flex">
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-secondary">
                        &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                        by
                        <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>

        <script>
            function readURL(input, displayImg) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $(displayImg).attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else {
                    alert('select a file to see preview');
                    $('#previewHolder').attr('src', '');
                }
            }

            $("#inputCategoryImg").change(function () {
                readURL(this, "#categoryImg");
            });
            
            $("#inputProductImg").change(function () {
                readURL(this, "#productImg");
            });

        </script>
    </body>

</html>