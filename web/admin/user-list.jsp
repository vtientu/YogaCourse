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
                                        <h4 class="p-1 m-0 " style="color: white">User List</h4>
                                        <div style="color: white" class="p-1 m-0 text-16">
                                            <a href="user-detail?type=add">
                                                <i class="fa fa-plus" style="cursor: pointer"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <c:if test="${listUser.size() > 0}">
                                            <div class="card-body table-responsive">
                                                <table id="example" style="text-align: center" class="table">
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 5%">ID</th>
                                                            <th style="width: 20%">Full Name</th>
                                                            <th style="width: 25%">Email</th>
                                                            <th style="width: 15%">Phone</th>
                                                            <th style="width: 15%">Role</th>
                                                            <th style="width: 5%">Active</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    <c:forEach items="${listUser}" var="item">
                                                        <tr>
                                                            <td>${item.aid}</td>
                                                            <td>
                                                                ${item.displayName}
                                                            </td>
                                                            <td>
                                                                ${item.email}
                                                            </td>
                                                            <td>
                                                                ${item.phone}
                                                            </td>
                                                            <td>
                                                                ${item.role.roleName}
                                                            </td>
                                                            <td>
                                                                <span class="badge ${item.active == true?'badge-success':'badge-danger'}">
                                                                    ${item.active == true?'Active':'Inactive'}</span>
                                                            </td>

                                                        <c:if test="${account.aid != item.aid && item.role.rid != 4}">
                                                            <td>
                                                                <a class="text-secondary" href="user-detail?type=edit&aid=${item.aid}"><i class="fas fa-pen-square"></i></a>
                                                                <a href="change-status?aid=${item.aid}" ><i class="ml-3 ${item.active == true?'fas fa-toggle-on text-success':'fas fa-toggle-off text-danger'}" style="cursor: pointer"></i></a>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${account.aid == item.aid || item.role.rid == 4}">
                                                            <td></td>
                                                        </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>

                                                <ul class="pagination justify-content-center font-weight-bold">
                                                    <li class="page-item">
                                                    <c:if test="${pageNo > 1}">
                                                        <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1, '${search}', '${active}')">Start</i>
                                                    </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                    <c:if test="${pageNo > 1}">
                                                        <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}', '${search}', '${active}')"></i>
                                                    </c:if>
                                                    </li>
                                                    <c:forEach var="page" begin="1" end="${totalPages}">
                                                        <li aria-current="page" class="page-item ${pageNo == page? 'active' :''}">
                                                        <c:choose>
                                                            <c:when test="${page == pageNo}">
                                                                <button class="page-link page-number">${page}</button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button class="page-link page-number" onclick="onPage('${page}', '${search}', '${active}')">${page}</button>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                    <c:if test="${not empty listUser && pageNo != totalPages}">
                                                        <button class="page-link" onclick="onPage(${pageNo+1}, '${search}', '${active}')"><i class="fas fa-angle-right"></i>
                                                        </button>
                                                    </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                    <c:if test="${not empty listUser && pageNo != totalPages}">
                                                        <button class="page-link" onclick="onPage('${totalPages}', '${search}', '${active}')"><i class="fas fa-angles-right">End</i>
                                                    </c:if>
                                                    </li>
                                                </ul>
                                            </div>

                                        </c:if>
                                        <c:if test="${listUser.size() == 0 || listUser == null}">
                                            <div class="col-12 text-center">
                                                <h1>List user is empty.</h1>
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
                                                                window.location.href = "user-manager?status=" + url;
                                                            } else {
                                                                window.location.href = "user-manager?status=" + url + `&search=` + searchValue;
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

                                                        function onPage(pageNo, search, active) {
                                                            if (search.length === 0) {
                                                                window.location.href = `user-manager?pageNo=` + pageNo + `&status=` + active;
                                                            } else {
                                                                window.location.href = `user-manager?pageNo=` + pageNo + `&status=` + active + `&search=` + search;
                                                            }
                                                        }

                                                        function search() {
                                                            const searchValue = document.getElementById("textSearch").value;
                                                            if (searchValue.length === 0) {
                                                                window.location.href = `user-manager?status=${active}`;
                                                            } else
                                                                window.location.href = `user-manager?status=${active}` + `&search=` + searchValue;
                                                        }
        </script>
    </body>

</html>
<!-- end document-->

