
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
                <div class="w-25 input-group mb-3 wow fadeInUp" data-wow-delay="0.2s" style="margin-left: auto">
                    <input name="search" value="${search}" id="keySearch" type="text" class="form-control" placeholder="Search trainer..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button onclick="search()" class="btn btn-secondary"><i class="fas fa-search"></i></button>
                    </div>
                </div>
                <c:if test="${listClass.size() > 0}">
                    <div class="row class-container">
                        <c:forEach items="${listClass}" var="listc">
                            <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="1s">
                                <div class="class-wrap">
                                    <div class="class-img">
                                        <img src="${listc.course.image}" alt="Image">
                                    </div>
                                    <div class="class-text">
                                        <div class="class-teacher">
                                            <img src="${listc.trainer.avatar}" alt="Image">
                                            <h3>${listc.trainer.displayName}</h3>
                                        </div>
                                        <h2><a style="text-decoration: none;" href="class-details?cid=${listc.classID}">${listc.className} - ${listc.course.courseName}</a></h2>
                                        <div class="class-meta">
                                            <h4>Price: <strong>${listc.course.price}$ (-${listc.course.discount}%)</strong></h4>
                                        </div>
                                        <label>Limit Member: ${listc.limitMember}</label><br/>
                                        <label>Time: ${listc.startTime} - ${listc.endTime}</label><br/>
                                        <span>Date: <strong>${listc.dayOfWeek}</strong></span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <nav aria-label="Page navigation" class="d-flex justify-content-center wow fadeInUp" data-wow-delay="1s">
                        <ul class="pagination justify-content-center font-weight-bold">
                            <li class="page-item">
                                <c:if test="${pageNo > 1}">
                                    <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1, '${cid}', '${search}')">Start</i></button>
                                </c:if>
                            </li>
                            <li class="page-item">
                                <c:if test="${pageNo > 1}">
                                    <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}', '${cid}', '${search}')"></i></button>
                                    </c:if>
                            </li>
                            <c:forEach var="page" begin="1" end="${totalPages}">
                                <li aria-current="page" class="page-item ${pageNo == page? 'active' :''}">
                                    <c:choose>
                                        <c:when test="${page == pageNo}">
                                            <button class="page-link page-number">${page}</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="page-link page-number" onclick="onPage('${page}', '${cid}', '${search}')">${page}</button>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <li class="page-item">
                                <c:if test="${not empty listClass && pageNo != totalPages}">
                                    <button class="page-link" onclick="onPage(${pageNo+1}, '${cid}', '${search}')"><i class="fas fa-angle-right"></i>
                                    </button>
                                </c:if>
                            </li>
                            <li class="page-item">
                                <c:if test="${not empty listClass && pageNo != totalPages}">
                                    <button class="page-link" onclick="onPage('${totalPages}', '${cid}', '${search}')"><i class="fas fa-angles-right">End</i></button>
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
            function onPage(pageNo, cid, search) {
                if (search === null) {
                    window.location.href = `class?pageNo=` + pageNo + `&cid=` + cid;
                } else {
                    window.location.href = `class?pageNo=` + pageNo + `&cid=` + cid + `&search=` + search;
                }
            }

            function ChangeCategory(cateID) {
                const keySearch = "${search}";
                if (keySearch === null) {
                    window.location.href = `class?cid=` + cateID;
                } else {
                    window.location.href = `class?cid=` + cateID + `&search=` + keySearch;
                }
            }

            function search() {
                const search = document.getElementById('keySearch').value;
                const cid = "${cid}";
                const page = "${pageNo}";
                if (search === null) {
                    window.location.href = `class?pageNo=` + page + `&cid=` + cid;
                } else {
                    window.location.href = `class?pageNo=` + page + `&cid=` + cid + `&search=` + search;
                }
            }
        </script>
        
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    </body>
</html>
