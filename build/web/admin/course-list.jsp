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
                                            <div class="input-group" style="position: relative;width: 25%;margin-left: auto;margin-bottom: 15px;float: left">
                                                <select onchange="changeUrl(this)" class="form-control js-basic-example2" id="filterType" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;">
                                                    <option ${active == "" || active == null?'selected':''} value="">Select active</option>
                                                    <option ${active == "1"?'selected':''} value="1">Active</option>
                                                    <option ${active == "0"?'selected':''} value="0">Inactive</option>
                                                </select>
                                            </div>
                                            <div class="input-group" style="position: relative;width: 25%;margin-left: auto;margin-bottom: 15px;float: left">
                                                <select onchange="changeCate(this)" class="form-control js-basic-example2" id="filterType" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;">
                                                    <option ${cateID == null || cateID == '0'?'selected':''} value="0">Select All</option>
                                                    <c:forEach items="${listCate}" var="item">
                                                        <option ${cateID == item.categoryID?'selected':''} value="${item.categoryID}">${item.categoryName}</option>
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
                                        <h4 class="p-1 m-0 " style="color: white">Course Manager</h4>
                                        <div style="color: white" class="p-1 m-0 text-16">
                                            <a href="course-details?action=create">
                                                <i class="fa fa-plus" style="cursor: pointer"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <c:if test="${listCourse.size() > 0}">
                                            <div class="card-body table-responsive">
                                                <table id="example" style="text-align: center" class="table">
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 5%">ID</th>
                                                            <th style="width: 25%">Course Name</th>
                                                            <th style="width: 15%">Price</th>
                                                            <th style="width: 15%">Total Day</th>
                                                            <th style="width: 20%">Create By</th>
                                                            <th style="width: 5%">Active</th>
                                                            <th>Action</th>
                                                        </tr>
                                                        <c:forEach items="${listCourse}" var="item">
                                                            <tr>
                                                                <td>${item.courseID}</td>
                                                                <td>
                                                                    ${item.courseName}
                                                                </td>
                                                                <td>
                                                                    ${item.price} $
                                                                </td>
                                                                <td>
                                                                    ${item.totalDay}
                                                                </td>
                                                                <td>
                                                                    ${item.createBy.displayName}
                                                                </td>
                                                                <td>
                                                                    <span class="badge ${item.active == true?'badge-success':'badge-danger'}">
                                                                        ${item.active == true?'Active':'Inactive'}</span>
                                                                </td>

                                                                <c:if test="${account.role.rid > 2}">
                                                                    <td>
                                                                        <a class="text-secondary" href="course-details?action=update&cid=${item.courseID}"><i class="fas fa-pen-square"></i></a>
                                                                        <i onclick="document.getElementById('deleteLink').href = 'course-status?cid=${item.courseID}';"
                                                                           data-target="#ModalDelete"
                                                                           data-toggle="modal" class="ml-3 ${item.active == true?'fas fa-toggle-on text-success':'fas fa-toggle-off text-danger'}" style="cursor: pointer"></i>
                                                                    </td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <ul class="pagination justify-content-center font-weight-bold">
                                                    <li class="page-item">
                                                        <c:if test="${pageNo > 1}">
                                                            <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1, '${search}', '${active}', '${cateID}')">Start</i>
                                                            </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                        <c:if test="${pageNo > 1}">
                                                            <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}', '${search}', '${active}', '${cateID}')"></i>
                                                            </c:if>
                                                    </li>
                                                    <c:forEach var="page" begin="1" end="${totalPages}">
                                                        <li aria-current="page" class="page-item ${pageNo == page? 'active' :''}">
                                                            <c:choose>
                                                                <c:when test="${page == pageNo}">
                                                                    <button class="page-link page-number">${page}</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button class="page-link page-number" onclick="onPage('${page}', '${search}', '${active}', '${cateID}')">${page}</button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <c:if test="${not empty listCourse && pageNo != totalPages}">
                                                            <button class="page-link" onclick="onPage(${pageNo+1}, '${search}', '${active}', '${cateID}')"><i class="fas fa-angle-right"></i>
                                                            </button>
                                                        </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                        <c:if test="${not empty listCourse && pageNo != totalPages}">
                                                            <button class="page-link" onclick="onPage('${totalPages}', '${search}', '${active}', '${cateID}')"><i class="fas fa-angles-right">End</i>
                                                            </c:if>
                                                    </li>
                                                </ul>
                                            </div>

                                        </c:if>
                                        <c:if test="${listCourse.size() == 0 || listCourse == null}">
                                            <div class="col-12 text-center">
                                                <h1>List course is empty.</h1>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="ModalDelete" role="dialog"
                 tabindex="-1">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background: #304156;">
                            <h5 class="modal-title" id="exampleModalLabel" style="color: white">
                                Change Status</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" style="color: white">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h4>Are you sure want to change status account?</h4>
                        </div>
                        <div class="modal-footer" style="margin: 0 auto; display: flex ; justify-content: space-between">
                            <a id="deleteLink" class="btn  btn-outline-danger" href="#">
                                Change
                            </a>
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
                const cateID = "${cateID}";
                var url = select.value;
                if (searchValue.length === 0 && cateID.length === 0) {
                    window.location.href = "course-manager?status=" + url;
                } else if (searchValue.length > 0 && cateID.length === 0) {
                    window.location.href = "course-manager?status=" + url + `&search=` + searchValue;
                } else if (searchValue.length === 0 && cateID.length > 0) {
                    window.location.href = "course-manager?status=" + url + `&cateID=` + cateID;
                } else {
                    window.location.href = "course-manager?status=" + url + `&cateID=` + cateID + `&search=` + searchValue;
                }
            }

            function changeCate(select) {
                const searchValue = "${search}";
                const statusValue = "${active}";
                var url = select.value;
                if (searchValue.length === 0 && (statusValue.length === 0 || statusValue === '')) {
                    window.location.href = "course-manager?cateID=" + url;
                } else if (searchValue.length > 0 && (statusValue.length === 0 || statusValue === '')) {
                    window.location.href = "course-manager?cateID=" + url + `&search=` + searchValue;
                } else if (searchValue.length === 0 && (statusValue.length > 0)) {
                    window.location.href = "course-manager?cateID=" + url + `&status=` + statusValue;
                } else {
                    window.location.href = "course-manager?cateID=" + url + `&status=` + statusValue + `&search=` + searchValue;
                }
            }

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

            function onPage(pageNo, search, active, cateID) {
                if (search.length === 0) {
                    window.location.href = `course-manager?pageNo=` + pageNo + `&status=` + active + `&cateID=` + cateID;
                } else {
                    window.location.href = `course-manager?pageNo=` + pageNo + `&status=` + active + `&cateID=` + cateID + `&search=` + search;
                }
            }

            function search() {
                const searchValue = document.getElementById("textSearch").value;
                if (searchValue.length === 0) {
                    window.location.href = `course-manager?status=${active}` + `&cateID=${cateID}`;
                } else
                    window.location.href = `course-manager?status=${active}` + `&cateID=${cateID}` + `&search=` + searchValue;
            }
        </script>
    </body>

</html>
<!-- end document-->

