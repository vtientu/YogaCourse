<%-- 
    Document   : checkout
    Created on : Jun 20, 2023, 7:23:53 PM
    Author     : admin
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="gui/header.jsp" %>
        <style>
            .form-control {
                height: 25px;
                width: 150px;
                border: none;
                border-radius: 0;
                font-weight: 800;
                padding: 0 0 5px 0;
                background-color: transparent;
                box-shadow: none;
                outline: none;
                border-bottom: 2px solid #ccc;
                margin: 0;
                font-size: 14px;
            }

            .form-control:focus {
                box-shadow: none;
                border-bottom: 2px solid #ccc;
                background-color: transparent;
            }

            .form-control2 {
                font-size: 14px;
                height: 20px;
                width: 60px;
                border: none;
                border-radius: 0;
                font-weight: 800;
                padding: 0 0 5px 0;
                background-color: transparent;
                box-shadow: none;
                outline: none;
                border-bottom: 2px solid #ccc;
                margin: 0;
            }

            .form-control2:focus {
                box-shadow: none;
                border-bottom: 2px solid #ccc;
                background-color: transparent;
            }

            .form-control3 {
                font-size: 14px;
                height: 20px;
                width: 30px;
                border: none;
                border-radius: 0;
                font-weight: 800;
                padding: 0 0 5px 0;
                background-color: transparent;
                box-shadow: none;
                outline: none;
                border-bottom: 2px solid #ccc;
                margin: 0;
            }

            .form-control3:focus {
                box-shadow: none;
                border-bottom: 2px solid #ccc;
                background-color: transparent;
            }

            p {
                margin: 0;
            }

            img {
                width: 100%;
                height: 100%;
                object-fit: fill;
            }

            .text-muted {
                font-size: 10px;
            }

            .textmuted {
                color: #6c757d;
                font-size: 13px;
            }

            .fs-14 {
                font-size: 14px;
            }

            .btn.btn-primary {
                width: 100%;
                height: 55px;
                border-radius: 0;
                padding: 13px 0;
                background-color: black;
                border: none;
                font-weight: 600;
            }

            .btn.btn-primary:hover .fas {
                transform: translateX(10px);
                transition: transform 0.5s ease
            }


            .fw-900 {
                font-weight: 900;
            }

            ::placeholder {
                font-size: 12px;
            }

            .ps-30 {
                padding-left: 30px;
            }

            .h4 {
                font-family: 'Work Sans', sans-serif !important;
                font-weight: 800 !important;
            }

            .textmuted,
            h5,
            .text-muted {
                font-family: 'Poppins', sans-serif;
            }

            input.invalid {
                border-bottom: 2px solid red;
            }
        </style>
    </head>
    <body>
        <div class="container" style="margin-top: 130px">
            <div class="row m-0">
                <div class="col-lg-7 pb-5 pe-lg-5">
                    <div class="row">
                        <div class="col-12 p-5">
                            <img src="${classOrder.course.image}"
                                 alt="">
                        </div>
                        <div class="row m-0 bg-light">
                            <div class="col-md-4 col-6 ps-30 pe-0 my-4">
                                <p class="text-muted">Course Name</p>
                                <p class="h5">${classOrder.course.courseName}</p>
                            </div>
                            <div class="col-md-4 col-6  ps-30 my-4">
                                <p class="text-muted">Category</p>
                                <p class="h5 m-0">${classOrder.course.category.categoryName}</p>
                            </div>
                            <div class="col-md-4 col-6 ps-30 my-4">
                                <p class="text-muted">Trainer</p>
                                <p class="h5 m-0">${classOrder.trainer.displayName}</p>
                            </div>
                            <div class="col-md-4 col-6 ps-30 my-4">
                                <p class="text-muted">Class Name</p>
                                <p class="h5 m-0">${classOrder.className}</p>
                            </div>
                            <div class="col-md-4 col-6 ps-30 my-4">
                                <p class="text-muted">Total Lession</p>
                                <p class="h5 m-0">${classOrder.course.totalDay}</p>
                            </div>
                            <div class="col-md-4 col-6 ps-30 my-4">
                                <p class="text-muted">Time</p>
                                <p class="h5 m-0">${classOrder.startTime} - ${classOrder.endTime}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 p-0 ps-lg-4">
                    <div class="row m-0">
                        <div class="col-12 px-4">
                            <div class="d-flex align-items-end mt-4 mb-2">
                                <p class="h4 m-0"><span class="pe-1">Course Payment</span></p>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <p class="textmuted">Enroll Date</p>
                                <%
                                    LocalDate currentDate = LocalDate.now();
                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                                    String formattedDate = currentDate.format(formatter);
                                %>
                                <p class="fs-14 fw-bold"><%=formattedDate%></p>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <p class="textmuted">Price</p>
                                <p class="fs-14 fw-bold">${classOrder.course.price}  <span class="fas fa-dollar-sign pe-1"></span></p>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <p class="textmuted">Discount</p>
                                <p class="fs-14 fw-bold">${classOrder.course.discount == null?'None':classOrder.course.discount}  %</p>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <p class="textmuted fw-bold">Total</p>
                                <div class="d-flex align-text-top ">
                                    <span class="h4">${classOrder.course.priceDiscount}</span>  <span class="fas fa-dollar-sign mt-1 pe-1 fs-14 "></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 px-0">
                            <form action="checkout" id="myForm" method="post">
                                <input  name="cid" value="${classOrder.classID}" hidden=""/>
                                <div class="row bg-light m-0">
                                    <div class="col-12 px-4 my-4">
                                        <p class="fw-bold">Payment detail</p>
                                    </div>
                                    <div class="col-12 px-4">
                                        <div class="d-flex  mb-4">
                                            <span class="">
                                                <p class="text-muted">Card number</p>
                                                <input class="form-control" type="text"
                                                       placeholder="1234 5678 9012 3456" name="cardNumber">
                                            </span>
                                            <div class="w-100 d-flex flex-column align-items-end">
                                                <p class="text-muted">Expires</p>
                                                <input class="form-control2" type="text" placeholder="MM/YYYY" name="expires">
                                            </div>
                                        </div>
                                        <div class="d-flex mb-5">
                                            <span class="me-5">
                                                <p class="text-muted">Cardholder name</p>
                                                <input class="form-control" type="text" 
                                                       placeholder="Name" name="cardName">
                                            </span>
                                            <div class="w-100 d-flex flex-column align-items-end">
                                                <p class="text-muted">CVC</p>
                                                <input class="form-control3" type="text" name="cvc" placeholder="XXX">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0">
                                    <div class="col-12  mb-4 p-0">
                                        <button class="btn btn-primary" onclick="return validateInput()">Purchase<span class="fas fa-arrow-right ps-2"></span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function validateInput() {
                var cardNumberInput = document.getElementsByName('cardNumber')[0];
                var expiresInput = document.getElementsByName('expires')[0];
                var cardNameInput = document.getElementsByName('cardName')[0];
                var cvcInput = document.getElementsByName('cvc')[0];

                // Kiểm tra tính hợp lệ của cardNumber (chỉ chấp nhận số và khoảng trắng)
                var cardNumberRegex = /^\d{12}$/;
                if (!cardNumberRegex.test(cardNumberInput.value)) {
                    cardNumberInput.classList.add('invalid');
                } else {
                    cardNumberInput.classList.remove('invalid');
                }

                // Kiểm tra tính hợp lệ của expires (theo định dạng MM/YYYY)
                var expiresRegex = /^(0[1-9]|1[0-2])\/\d{4}$/;
                if (!expiresRegex.test(expiresInput.value)) {
                    expiresInput.classList.add('invalid');
                } else {
                    expiresInput.classList.remove('invalid');
                }

                // Kiểm tra tính hợp lệ của cardName (chỉ chấp nhận chữ cái và khoảng trắng)
                var cardNameRegex = /^[A-Za-z\s]+$/;
                if (!cardNameRegex.test(cardNameInput.value)) {
                    cardNameInput.classList.add('invalid');
                } else {
                    cardNameInput.classList.remove('invalid');
                }

                // Kiểm tra tính hợp lệ của cvc (chỉ chấp nhận 3 chữ số)
                var cvcRegex = /^\d{3}$/;
                if (!cvcRegex.test(cvcInput.value)) {
                    cvcInput.classList.add('invalid');
                } else {
                    cvcInput.classList.remove('invalid');
                }

                // Kiểm tra nếu có ít nhất một trường input bị không hợp lệ
                if (
                        cardNumberInput.classList.contains('invalid') ||
                        expiresInput.classList.contains('invalid') ||
                        cardNameInput.classList.contains('invalid') ||
                        cvcInput.classList.contains('invalid')
                        ) {
                    return false;
                }

                // Nếu tất cả các trường đều hợp lệ, submit form
                var form = document.getElementById('myForm'); // Thay 'myForm' bằng ID của form thực tế của bạn
                form.submit();

                // Trả về false để ngăn chặn sự kiện mặc định của nút 'Purchase'
                return false;
            }


        </script>

        <%@include file="gui/footer.jsp" %>
    </body>
</html>
