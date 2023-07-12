<%-- 
    Document   : header
    Created on : May 30, 2023, 10:37:14 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Dashboard</title>

        <!-- Fontfaces CSS-->
        <link href="assets/css/font-face.css" rel="stylesheet" media="all">
        <link href="assets/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="assets/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="assets/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="assets/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="assets/vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
        <!-- Main CSS-->
        <link href="assets/css/theme.css" rel="stylesheet" media="all">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <style>
            input:focus {
                outline: none !important;
            }
            
            a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <header class="header-desktop">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="header-wrap"  style="float: right; position: relative;">
                        <div class="header-button ">
                            <div class="account-wrap"">
                                <div class="account-item clearfix js-item-menu">
                                    <div class="image">
                                        <img src="../${account.avatar}" alt="John Doe" />
                                    </div>
                                    <div class="content">
                                        <a class="js-acc-btn" href="#">${account.displayName}</a>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="../${account.avatar}"/>
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="#">${account.displayName}</a>
                                                </h5>
                                                <span class="email">${account.email}</span>
                                            </div>
                                        </div>
                                        <div class="account-dropdown__body">
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-account"></i>Account</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-settings"></i>Setting</a>
                                            </div>
                                        </div>
                                        <div class="account-dropdown__footer">
                                            <a href="../home?action=logout">
                                                <i class="zmdi zmdi-power"></i>Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div aria-live="polite" aria-atomic="true" style="position: relative;">
                <div style="position: absolute; right: 2.5rem; top:  5rem; z-index: 100">
                    <div id="toasts" class="toast fade" data-delay="5000">
                        <div class="toast-body" style="background-color: ${sessionScope.messageColor}; color: white">
                            ${message}
                            <button type="button" class="ml-2 mb-1 btn close" data-dismiss="toast" aria-label="Close">
                                <span aria-hidden="true" style="color: white">&times;</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="message" hidden="">${sessionScope.message}</div>

            <%
                session.removeAttribute("message");
                session.removeAttribute("messageColor");
            %>
        </header>
    </body>
</html>
