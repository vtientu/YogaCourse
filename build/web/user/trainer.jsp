
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
                        <h2>Trainer</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Trainer</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Team Start -->
        <div class="team">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Yoga Trainer</p>
                    <h2>Expert Yoga Trainer</h2>
                </div>
                <div class="w-25 input-group mb-3 wow fadeInUp" data-wow-delay="0.2s" style="margin-left: auto">
                    <input value="${search}" id="keySearch" type="text" class="form-control" placeholder="Search trainer..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button onclick="search()" class="btn btn-secondary"><i class="fas fa-search"></i></button>
                    </div>
                </div>
                <c:if test="${listTrainer.size() != 0}">
                    <div class="row">
                        <c:forEach items="${listTrainer}" var="trainer">
                            <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                                <div class="team-item">
                                    <div class="team-img">
                                        <img src="${trainer.avatar}" alt="Image">
                                    </div>
                                    <div class="team-text">
                                        <h2>${trainer.displayName}</h2>
                                        <p>Contact: ${trainer.email}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <nav aria-label="Page navigation" class="d-flex justify-content-center wow fadeInUp" data-wow-delay="1s">
                        <ul class="pagination justify-content-center font-weight-bold">
                            <li class="page-item">
                                <c:if test="${pageNo > 1}">
                                    <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1, '${search}')">Start</i></button>
                                </c:if>
                            </li>
                            <li class="page-item">
                                <c:if test="${pageNo > 1}">
                                    <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}', '${search}')"></i></button>
                                    </c:if>
                            </li>
                            <c:forEach var="page" begin="1" end="${totalPages}">
                                <li aria-current="page" class="page-item ${pageNo == page? 'active' :''}">
                                    <c:choose>
                                        <c:when test="${page == pageNo}">
                                            <button class="page-link page-number">${page}</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="page-link page-number" onclick="onPage('${page}', '${search}')">${page}</button>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <li class="page-item">
                                <c:if test="${not empty listTrainer && pageNo != totalPages}">
                                    <button class="page-link" onclick="onPage(${pageNo+1}, '${search}')"><i class="fas fa-angle-right"></i>
                                    </button>
                                </c:if>
                            </li>
                            <li class="page-item">
                                <c:if test="${not empty listTrainer && pageNo != totalPages}">
                                    <button class="page-link" onclick="onPage('${totalPages}', '${search}')"><i class="fas fa-angles-right">End</i></button>
                                </c:if>
                            </li>
                        </ul>
                    </nav>
                </c:if>
                <c:if test="${listTrainer.size() == 0}">
                    <h2 class="text-center">List Trainer is empty.</h2>
                </c:if>
            </div>
        </div>
        <!-- Team End -->


        <!-- Footer Start -->

        <%@include file="gui/footer.jsp" %>

        <script>
            function onPage(pageNo, search) {
                if (search === null) {
                    window.location.href = `trainer?pageNo=` + pageNo;
                } else {
                    window.location.href = `trainer?pageNo=` + pageNo + `&search=` + search;
                }
            }

            function search() {
                const search = document.getElementById('keySearch').value;
                const page = `${pageNo}`;
                if (search === null) {
                    window.location.href = `trainer?pageNo=` + page;
                } else {
                    window.location.href = `trainer?pageNo=` + page + `&search=` + search;
                }
            }
        </script>
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    </body>
</html>
