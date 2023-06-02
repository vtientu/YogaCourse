
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
                        <h2>Class</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Class</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Class Start -->
        <div class="class">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Our Classes</p>
                    <h2>Yoga Class Shedule</h2>
                </div>
                <div class="row">
                    <div class="col-12">
                        <ul id="class-filter">
                            <li class="${cid == 0?'filter-active':''}" onclick="ChangeCategory(0)" >All Classes</li>
                                <c:forEach items="${listCate}" var="lcate">
                                <li class="${lcate.categoryID == cid?'filter-active':''}" onclick="ChangeCategory(${lcate.categoryID})" >${lcate.categoryName}</li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
                <c:if test="${listClass.size() > 0}">
                    <div class="row class-container">
                        <c:forEach items="${listClass}" var="listc">
                            <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="1s">
                                <div class="class-wrap">
                                    <div class="class-img">
                                        <img src="user/assets/img/class-1.jpg" alt="Image">
                                    </div>
                                    <div class="class-text">
                                        <div class="class-teacher">
                                            <img src="user/assets/img/teacher-1.png" alt="Image">
                                            <h3>${listc.trainer.displayName}</h3>
                                            <a href="">+</a>
                                        </div>
                                        <h2>${listc.className}</h2>
                                        <div class="class-meta">
                                            <p><i class="far fa-calendar-alt"></i>Sun, Tue, Thu</p>
                                            <p><i class="far fa-clock"></i>9:00 - 10:00</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <nav aria-label="Page navigation" class="d-flex justify-content-center wow fadeInUp" data-wow-delay="1s">
                        <ul class="pagination justify-content-center font-weight-bold">
                            <li class="page-item">
                                <c:if test="${pageNo > 1}">
                                    <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1, '${cid}')">Start</i></button>
                                </c:if>
                            </li>
                            <li class="page-item">
                                <c:if test="${pageNo > 1}">
                                    <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}', '${cid}')"></i></button>
                                    </c:if>
                            </li>
                            <c:forEach var="page" begin="1" end="${totalPages}">
                                <li aria-current="page" class="page-item ${pageNo == page? 'active' :''}">
                                    <c:choose>
                                        <c:when test="${page == pageNo}">
                                            <button class="page-link page-number">${page}</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="page-link page-number" onclick="onPage('${page}', '${cid}')">${page}</button>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <li class="page-item">
                                <c:if test="${not empty listClass && pageNo != totalPages}">
                                    <button class="page-link" onclick="onPage(${pageNo+1}, '${cid}')"><i class="fas fa-angle-right"></i>
                                    </button>
                                </c:if>
                            </li>
                            <li class="page-item">
                                <c:if test="${not empty listClass && pageNo != totalPages}">
                                    <button class="page-link" onclick="onPage('${totalPages}', '${cid}')"><i class="fas fa-angles-right">End</i></button>
                                </c:if>
                            </li>
                        </ul>
                    </nav>
                </c:if>
                <c:if test="${listClass.size() == 0}">
                    <h2 class="text-center">List Class is empty.</h2>
                </c:if>
            </div>
        </div>
        <!-- Class End -->


        <!-- Discount Start -->
        <div class="discount wow zoomIn" data-wow-delay="0.1s" style="margin-bottom: 90px;">
            <div class="container">
                <div class="section-header text-center">
                    <p>Awesome Discount</p>
                    <h2>Get <span>30%</span> Discount for all Classes</h2>
                </div>
                <div class="container discount-text">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem. Curabitur non nisl nec nisi scelerisque maximus. 
                    </p>
                    <a class="btn">Join Now</a>
                </div>
            </div>
        </div>
        <!-- Discount End -->


        <!-- Footer Start -->
        <%@include file="gui/footer.jsp" %>
        <script>
            function onPage(pageNo, cid) {
                window.location.href = `class?pageNo=` + pageNo + `&&cid=` + cid;
            }

            function ChangeCategory(cateID) {
                window.location.href = `class?cid=` + cateID;
            }
        </script>
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    </body>
</html>
