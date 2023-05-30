<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="gui/header.jsp" %>
        <style>
            .login-with-google-btn {
                transition: background-color .3s, box-shadow .3s;

                padding: 12px 16px 12px 42px;
                border: none;
                border-radius: 3px;
                box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 1px 1px rgba(0, 0, 0, .25);

                color: #757575;
                font-size: 14px;
                font-weight: 500;
                font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen,Ubuntu,Cantarell,"Fira Sans","Droid Sans","Helvetica Neue",sans-serif;

                background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMTcuNiA5LjJsLS4xLTEuOEg5djMuNGg0LjhDMTMuNiAxMiAxMyAxMyAxMiAxMy42djIuMmgzYTguOCA4LjggMCAwIDAgMi42LTYuNnoiIGZpbGw9IiM0Mjg1RjQiIGZpbGwtcnVsZT0ibm9uemVybyIvPjxwYXRoIGQ9Ik05IDE4YzIuNCAwIDQuNS0uOCA2LTIuMmwtMy0yLjJhNS40IDUuNCAwIDAgMS04LTIuOUgxVjEzYTkgOSAwIDAgMCA4IDV6IiBmaWxsPSIjMzRBODUzIiBmaWxsLXJ1bGU9Im5vbnplcm8iLz48cGF0aCBkPSJNNCAxMC43YTUuNCA1LjQgMCAwIDEgMC0zLjRWNUgxYTkgOSAwIDAgMCAwIDhsMy0yLjN6IiBmaWxsPSIjRkJCQzA1IiBmaWxsLXJ1bGU9Im5vbnplcm8iLz48cGF0aCBkPSJNOSAzLjZjMS4zIDAgMi41LjQgMy40IDEuM0wxNSAyLjNBOSA5IDAgMCAwIDEgNWwzIDIuNGE1LjQgNS40IDAgMCAxIDUtMy43eiIgZmlsbD0iI0VBNDMzNSIgZmlsbC1ydWxlPSJub256ZXJvIi8+PHBhdGggZD0iTTAgMGgxOHYxOEgweiIvPjwvZz48L3N2Zz4=);
                background-color: white;
                background-repeat: no-repeat;
                background-position: 12px 14px;

                &:hover {
                    box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 2px 4px rgba(0, 0, 0, .25);
                }

                &:active {
                    background-color: #eeeeee;
                }

                &:focus {
                    outline: none;
                    box-shadow:
                        0 -1px 0 rgba(0, 0, 0, .04),
                        0 2px 4px rgba(0, 0, 0, .25),
                        0 0 0 3px #c8dafc;
                }

                &:disabled {
                    filter: grayscale(100%);
                    background-color: #ebebeb;
                    box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 1px 1px rgba(0, 0, 0, .25);
                    cursor: not-allowed;
                }
            }
        </style>
    </head>

    <body>

        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Login</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Class Start -->

        <div class="d-flex justify-content-center">
            <div style="width: 50%">
                <!-- Pills navs -->
                <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link  ${action == 'login' || action == null?'active':''}" id="tab-login" data-toggle="pill" href="#pills-login" role="tab"
                           aria-controls="pills-login" aria-selected="true">Login</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link  ${action == 'register'?'active':''}" id="tab-register" data-toggle="pill" href="#pills-register" role="tab"
                           aria-controls="pills-register" aria-selected="false">Register</a>
                    </li>
                </ul>
                <!-- Pills navs -->

                <!-- Pills content -->
                <div class="tab-content">
                    <div class="tab-pane fade ${action == 'login' || action == null?'show active':''}" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                        <form action="home" method="post">
                            <div class="text-center mb-3">
                                <p>Sign in with:</p>
                                <a type="button" style="text-decoration: none" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&openid.realm&include_granted_scopes=true&redirect_uri=http://localhost:8080/SWP_Project/login-google&response_type=code&client_id=645992422441-5f4gr9kv1gv4escg73k2td90c7oque7t.apps.googleusercontent.com&approval_prompt=force" class="login-with-google-btn align-items-center">Google
                                </a>
                            </div>

                            <p class="text-center">or:</p>

                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <label class="form-label" for="loginName">Email</label>
                                <input type="email" id="loginName" name="email" class="form-control" required="" />
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <label class="form-label" for="loginPassword">Password</label>
                                <input type="password" id="loginPassword" name="password" class="form-control"  required=""/>
                            </div>

                            <!-- 2 column grid layout -->
                            <div class="row mb-4">
                                <div class="px-5">
                                    <!-- Simple link -->
                                    <a ref="#!" style="float: right">Forgot password?</a>
                                </div>
                            </div>
                            <c:if test="${messageLogin != null}">
                                <span style="color: red">${messageLogin}</span><br/>
                            </c:if>
                            <!-- Submit button -->
                            <button type="submit" name="submit" value="login"  class="btn btn-primary btn-block mb-4">Sign in</button>
                        </form>
                    </div>
                    <div class="tab-pane fade ${action == 'register'?'show active':''}" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
                        <form class="mb-4" action="home" method="post">
                            <!-- Name input -->
                            <div class="row">
                                <div class="form-outline my-4 col-12 col-md-6">
                                    <label class="form-label" for="firstName">FirstName</label>
                                    <input type="text" id="firstName" class="form-control" name="firstName" required=""/>
                                </div>
                                <div class="form-outline my-4 col-12 col-md-6">
                                    <label class="form-label" for="lastName">LastName</label>
                                    <input type="text" id="lastName" class="form-control" name="lastName" required=""/>
                                </div>
                            </div>


                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <label class="form-label" for="registerEmail">Email</label>
                                <input type="email" id="registerEmail" class="form-control" name="email" required=""/>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <label class="form-label" for="registerPhone">Phone</label>
                                <input type="text" id="registerPhone" class="form-control" name="phone" required=""/>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <label class="form-label" for="registerPassword">Password</label>
                                <input type="password" id="registerPassword" class="form-control" name="password" required=""/>
                                <small>* Password must contain at least 1 uppercase letter, 1 lowercase letter and 1 number</small>
                            </div>

                            <c:if test="${messageRegister != null}">
                                <span style="color: red">${messageRegister}</span><br/>
                            </c:if>

                            <!-- Submit button -->
                            <button type="submit" name="submit" value="register" class="btn btn-primary btn-block mb-3">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pills content -->


        <!-- Footer Start -->
        <%@include file="gui/footer.jsp" %>
        <script>
            function validatePhoneNumber(phoneNumber) {
                var phonePattern = /^\d{10}$/;

                if (phonePattern.test(phoneNumber)) {
                    return true;
                } else {
                    return false;
                }
            }

            function validatePassword(password) {
                var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/;

                if (passwordPattern.test(password)) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </body>
</html>
