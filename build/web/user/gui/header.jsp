<%-- 
    Document   : header.jsp
    Created on : May 28, 2023, 11:27:44 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>YOGA</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="user/assets/lib/animate/animate.min.css" rel="stylesheet">
        <link href="user/assets/lib/flaticon/font/flaticon.css" rel="stylesheet"> 
        <link href="user/assets/lib/owlcarousel/../user/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="user/assets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="user/assets/css/style.css" rel="stylesheet" type="text/css">
        <style>
            input:focus {
                outline: none !important;
            }
        </style>
    </head>
    <body>
        <!-- Top Bar Start -->
        <div class="top-bar d-none d-md-block">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="top-bar-left">
                            <div class="text">
                                <i class="far fa-clock"></i>
                                <h2>8:00 - 9:00</h2>
                                <p>Mon - Fri</p>
                            </div>
                            <div class="text">
                                <i class="fa fa-phone-alt"></i>
                                <h2>+123 456 7890</h2>
                                <p>For Appointment</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="top-bar-right">
                            <div class="social">
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                                <a href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Top Bar End -->

        <!-- Nav Bar Start -->
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a href="index.html" class="navbar-brand">Y<span>oo</span>ga</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between " style="flex-grow: 0" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="home" class="nav-item nav-link ${page == 'home'?'active':''}">Home</a>
                        <a href="class" class="nav-item nav-link ${page == 'class'?'active':''}" >Class</a>
                        <a href="trainer" class="nav-item nav-link ${page == 'trainer'?'active':''}">Trainer</a>
                        <a href="blog" class="nav-item nav-link ${page == 'blog'?'active':''}" >Blog</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${account == null?'Login':account.displayName}</a>
                            <div class="dropdown-menu">
                                <c:if test="${account == null}">
                                    <a href="home?action=login" class="dropdown-item">Login</a>
                                    <a href="home?action=register" class="dropdown-item">Register</a>
                                </c:if>
                                <c:if test="${account != null}">
                                    <c:if test="${account.role.rid > 2}">
                                        <a href="admin/user-manager" class="dropdown-item">Dashboard</a>
                                    </c:if>
                                    <a href="profile" class="dropdown-item">Profile</a>
                                    <a href="profile?action=password" class="dropdown-item">Change Password</a>
                                    <a href="home?action=logout" class="dropdown-item">Logout</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Nav Bar End -->

    </body>
</html>
