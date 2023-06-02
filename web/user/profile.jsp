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
                        <h2>Login</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Class Start -->

        <div class="d-flex justify-content-center">
            <div class="card">
                <div class="card-header">
                    Input
                    <strong>Sizes</strong>
                </div>
                <div class="card-body card-block">
                    <form action="" method="post" class="form-horizontal">
                        <div class="row form-group">
                            <div class="col col-sm-5">
                                <label for="input-small" class=" form-control-label">Small Input</label>
                            </div>
                            <div class="col col-sm-6">
                                <input type="text" id="input-small" name="input-small" placeholder=".form-control-sm" class="input-sm form-control-sm form-control">
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-sm-5">
                                <label for="input-normal" class=" form-control-label">Normal Input</label>
                            </div>
                            <div class="col col-sm-6">
                                <input type="text" id="input-normal" name="input-normal" placeholder="Normal" class="form-control">
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-sm-5">
                                <label for="input-large" class=" form-control-label">Large Input</label>
                            </div>
                            <div class="col col-sm-6">
                                <input type="text" id="input-large" name="input-large" placeholder=".form-control-lg" class="input-lg form-control-lg form-control">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary btn-sm">
                        <i class="fa fa-dot-circle-o"></i> Submit
                    </button>
                    <button type="reset" class="btn btn-danger btn-sm">
                        <i class="fa fa-ban"></i> Reset
                    </button>
                </div>
            </div>
        </div>
        <!-- Pills content -->


        <!-- Footer Start -->
        <%@include file="gui/footer.jsp" %>
    </body>
</html>
