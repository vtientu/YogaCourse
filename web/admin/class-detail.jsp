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
                            <form action="class-details" method="post" class="form-horizontal" id="myForm">
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
                                                <label for="course">Course <i class="text-danger">*</i> </label>
                                                <select class="form-control js-basic-example2" name="course" id="course">
                                                    <c:forEach items="${courseList}" var="lc">
                                                        <option class="form-control" ${lc.courseID == classModule.course.courseID?'selected':''} value="${lc.courseID}">${lc.courseName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-12 col-md-6 row">
                                                <label for="trainer">Trainer <i class="text-danger">*</i> </label>
                                                <select class="form-control js-basic-example2" name="trainer" id="trainer">
                                                    <c:forEach items="${trainerList}" var="lc">
                                                        <option ${lc.aid == classModule.trainer.aid?'selected':''} value="${lc.aid}">${lc.displayName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row form-group mx-5 mb-5">
                                            <div class="col-12 col-md-6 row border-right mr-3">
                                                <label for="startTime">Start Time <i class="text-danger">*</i> </label>
                                                <input type="time" id="startTime" onblur="validateStartTime()"   name="startTime" class="input form-control" value="${classModule.startTime}" />
                                            </div>
                                            <div class="col-12 col-md-6 row">
                                                <label for="endTime">End Time <i class="text-danger">*</i> </label>
                                                <input type="time" id="endTime" onblur="validateEndTime()"  name="endTime" class="input form-control" value="${classModule.endTime}" />
                                            </div>
                                        </div>
                                        <div class="d-flex form-group mx-5 mb-5">
                                            <div class="col-12 col-md-6 row border-right mr-3">
                                                <label for="limitMember">Limit Member <i class="text-danger">*</i> </label>
                                                <input type="number" id="limitMember" onblur="validateLimitMember()"  name="limitMember" class="input form-control" value="${classModule.limitMember}" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex flex-row-reverse">
                                    <button onclick="validateForm()" type="button" name="type" value="${action}" class="btn btn-success mx-3">
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

        // Hàm kiểm tra validate cho Class Name
        function validateClassName() {
            var classNameInput = document.getElementById('className');
            var classNameValue = classNameInput.value.trim();

            if (classNameValue === '') {
                // Nếu giá trị trống, hiển thị thông báo lỗi
                classNameInput.classList.add('is-invalid');
                return false;
            } else {
                classNameInput.classList.remove('is-invalid');
                return true;
            }
        }

// Hàm kiểm tra validate cho Start Time
        function validateStartTime() {
            var startTimeInput = document.getElementById('startTime');
            var startTimeValue = startTimeInput.value.trim();

            if (startTimeValue === '') {
                startTimeInput.classList.add('is-invalid');
                return false;
            } else {
                startTimeInput.classList.remove('is-invalid');
                return true;
            }
        }

// Hàm kiểm tra validate cho End Time
        function validateEndTime() {
            var endTimeInput = document.getElementById('endTime');
            var endTimeValue = endTimeInput.value.trim();

            if (endTimeValue === '') {
                endTimeInput.classList.add('is-invalid');
                return false;
            } else {
                endTimeInput.classList.remove('is-invalid');
                return true;
            }
        }

// Hàm kiểm tra validate cho Limit Member
        function validateLimitMember() {
            var limitMemberInput = document.getElementById('limitMember');
            var limitMemberValue = limitMemberInput.value.trim();

            if (limitMemberValue === '' || isNaN(limitMemberValue)) {
                limitMemberInput.classList.add('is-invalid');
                return false;
            } else {
                limitMemberInput.classList.remove('is-invalid');
                return true;
            }
        }

// Hàm kiểm tra và validate toàn bộ form
        function validateForm() {
            var isClassNameValid = validateClassName();
            var isStartTimeValid = validateStartTime();
            var isEndTimeValid = validateEndTime();
            var isLimitMemberValid = validateLimitMember();

            // Nếu tất cả các input đều hợp lệ, cho phép submit form
            if (isClassNameValid && isStartTimeValid && isEndTimeValid && isLimitMemberValid) {
                document.getElementById('myForm').submit();
            }
        }

    </script>
</body>

</html>
<!-- end document-->

