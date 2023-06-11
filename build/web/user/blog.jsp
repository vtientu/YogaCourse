<%-- 
    Document   : blog
    Created on : May 29, 2023, 12:01:31 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="gui/header.jsp" %>
    </head>

    <body>
        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Yoga Blog</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Yoga Blog</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Blog Start -->
        <div class="blog">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>From Blog</p>
                    <h2>Latest Yoga Articles</h2>
                </div>
                <div class="row blog-page">
                    <c:forEach items="${listBlog}" var="listb">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                            <div class="blog-item">
                                <div class="blog-img">
                                    <img src="${listb.image}" alt="Blog">
                                </div>
                                <div class="blog-text">
                                    <h2>${listb.title}</h2>
                                    <div class="blog-meta">
                                        <p><i class="far fa-user"></i>${listb.createBy.displayName}</p>
                                    </div>
                                    <a class="btn" href="">Read More <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <nav aria-label="Page navigation" class="d-flex justify-content-center wow fadeInUp" data-wow-delay="1s">
                    <ul class="pagination justify-content-center font-weight-bold">
                        <li class="page-item">
                            <c:if test="${pageNo > 1}">
                                <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1)">Start</i></button>
                            </c:if>
                        </li>
                        <li class="page-item">
                            <c:if test="${pageNo > 1}">
                                <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}')"></i></button>
                                </c:if>
                        </li>
                        <c:forEach var="page" begin="1" end="${totalPages}">
                            <li aria-current="page" class="page-item ${pageNo == page? 'active' :''}">
                                <c:choose>
                                    <c:when test="${page == pageNo}">
                                        <button class="page-link page-number">${page}</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="page-link page-number" onclick="onPage('${page}')">${page}</button>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <c:if test="${not empty listBlog && pageNo != totalPages}">
                                <button class="page-link" onclick="onPage(${pageNo+1})"><i class="fas fa-angle-right"></i>
                                </button>
                            </c:if>
                        </li>
                        <li class="page-item">
                            <c:if test="${not empty listBlog && pageNo != totalPages}">
                                <button class="page-link" onclick="onPage('${totalPages}')"><i class="fas fa-angles-right">End</i></button>
                            </c:if>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- Blog End -->


        <!-- Footer Start -->
        <%@include file="gui/footer.jsp" %>
        <script>
            function onPage(pageNo) {
                window.location.href = `trainer?pageNo=` + pageNo;
            }
        </script>
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    </body>
</html>

