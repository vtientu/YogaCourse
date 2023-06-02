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
                            <div class="card">

                                <form action="" method="post" class="form-horizontal">
                                    <input name="aid" value="${aid}" hidden=""/>
                                    <div class="card-header">
                                        <h3>User Manager</h3>
                                    </div>
                                    <div class="card-body card-block my-5">
                                        <div class="row form-group mb-5">
                                            <div class="col-12 col-md-6 row border-right mr-3">
                                                <div class="col col-sm-3">
                                                    <label for="firstName" class=" form-control-label">First Name <i class="text-danger">*</i> </label>
                                                </div>
                                                <div class="col col-sm">
                                                    <input type="text" id="firstName" name="firstName" class="input form-control" required="" value="${user.firstName}"/>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6 row">
                                                <div class="col col-sm-3">
                                                    <label for="lastName" class=" form-control-label">Last Name <i class="text-danger">*</i> </label>
                                                </div>
                                                <div class="col col-sm">
                                                    <input type="text" id="lastName" name="lastName" class="input form-control" required="" value="${user.lastName}" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row form-group mb-5">
                                            <div class="col-12 col-md-6 row border-right mr-3">
                                                <div class="col col-sm-3">
                                                    <label for="firstName" class=" form-control-label">Role <i class="text-danger">*</i> </label>
                                                </div>
                                                <div class="col col-sm">
                                                    <select class="form-control" name="role">
                                                        <c:forEach items="${roleList}" var="lr">
                                                            <option class="form-control" value="${lr.rid}">${lr.roleName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6 row">
                                                <div class="col col-sm-3">
                                                    <label for="phone" class=" form-control-label">Phone</label>
                                                </div>
                                                <div class="col col-sm">
                                                    <input type="text" id="phone" name="phone" class="input form-control" value="${user.phone}" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-12 col-md-6 row border-right mr-3">
                                                <div class="col col-sm-3">
                                                    <label for="firstName" class=" form-control-label">Email <i class="text-danger">*</i> </label>
                                                </div>
                                                <div class="col col-sm">
                                                    <input type="text" id="firstName" name="email" class="input form-control" required="" value="${user.email}" ${type == 'edit'?'readonly':''}/>
                                                </div>
                                            </div>

                                            <c:if test="${type == 'add'}">
                                                <div class="col-12 col-md-6 row">
                                                    <div class="col col-sm-3">
                                                        <label for="password" class=" form-control-label">Password <i class="text-danger">*</i> </label>
                                                    </div>
                                                    <div class="col col-sm">
                                                        <input type="password" id="password" name="password" class="input form-control" required="" >
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex flex-row-reverse">
                                        <button type="submit" name="type" value="${type}" class="btn btn-success mx-3">
                                            <i class="fa fa-dot-circle-o"></i> ${type == 'add'?'Create':'Update'}
                                        </button>
                                        <button type="reset" class="btn btn-danger">
                                            <i class="fa fa-ban"></i> Reset
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTAINER-->

        </div>

        <%@include file="gui/footer.jsp" %>
    </body>

</html>
<!-- end document-->

