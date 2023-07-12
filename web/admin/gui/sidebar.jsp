<%-- 
    Document   : sidebar
    Created on : May 30, 2023, 10:39:49 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    Dashboard Admin
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="has-sub">
                            <a href="../home">
                                <i class="fas fa-tachometer-alt"></i>Home</a>
                        </li>
                        <c:if test="${account.role.rid == 4}">
                            <li class="${page == 'user'?'active':''} ">
                                <a href="user-manager">
                                    <i class="fas fa-user"></i>User Manager</a>
                            </li>
                        </c:if>
                        <li class="${page == 'course'?'active':''} ">
                            <a href="course-manager">
                                <i class="fas fa-book"></i>Course Manager</a>
                        </li>
                        <li class="${page == 'class'?'active':''} ">
                            <a href="class-manager">
                                <i class="fas fa-graduation-cap"></i>Class Manager</a>
                        </li>
                        <li class="${page == 'lesson'?'active':''} ">
                            <a href="lession-manager">
                                <i class="fas fa-bookmark"></i>Lesson List</a>
                        </li>
                        <li class="${page == 'enroll'?'active':''} ">
                            <a href="enroll">
                                <i class="fas fa-shopping-cart"></i>Order List
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->
    </body>
</html>
