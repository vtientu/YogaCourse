<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="gui/header.jsp" %>
        <style>
            .avatar-upload {
                position: relative;
                max-width: 205px;
                margin: 50px auto;
            }
            .avatar-edit {
                position: absolute;
                right: 12px;
                z-index: 1;
                top: 10px;
            }
            .avatar-edit input {
                display: none;
            }
            .avatar-edit label {
                display: inline-block;
                width: 34px;
                height: 34px;
                position: absolute;
                top: 10px;
                left: -20px;
                right: 0;
                text-align: center;
                margin: auto;
                border-radius: 100%;
                background: #FFFFFF;
                border: 1px solid transparent;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
                cursor: pointer;
                font-weight: normal;
                transition: all .2s ease-in-out;
            }


            .avatar-preview {
                width: 192px;
                height: 192px;
                position: relative;
                border-radius: 100%;
                border: 6px solid #F8F8F8;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
            }

            .avatar-preview div {
                width: 100%;
                height: 100%;
                border-radius: 100%;
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
            }

            .is-valid {
                border: red solid 1px;
            }
        </style>
    </head>

    <body>

        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Profile</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Class Start -->

        <div class="d-flex justify-content-center">
            <div class="card" style="width: 40%">
                <div class="card-body">
                    <div class="e-profile">
                        <div class="">
                            <div class="col-12 col-sm-auto mb-3 mx-auto">
                                <div class="mx-auto my-5 " style="width: 140px;">
                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px;">
                                        <form action="profile" method="post" enctype="multipart/form-data">
                                            <input name="action" value="changeavatar" hidden=""/>
                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                    <input onchange="this.form.submit()" name="avatar" type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                                                    <label class="fa fa-edit" for="imageUpload"></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" style="background-image: url(${account.avatar});">
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col d-flex flex-column flex-sm-row justify-content-center mb-3">
                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${account.displayName}</h4>
                                    <p class="mb-0">${account.role.roleName}</p>
                                </div>
                            </div>
                        </div>
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a data-toggle="tab" href="#profile" class="nav-link ${action == 'profile'?'active':''}">Profile</a></li>
                            <li class="nav-item"><a data-toggle="tab" href="#changepassword" class="nav-link ${action == 'changepassword'?'active':''}">Change Password</a></li>
                        </ul>
                        <div class="tab-content pt-3">
                            <div class="tab-pane fade ${action == 'profile'?'show active':''}" id="profile">
                                <form class="form" novalidate="" id="myForm" action="profile" method="post">
                                    <input type="text" value="profile" name="action" hidden=""/>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row my-4">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>First Name</label>
                                                        <input onblur="validateFirstName()" class="form-control" id="fname" type="text" name="firstName" placeholder="First Name" value="${account.firstName}">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <input onblur="validateLastName()" class="form-control" id="lname" type="text" name="lastName" placeholder="Last Name" value="${account.lastName}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row my-4">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Gender</label>
                                                        <div class="custom-controls-stacked px-2">
                                                            <div class="custom-control custom-checkbox"> 
                                                                <input ${account.gender == 2?'checked':''} class="" name="gender" type="radio"  value="2">
                                                                <label class="custom-control-label" for="notifications-blog">Male</label>
                                                            </div>

                                                            <div class="custom-control custom-checkbox"> 
                                                                <input ${account.gender == 1?'checked':''} class="" name="gender" type="radio" value="1">
                                                                <label class="custom-control-label" for="notifications-blog">Female</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row my-4">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Phone Number</label>
                                                        <input class="form-control" onchange="validatePhone()" name="phone" id="fphone" type="tel" placeholder="Enter your phone" value="${account.phone}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row my-4">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input class="form-control" type="text" placeholder="user@example.com" readonly="" value="${account.email}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row my-4">
                                                <div class="col mb-3">
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <textarea class="form-control" rows="5" placeholder="Your Address" name="address">${account.address}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <label id="error">${messageProfile}</label>
                                    <div class="row">
                                        <div class="col d-flex justify-content-end">
                                            <button onclick="validateFormProfile()" class="btn btn-primary" type="submit">Save Changes</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade ${action == 'changepassword'?'show active':''}" id="changepassword">
                                <form class="form" novalidate="" id="myForm1" action="profile" method="post">
                                    <input type="text" value="changepassword" name="action" hidden=""/>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 mb-3">
                                            <div class="mb-2"><b>Change Password</b></div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Current Password</label>
                                                        <input onchange="validateCurrentPassword()" name="cpassword" id="cpassword" class="form-control" type="password" placeholder="••••••">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>New Password</label>
                                                        <input onchange="validateNewPassword()" name="npassword" class="form-control" id="fpassword" type="password" placeholder="••••••">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
                                                        <input onchange="validateConfirmPassword()" class="form-control" id="fcpassword" type="password" placeholder="••••••"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <label id="error1">${messagePassword}</label>
                                    <div class="row">
                                        <div class="col d-flex justify-content-end">
                                            <button onclick="validationPassword()" class="btn btn-primary" type="button">Save Changes</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- Pills content -->


        <!-- Footer Start -->
        <%@include file="gui/footer.jsp" %>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                        $('#imagePreview').hide();
                        $('#imagePreview').fadeIn(650);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#imageUpload").change(function () {
                readURL(this);
            });

            function validateFirstName() {
                let fnameInput = document.getElementById("fname");
                let firstName = fnameInput.value;
                if (!firstName) {
                    fnameInput.classList.add("is-invalid");
                    return false;
                } else {
                    fnameInput.classList.remove("is-invalid");
                    return true;
                }
            }

            function validateLastName() {
                let lnameInput = document.getElementById("lname");
                let lastName = lnameInput.value;
                if (!lastName) {
                    lnameInput.classList.add("is-invalid");
                    return false;
                } else {
                    lnameInput.classList.remove("is-invalid");
                    return true;
                }
            }

            function validatePhone() {
                const regex = /^\d{10}$/;
                let phoneInput = document.getElementById("fphone");
                let phone = phoneInput.value;
                if (!regex.test(phone)) {
                    phoneInput.classList.add("is-invalid");
                    return false;
                } else {
                    phoneInput.classList.remove("is-invalid");
                    return true;
                }
            }

            function validateCurrentPassword() {
                let passwordInput = document.getElementById("cpassword");
                let password = passwordInput.value;
                if (!password) {
                    passwordInput.classList.add("is-invalid");
                    return false;
                } else {
                    passwordInput.classList.remove("is-invalid");
                    return true;
                }
            }


            // Hàm kiểm tra tính hợp lệ của mật khẩu
            function validateNewPassword() {
                var passwordInput = document.getElementById("fpassword");
                var password = passwordInput.value;

                if (password.length < 6 || password.length > 15) {
                    passwordInput.classList.add("is-invalid");
                    return false;
                } else {
                    passwordInput.classList.remove("is-invalid");
                    return true;
                }
            }

// Hàm kiểm tra tính hợp lệ của mật khẩu đã nhập lại
            function validateConfirmPassword() {
                var passwordInput = document.getElementById("fpassword");
                var confirmPasswordInput = document.getElementById("fcpassword");
                var confirmPassword = confirmPasswordInput.value;

                if (passwordInput.value !== confirmPassword) {
                    confirmPasswordInput.classList.add("is-invalid");
                    return false;
                } else {
                    confirmPasswordInput.classList.remove("is-invalid");
                    return true;
                }
            }


// Hàm kiểm tra tính hợp lệ của tất cả các trường và submit form
            function validateFormProfile() {
                var isValidFirstName = validateFirstName()();
                var isValidLastName = validateLastName()();
                var isValidPhone = validatePhone();
                if (isValidFirstName && isValidLastName && isValidPhone) {
                    document.getElementById("myForm").submit();
                } else {
                    document.getElementById('error').innerHTML = "Wrong change profile!";
                }
            }

            function validationPassword() {
                var isValidPassword = validateConfirmPassword();
                var isValidNewPass = validateNewPassword();
                var isValidConfirmPass = validateConfirmPassword();
                if (isValidPassword && isValidNewPass && isValidConfirmPass) {
                    document.getElementById("myForm1").submit();
                } else {
                    document.getElementById('error1').innerHTML = "Wrong change password!";
                }
            }
        </script>
    </body>
</html>
