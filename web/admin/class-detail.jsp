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
        <style>
            .is-invalid {
                border: solid 1px red;
            }

        </style>
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
                            <form action="course-details" method="post" class="form-horizontal" id="myForm">
                                <input hidden="" name="action" value="${action}"}/>
                                <input hidden="" name="cid" value="${classModule.classID}"/>
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Class Manager</h3>
                                    </div>
                                    <div class="card-body card-block my-5">
                                        <div class="row form-group mb-5 mx-5">
                                            <label for="className">Class Name <i class="text-danger">*</i> </label>
                                            <input type="text" onblur="validateClassName()" class="form-control" id="className" value="${classModule.className}" name="className" placeholder="Enter class name">
                                        </div>

                                        <div class="row form-group mb-5 mx-5">
                                            <div class="col-12 col-md-6 row border-right mr-3">
                                                <label for="category">Course <i class="text-danger">*</i> </label>
                                                <select class="form-control js-basic-example2l" name="category" id="category">
                                                    <c:forEach items="${courseList}" var="lc">
                                                        <option class="form-control" ${lc.courseID == classModule.course.courseID?'selected':''} value="${lc.courseID}">${lc.courseName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-12 col-md-6 row">
                                                <label for="category">Trainer <i class="text-danger">*</i> </label>
                                                <select class="form-control js-basic-example2" name="category" id="category">
                                                    <c:forEach items="${trainerList}" var="lc">
                                                        <option class="form-control" ${lc.aid == classModule.trainer.aid?'selected':''} value="${lc.aid}">${lc.displayName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row form-group mx-5 mb-5">
                                            <div class="col-12 col-md-6 row border-right mr-3">
                                                <label for="startTime">Start Time <i class="text-danger">*</i> </label>
                                                <input type="number" id="startTime" onblur="validateStartTime()"   name="startTime" class="input form-control" required="" value="${courseModule.discount}" />
                                            </div>
                                            <div class="col-12 col-md-6 row">
                                                <label for="endTime">End Time <i class="text-danger">*</i> </label>
                                                <input type="number" id="endTime" onblur="validateEndTime()"  name="endTime" class="input form-control" required="" value="${classModule.limitMember}" />
                                            </div>
                                        </div>
                                        <div class="d-flex form-group mx-5 mb-5">
                                            <div class="col-12 col-md-6 row border-right mr-3">
                                                <label for="limitMember">Limit Member <i class="text-danger">*</i> </label>
                                                <input type="number" id="limitMember" onblur="validateLimitMember()"  name="limitMember" class="input form-control" required="" value="${classModule.limitMember}" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex flex-row-reverse">
                                    <button onclick="validateForm()" name="type" value="${action}" class="btn btn-success mx-3">
                                        <i class="fa fa-dot-circle-o"></i> ${action == 'create'?'Create':'Update'}
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
    <script>

        $(document).ready(function () {
            $(".js-basic-example2").select2({
                theme: "classic"
            });
        });
        
        function validateCourseName() {
            let fnameInput = document.getElementById("courseName");
            let firstName = fnameInput.value;
            if (!firstName) {
                fnameInput.classList.add("is-invalid");
                return false;
            } else {
                fnameInput.classList.remove("is-invalid");
                return true;
            }
        }

        function validateTotalDate() {
            let totalDateInput = document.getElementById("totalDate");
            let totalDate = parseInt(totalDateInput.value);
            if (totalDate <= 0) {
                totalDateInput.classList.add("is-invalid");
                return false;
            } else {
                totalDateInput.classList.remove("is-invalid");
                return true;
            }
        }

        function validatePrice() {
            let priceInput = document.getElementById("price");
            let price = parseFloat(priceInput.value);
            if (price <= 0) {
                priceInput.classList.add("is-invalid");
                return false;
            } else {
                priceInput.classList.remove("is-invalid");
                return true;
            }
        }

        function validateForm() {
            var isValidCourseName = validateCourseName()();
            var isValidTotalDate = validateTotalDate()();
            var isValidPrice = validatePrice();
            if (isValidCourseName && isValidTotalDate && isValidPrice) {
                document.getElementById("myForm").submit();
            } else {
                document.getElementById('error').innerHTML = "Wrong change profile!";
            }
        }
    </script>
</body>

</html>
<!-- end document-->

