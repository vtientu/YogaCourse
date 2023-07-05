<%-- 
    Document   : user-manager
    Created on : May 30, 2023, 11:05:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="gui/header.jsp" %>
    </head>

    <body>
        <div class="page-wrapper">

            <!-- MENU SIDEBAR-->
            <%@include file="gui/sidebar.jsp" %>
            <!-- END MENU SIDEBAR-->

            <!-- PAGE CONTAINER-->
            <div class="page-container">


                <!-- MAIN CONTENT-->
                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="row align-items-center">
                                        <div class="col-sm-12 col-md-6">
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="input-group" style="position: relative;width: 75%;margin-left: auto;margin-bottom: 15px;">
                                                <input class="form-control" name="search" id="textSearch" value="${search}" type="text" placeholder="Search for result" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;"/>
                                                <div class="input-group-append" style="position: absolute;right: 0;z-index: 10;">
                                                    <button class="btn btn-secondary"  type="button" onclick="search()">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-header" style="background: #242939 ;display: flex;justify-content: space-between;">
                                        <h4 class="p-1 m-0 " style="color: white">Order Manager  
                                        <c:if test="${search.length() > 0}">
                                            ( ${enrollList.size()} recorded )
                                        </c:if>
                                        </h4>
                                    </div>
                                    <div class="card">
                                        <c:if test="${enrollList.size() > 0}">
                                            <div class="card-body table-responsive">
                                                <table id="example" style="text-align: center" class="table">
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 5%">ID</th>
                                                            <th style="width: 25%">Class</th>
                                                            <th style="width: 10%">Total Price</th>
                                                            <th style="width: 15%">Enroll Date</th>
                                                            <th style="width: 15%">Phone Order</th>
                                                            <th style="width: 20%">Order By</th>
                                                            <th>Details</th>
                                                        </tr>
                                                        <c:forEach items="${enrollList}" var="item">
                                                            <tr>
                                                                <td>${item.enrollID}</td>
                                                                <td>
                                                                    ${item.classOrder.className}
                                                                </td>
                                                                <td>
                                                                    ${item.totalPrice} $
                                                                </td>
                                                                <td>
                                                                    ${item.enrollDate}
                                                                </td>
                                                                <td>
                                                                    ${item.account.phone}
                                                                </td>
                                                                <td>
                                                                    ${item.account.displayName}
                                                                </td>
                                                                <td>
                                                                    <i data-target="#ModalDelete${item.enrollID}"
                                                                       data-toggle="modal" class="ml-3 fas fa-eye" style="cursor: pointer"></i>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <ul class="pagination justify-content-center font-weight-bold">
                                                    <li class="page-item">
                                                        <c:if test="${pageNo > 1}">
                                                            <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1, '${search}')">Start</i>
                                                            </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                        <c:if test="${pageNo > 1}">
                                                            <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}', '${search}')"></i>
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
                                                        <c:if test="${not empty enrollList && pageNo != totalPages}">
                                                            <button class="page-link" onclick="onPage(${pageNo+1}, '${search}')"><i class="fas fa-angle-right"></i>
                                                            </button>
                                                        </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                        <c:if test="${not empty enrollList && pageNo != totalPages}">
                                                            <button class="page-link" onclick="onPage('${totalPages}', '${search}')"><i class="fas fa-angles-right">End</i>
                                                            </c:if>
                                                    </li>
                                                </ul>
                                            </div>

                                        </c:if>
                                        <c:if test="${enrollList.size() == 0 || enrollList == null}">
                                            <div class="col-12 text-center">
                                                <h1>List enroll is empty.</h1>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <c:forEach items="${enrollList}" var="item">
                <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="ModalDelete${item.enrollID}" role="dialog"
                     tabindex="-1">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="background: #304156;">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: white">
                                    Enroll Details #${item.enrollID}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" style="color: white">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table border="1px">
                                    <tbody>
                                        <tr>
                                            <td style="width: 35%; padding: 5px 10px">
                                                Member Name:
                                            </td>
                                            <td style="padding-left: 10px">${item.account.displayName}</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 35%; padding: 5px 10px">
                                                Enroll Date:
                                            </td>
                                            <td style="padding-left: 10px">${item.enrollDate}</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 35%; padding: 5px 10px">
                                                Member Phone:
                                            </td>
                                            <td style="padding-left: 10px">
                                                ${item.account.phone}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 35%; padding: 5px 10px">
                                                Course Enrolled:
                                            </td>
                                            <td style="padding-left: 10px">
                                                ${item.classOrder.course.courseName}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 35%; padding: 5px 10px">
                                                Total Lesson Of Course:
                                            </td>
                                            <td style="padding-left: 10px">
                                                ${item.classOrder.course.totalDay}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 35%; padding: 5px 10px">
                                                Payments:
                                            </td>
                                            <td style="padding-left: 10px">
                                                ${item.totalPrice} $
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- END PAGE CONTAINER-->

        </div>

        <%@include file="gui/footer.jsp" %>
        <script>

            $(document).ready(function () {
                $(".js-basic-example2").select2({
                    theme: "classic"
                });
            });

            $(document).ready(function () {
                if (document.getElementById('message').innerHTML !== '') {
                    $('.toast').toast('show');
                }
            });

            function onPage(pageNo, search) {
                if (search.length === 0) {
                    window.location.href = `enroll?pageNo=` + pageNo;
                } else {
                    window.location.href = `enroll?pageNo=` + pageNo + `&search=` + search;
                }
            }

            function search() {
                const searchValue = document.getElementById("textSearch").value;
                if (searchValue.length === 0) {
                    window.location.href = `enroll`;
                } else
                    window.location.href = `enroll?search=` + searchValue;
            }
        </script>
    </body>

</html>
<!-- end document-->

