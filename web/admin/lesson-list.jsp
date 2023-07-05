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
                                                    <c:forEach items="${classList}" var="classItem">
                                                        <option ${cid == classItem.classID?'selected':''} value="${classItem.classID}">${classItem.className}</option>
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
                                        <h4 class="p-1 m-0 " style="color: white">Lesson Manager</h4>
                                        <div style="color: white" class="p-1 m-0 text-16">
                                            <i class="fa fa-plus" data-target="#ModalCreate"
                                               data-toggle="modal" class="ml-3 fas fa-trash text-danger" style="cursor: pointer"></i>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <c:if test="${lessonList.size() > 0}">
                                            <div class="card-body table-responsive">
                                                <table id="example" style="text-align: center" class="table">
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 5%">ID</th>
                                                            <th style="width: 20%">Lession Name</th>
                                                            <th>Details</th>
                                                            <th style="width: 10%">Action  ${totalPages}</th>
                                                        </tr>
                                                        <c:forEach items="${lessonList}" var="item">
                                                            <tr>
                                                                <td>${item.lessionID}</td>
                                                                <td>
                                                                    ${item.lessionName}
                                                                </td>
                                                                <td>
                                                                    ${item.lessionDescription}
                                                                </td>
                                                                <td>
                                                                    <i data-target="#ModalUpdate${item.lessionID}"
                                                                       data-toggle="modal" class="ml-3 fas fa-pencil-square-o text-warning" style="cursor: pointer"></i>
                                                                    <i data-target="#ModalDelete${item.lessionID}"
                                                                       data-toggle="modal" class="ml-3 fas fa-trash text-danger" style="cursor: pointer"></i>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <ul class="pagination justify-content-center font-weight-bold">
                                                    <li class="page-item">
                                                        <c:if test="${pageNo > 1}">
                                                            <button class="page-link" ><i class="fas fa-chevrons-left" onclick="onPage(1, '${search}', '${cid}')">Start</i></button>
                                                        </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                        <c:if test="${pageNo > 1}">
                                                            <button class="page-link" ><i class="fas fa-angle-left" onclick="onPage('${pageNo - 1}', '${search}', '${cid}')"></i></button>
                                                            </c:if>
                                                    </li>
                                                    <c:forEach var="page" begin="1" end="${totalPages}">
                                                        <li aria-current="page" class="page-item ${pageNo == page? 'active' :''}">
                                                            <c:choose>
                                                                <c:when test="${page == pageNo}">
                                                                    <button class="page-link page-number">${page}</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button class="page-link page-number" onclick="onPage('${page}', '${search}', '${cid}')">${page}</button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <c:if test="${not empty lessonList && pageNo != totalPages}">
                                                            <button class="page-link" onclick="onPage(${pageNo+1}, '${search}', '${cid}')"><i class="fas fa-angle-right"></i>
                                                            </button>
                                                        </c:if>
                                                    </li>
                                                    <li class="page-item">
                                                        <c:if test="${not empty lessonList && pageNo != totalPages}">
                                                            <button class="page-link" onclick="onPage('${totalPages}', '${search}', '${cid}')"><i class="fas fa-angles-right">End</i></button>
                                                        </c:if>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:if>
                                        <c:if test="${lessonList.size() == 0 || lessonList == null}">
                                            <div class="col-12 text-center">
                                                <h1>List Lession is empty.</h1>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:forEach items="${lessonList}" var="item">
                <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="ModalDelete${item.lessionID}" role="dialog"
                     tabindex="-1">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="background: #304156;">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: white">
                                    Remove Lession</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" style="color: white">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h4>Are you sure want to delete lesson?</h4>
                            </div>
                            <form action="lession-details" method="post">
                                <input name="action" value="delete" hidden=""/>
                                <div class="modal-footer" style="margin: 0 auto; display: flex ; justify-content: space-between">
                                    <button type="submit" name="lid" value="${item.lessionID}" class="btn  btn-outline-danger">
                                        Delete
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:forEach items="${lessonList}" var="item">
                <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="ModalUpdate${item.lessionID}" role="dialog"
                     tabindex="-1">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="background: #304156;">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: white">
                                    Update Lesson</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" style="color: white">&times;</span>
                                </button>
                            </div>
                            <form action="lession-details" method="post">
                                <div class="modal-body">
                                    <input name="lid" value="${item.lessionID}" hidden=""/>
                                    <input name="action" value="update" hidden=""/>
                                    <div class="form-group">
                                        <label for="exampleInputClass">Class <i class="text-danger">*</i></label>
                                        <select name="cid" class="form-control" id="exampleInputClass">
                                            <c:forEach items="${classList}" var="clist">
                                                <option value="${clist.classID}" ${clist.classID == item.classModule.classID?'selected':''}>${clist.className}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName">Lesson Name <i class="text-danger">*</i></label>
                                        <input type="text" class="form-control" id="exampleInputName" placeholder="Enter lesson name" name="name" value="${item.lessionName}">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputDetails">Lesson Details <i class="text-danger">*</i></label>
                                        <textarea class="form-control" id="exampleInputDetails" name="description" rows="5" cols="10">${item.lessionDescription}</textarea>
                                    </div>
                                </div>
                                <div class="modal-footer" style="margin: 0 auto; display: flex ; justify-content: space-between">
                                    <a id="deleteLink" class="btn  btn-outline-secondary" href="#">
                                        Cancel
                                    </a>
                                    <button class="btn  btn-outline-success" type="submit">
                                        Update
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="ModalCreate" role="dialog"
                 tabindex="-1">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background: #304156;">
                            <h5 class="modal-title" id="exampleModalLabel" style="color: white">
                                Create New Lesson</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" style="color: white">&times;</span>
                            </button>
                        </div>
                        <form action="lession-details" method="post">
                            <div class="modal-body">
                                <input name="action" value="create" hidden=""/>
                                <div class="form-group">
                                    <label for="exampleInputClass">Class <i class="text-danger">*</i></label>
                                    <select name="cid" class="form-control" id="exampleInputClass">
                                        <c:forEach items="${classList}" var="clist">
                                            <option value="${clist.classID}">${clist.className}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName">Lesson Name <i class="text-danger">*</i></label>
                                    <input type="text" class="form-control" id="exampleInputName" name="name" placeholder="Enter lesson name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputDetails">Lesson Details <i class="text-danger">*</i></label>
                                    <textarea class="form-control" id="exampleInputDetails" name="description" rows="5" cols="10"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer" style="margin: 0 auto; display: flex ; justify-content: space-between">
                                <a id="deleteLink" class="btn  btn-outline-secondary" href="#">
                                    Cancel
                                </a>
                                <button class="btn  btn-outline-success" type="submit">
                                    Create
                                </button>
                            </div>
                        </form>
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
                    window.location.href = "lession-manager?cid=" + url;
                } else {
                    window.location.href = "lession-manager?cid=" + url + `&search=` + searchValue;
                }
            }

            $(document).ready(function () {
                $(".js-basic-example2").select2({
                    theme: "classic"
                });
            });

            function onPage(pageNo, search, cid) {
                if (search.length === 0 && cid.length === 0) {
                    window.location.href = `lession-manager?pageNo=` + pageNo;
                } else if (search.length > 0 && cid.length === 0) {
                    window.location.href = `lession-manager?pageNo=` + pageNo + `&search=` + search;
                } else if (search.length === 0 && cid.length > 0) {
                    window.location.href = `lession-manager?pageNo=` + pageNo + `&cid=` + cid;
                } else {
                    window.location.href = `lession-manager?pageNo=` + pageNo + `&cid=` + cid + `&search=` + search;
                }
            }

            function search() {
                const cid = `${cid}`;
                const searchValue = document.getElementById("textSearch").value;
                if (searchValue.length === 0 && cid.length === 0) {
                    window.location.href = `lession-manager`;
                } else if (searchValue.length > 0 && cid.length === 0) {
                    window.location.href = `lession-manager?search=` + searchValue;
                } else if (searchValue.length === 0 && cid.length > 0) {
                    window.location.href = `lession-manager?cid=` + cid;
                } else {
                    window.location.href = `lession-manager?cid=` + cid + `&search=` + searchValue;
                }
            }
        </script>
    </body>

</html>
<!-- end document-->

