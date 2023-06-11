<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="gui/header.jsp" %>
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
                        <div class="row">
                            <div class="col-12 col-sm-auto mb-3">
                                <div class="mx-auto" style="width: 140px;">
                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                        <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${account.displayName}</h4>
                                    <p class="mb-0">${account.role.roleName}</p>
                                    <div class="mt-2">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fa fa-fw fa-camera"></i>
                                            <span>Change Photo</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="text-center text-sm-right">
                                    <span class="badge badge-secondary">administrator</span>
                                </div>
                            </div>
                        </div>
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a data-toggle="tab" href="#profile" class="active nav-link">Profile</a></li>
                            <li class="nav-item"><a data-toggle="tab" href="#changepassword" class="nav-link">Change Password</a></li>
                        </ul>
                        <div class="tab-content pt-3">
                            <div class="tab-pane fade show active" id="profile">
                                <form class="form" novalidate="">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row my-4">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>First Name</label>
                                                        <input class="form-control" type="text" name="firstName" placeholder="First Name" value="${account.firstName}">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <input class="form-control" type="text" name="lastName" placeholder="Last Name" value="${account.lastName}">
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
                                                        <input class="form-control" type="tel" placeholder="Enter your phone" value="${account.phone}">
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
                                    <div class="row">
                                        <div class="col d-flex justify-content-end">
                                            <button class="btn btn-primary" type="submit">Save Changes</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="changepassword">
                                <form class="form" novalidate="">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 mb-3">
                                            <div class="mb-2"><b>Change Password</b></div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Current Password</label>
                                                        <input class="form-control" type="password" placeholder="••••••">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>New Password</label>
                                                        <input class="form-control" type="password" placeholder="••••••">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
                                                        <input class="form-control" type="password" placeholder="••••••"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col d-flex justify-content-end">
                                            <button class="btn btn-primary" type="submit">Save Changes</button>
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
    </body>
</html>
