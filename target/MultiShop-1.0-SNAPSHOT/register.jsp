<%-- 
    Document   : register
    Created on : 16 ene. 2023, 01:28:58
    Author     : caelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@page import="java.util.List, com.mycompany.multishop.model.entity.User, com.mycompany.multishop.model.entity.Category, com.mycompany.multishop.model.entity.Product" %>
<%@page import="com.mycompany.multishop.model.dao.CategoryDAO" %>
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
                    <span class="breadcrumb-item active">Registro</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Register Start -->
    <div class="container-fluid">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span
                class="bg-secondary pr-3">Registro</span></h2>
        <div class="row px-xl-5">
            <div class="col-lg-12 mb-5">
                <div class="register-form bg-light p-30">
                    <div id="success"></div>
                    <form name="registerUser" action="RegisterServlet" method="post">
                        <div class="control-group">
                            <label for="inputNewEmail">Email</label>
                            <input type="email" class="form-control" id="inputNewEmail" name="inputNewEmail" placeholder="Su Email"
                                required="required" data-validation-required-message="Por favor, ingrese su email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <label for="">Nombre</label>
                            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap">
                                <input type="text" class="form-control" name="inputNewFirstName" id="inputNewFirstName"
                                    placeholder="Su Nombre " required="required"
                                    data-validation-required-message="Por favor, ingrese su primer nombre" />
                                <input type="text" class="form-control" name="inputNewPaternalLastName" id="inputPaternalLastName"
                                    placeholder="Su Apellido Paterno" required="required"
                                    data-validation-required-message="Por favor, ingrese su apellido paterno" />
                                <input type="text" class="form-control" name="inputNewMaternalLastName" id="inputNewMaternalLastName"
                                    placeholder="Su Apellido Materno" required="required"
                                    data-validation-required-message="Por favor, ingrese su apellido materno" />
                            </div>
                            <p class="help-block text-danger"></p>

                        </div>
                        <div class="control-group">
                            <label for="inputNewPassword">Contraseña</label>
                            <input type="password" class="form-control" name="inputNewPassword" id="inputNewPassword"
                                placeholder="Su Contraseña" required="required"
                                data-validation-required-message="Por favor, ingrese su contraseña">
                            <p class="help-block text-danger"></p>
                        </div>
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Crear Cuenta</button>
                        </div>
                        
                        <div class="control-group bg-danger mt-2 d-none d-block">
                            <h3 class="form-control text-center">Ya se ha enviado un correo a esta cuenta. Favor de Verificar.</h3>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <h5 class="text-secondary text-uppercase mb-4">Póngase en Contacto</h5>
                <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor.
                    Rebum tempor no vero est magna amet no</p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Gustavo A. Madero, 07320 Ciudad de
                    México, CDMX</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>caeloleame@gmail.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+52 55 2683 7904</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Inicio</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Nuestra
                                Tienda</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Carrito</a>
                            <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contáctanos</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Inicio</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Nuestra
                                Tienda</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Carrito</a>
                            <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contáctanos</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                        <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Su Dirección de Email">
                                <div class="input-group-append">
                                    <button class="btn btn-primary">Suscribirse</button>
                                </div>
                            </div>
                        </form>
                        <h6 class="text-secondary text-uppercase mt-4 mb-3">Síganos</h6>
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
</body>

</html>