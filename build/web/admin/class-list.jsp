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
                                        <div class="col-sm-12 col-md-6 d-flex">
                                            <div class="input-group" >
                                                <select onchange="changeUrl(this)" class="form-control js-basic-example2" id="filterType" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;">
                                                    <option ${cateID == 0 || cateID == null?'selected':''} value="0">Select All</option>
                                                    <c:forEach items="${listCate}" var="cateItem">
                                                        <option ${cateID == cateItem.categoryID?'selected':''} value="${cateItem.categoryID}">${cateItem.categoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
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
                                        <h4 class="p-1 m-0 " style="color: white">Class Manager</h4>
                                        <div style="color: white" class="p-1 m-0 text-16">
                                            <a href="class-details?action=create">
                                                <i class="fa fa-plus" style="cursor: pointer"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <c:if test="${listClass.size() > 0}">
                                            <div class="card-body table-responsive">
                                                <table id="example" style="text-align: center" class="table">
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 5%">ID</th>
                                                            <th style="width: 20%">Class Name</th>
                                                            <th style="width: 20%">Course Name</th>
                                                            <th style="width: 10%">Start Time</th>
                                                            <th style="width: 10%">End Time</th>
                                                            <th style="width: 20%">Trainer</th>
                                                            <th>Details</th>
                                                        </tr>
                                                        <c:forEach items="${listClass}" var="item">
                                                            <tr>
                                                                <td>${item.classID}</td>
                                                                <td>
                                                                    ${item.className}
                                                                </td>
                                                                <td>
                                                                    ${item.course.courseName}
                                                                </td>
                                                                <td>
                                                                    ${item.startTime}
                                                                </td>
                                                                <td>
                                                                    ${item.endTime}
                                                                </td>
                                                                <td>
                                                                    ${item.trainer.displayName}
                                                                </td>
                                                                <td>
                                                                    <a class="text-secondary" href="class-details?action=update&cid=${item.classID}"><i class="fas fa-pen-square"></i></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <ul class="pagination justify-content-center font-weight-bold">
                                                    <li class="page-item">
                                                        <c:if test="${pageNo > 1}">
                                                            <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1, '${search}', '${cateID}')">Start</i>
                                                            </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                        <c:if test="${pageNo > 1}">
                                                            <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}', '${search}', '${cateID}')"></i>
                                                            </c:if>
                                                    </li>
                                                    <c:forEach var="page" begin="1" end="${totalPages}">
                                                        <li aria-current="page" class="page-item ${pageNo == page? 'active' :''}">
                                                            <c:choose>
                                                                <c:when test="${page == pageNo}">
                                                                    <button class="page-link page-number">${page}</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button class="page-link page-number" onclick="onPage('${page}', '${search}', '${cateID}')">${page}</button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <c:if test="${not empty enrollList && pageNo != totalPages}">
                                                            <button class="page-link" onclick="onPage(${pageNo+1}, '${search}', '${cateID}')"><i class="fas fa-angle-right"></i>
                                                            </button>
                                                        </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                        <c:if test="${not empty enrollList && pageNo != totalPages}">
                                                            <button class="page-link" onclick="onPage('${totalPages}', '${search}', '${cateID}')"><i class="fas fa-angles-right">End</i>
                                                            </c:if>
                                                    </li>
                                                </ul>
                                            </div>

                                        </c:if>
                                        <c:if test="${listClass.size() == 0 || listClass == null}">
                                            <div class="col-12 text-center">
                                                <h1>List Classes is empty.</h1>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- END PAGE CONTAINER-->

        </div>

        <%@include file="gui/footer.jsp" %>
        <script>
            function changeUrl(select) {
                const searchValue = "${search}";
                var url = select.value;
                if (searchValue.length === 0) {
                    window.location.href = "class-manager?cateID=" + url;
                } else {
                    window.location.href = "class-manager?cateID=" + url + `&search=` + searchValue;
                }
            }

            $(document).ready(function () {
                $(".js-basic-example2").select2({
                    theme: "classic"
                });
            });

            function onPage(pageNo, search, cateID) {
                if (search.length === 0 && cateID.length === 0) {
                    window.location.href = `class-manager?pageNo=` + pageNo;
                } else if (search.length > 0 && cateID.length === 0) {
                    window.location.href = `class-manager?pageNo=` + pageNo + `&search=` + search;
                } else if (search.length === 0 && cateID.length > 0) {
                    window.location.href = `class-manager?pageNo=` + pageNo + `&cateID=` + cateID;
                } else {
                    window.location.href = `class-manager?pageNo=` + pageNo + `&cateID=` + cateID + `&search=` + search;
                }
            }

            function search() {
                const cateID = `${cateID}`;
                const searchValue = document.getElementById("textSearch").value;
                if (searchValue.length === 0 && cateID.length === 0) {
                    window.location.href = `class-manager`;
                } else if (searchValue.length > 0 && cateID.length === 0) {
                    window.location.href = `class-manager?search=` + searchValue;
                } else if (searchValue.length === 0 && cateID.length > 0) {
                    window.location.href = `class-manager?cateID=` + cateID;
                } else {
                    window.location.href = `class-manager?cateID=` + cateID + `&search=` + searchValue;
                }
            }
        </script>
    </body>

</html>
<!-- end document-->

