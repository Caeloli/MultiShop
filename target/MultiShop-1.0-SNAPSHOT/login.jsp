<%-- 
    Document   : login
    Created on : 16 ene. 2023, 01:27:21
    Author     : caelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

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

<body style="height: 100vh;">

    <div class="container-fluid h-100">
        <div class="row d-flex mb-lg-4 align-items-center">
            <div class="col-md-6">
                <div class="title-header my-5 d-flex justify-content-center">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span>
                    <span class="h1 text-uppercase text-secondary bg-primary px-2 ml-n1">Shop</span>
                </div>
            </div>
        </div>

        <div class="row mt-5 pt-5">
            <div class="col-12 col-md-6 row mt-5 mx-0">
                <div class="col-12 col-md-8 col-lg-6 mx-auto">
                    <h2 class="text-uppercase text-center">Login</h2>
                    <form action="LoginServlet" method="post">
                        <div class="mb-3">
                            <label for="inputEmail">Correo Electrónico</label>
                            <input type="email" name="inputEmail" id="inputEmail" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="inputPassword">Contraseña</label>
                            <input type="password" name="inputPassword" id="inputPassword" class="form-control">
                            <div id="passwordRecover" class="form-text"><a href="">¿Olvidó su contraseña?</a></div>
                        </div>
                        <div class="mb-3">
                            <input type="submit" value="Acceder" class="form-control btn btn-primary rounded">
                        </div>
                        <div class="mb-3">
                            <p><c:out value="${sessionOperation}"></c:out></p>
                            <c:choose>
                                <c:when test="${sessionOperation == 0}">
                                    <p class="text-danger">No existe ningún correo registrado</p>
                                </c:when>
                                <c:when test="${sessionOperation == 1}">
                                    <p class="text-danger">La contraseña es incorrecta</p>
                                </c:when>
                            </c:choose>
                        </div>
                    </form>
                    <div class="text-center">
                        <p class="mb-0">¿Aún no te has registrado? </p>
                        <a href="register.jsp" class="">Registrate Ahora</a>
                    </div>
                </div>
            </div>
            <div class="col-0 col-sm-6 mt-5 mx-0 row d-md-flex justify-content-center d-none">
                <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0 col-12 col-md-10" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#header-carousel" data-slide-to="1"></li>
                        <li data-target="#header-carousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item position-relative active" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="img/carousel-1.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 400px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Moda para el Hombre</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="img/carousel-2.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 400px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Moda para la Mujer</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="img/carousel-3.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 400px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Moda para el Infante</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



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