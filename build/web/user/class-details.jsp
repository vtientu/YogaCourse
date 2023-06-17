<%-- 
    Document   : blog-details
    Created on : May 29, 2023, 12:04:32 AM
    Author     : admin
--%>

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
                        <h2>Detail Page</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Detail Page</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Single Post Start-->
        <div class="single">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="single-content wow fadeInUp">
                            <h1>${classModule.className} - <span>${classModule.course.courseName}</span></h1>
                            <img src="${classModule.course.image}" />
                            <h4>Description Course</h4>
                            <p>
                                ${classModule.course.description}
                            </p>

                        </div>
                        <div class="single-bio wow fadeInUp">
                            <div>
                                <img src="${classModule.trainer.avatar}"  width="50px"/>
                            </div>
                            <div class="single-bio-text">
                                <h3>${classModule.trainer.displayName}</h3>
                                <span>
                                    Contact: ${classModule.trainer.email}
                                </span>
                            </div>
                        </div>

                        <div class="single-comment wow fadeInUp">
                            <h2>3 Comments</h2>
                            <ul class="comment-list">
                                <li class="comment-item">
                                    <c:forEach items="${listFeed}" var="listf">
                                        <div class="comment-body">
                                            <div class="comment-img">
                                                <img src="${listf.account.avatar}" />
                                            </div>
                                            <div class="comment-text">
                                                <h3>${listf.account.displayName}</h3>
                                                <h5 class="my-2">Rating: ${listf.rating} <i class="fa fa-star text-warning"></i></h5>
                                                <p>
                                                   ${listf.description}
                                                </p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </li>
                            </ul>
                        </div>
                        <c:if test="${account != null}">
                            <div class="comment-form wow fadeInUp">
                                <h2>Comment</h2>
                                <form action="class-details" method="post">
                                    <input name="classId" value="${classModule.classID}" hidden=""/>
                                    <div class="form-group">
                                        <label for="name">Rating *</label>
                                        <select class="form-control" id="name" name="rate">
                                            <option value="1"><strong> 1 </strong></option>
                                            <option value="2"><strong> 2 </strong></option>
                                            <option value="3"><strong> 3 </strong></option>
                                            <option value="4"><strong> 4 </strong></option>
                                            <option value="5"><strong> 5 </strong></option>
                                        </select>
                                    </div>
                                    <div class="form-group my-2">
                                        <label for="message">Message </label>
                                        <textarea id="message" name="description" cols="30" rows="5" class="form-control"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn" name="cid" value="${classModule.course.courseID}">Post Comment</button>
                                    </div>
                                </form>
                            </div>
                        </c:if>
                    </div>

                    <div class="col-lg-4">
                        <div class="sidebar">
                            <div class="sidebar-widget wow fadeInUp">
                                <div class="card" style="margin-top: 70px ">
                                    <div class="card-header">
                                        <h3 class="card-title text-center">Course Information</h3>
                                    </div>
                                    <div class="card-body text-center">
                                        <label>Schedule: ${classModule.dayOfWeek}</label><br/>
                                        <label><i class="fa fa-regular fa-clock"></i> ${classModule.startTime} - ${classModule.endTime}</label><br/>
                                        <button class="btn btn-success my-3">Buy <strong>${classModule.course.price} $</strong></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Post End-->   


        <!-- Footer Start -->
        <%@include file="gui/footer.jsp" %>
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    </body>
</html>

