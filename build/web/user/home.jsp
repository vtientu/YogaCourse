<%-- 
    Document   : home.jsp
    Created on : May 28, 2023, 11:28:10 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="gui/header.jsp" %>
    </head>

    <body>
        <!-- Top Bar Start -->
        

        <!-- Hero Start -->
        <div class="hero">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-sm-12 col-md-6">
                        <div class="hero-text">
                            <h1>Yoga Practice For Good Health</h1>
                            <p>
                                Lorem ipsum dolor sit amet elit. Phasell nec pretum mi. Curabi ornare velit non. Aliqua metus tortor auctor quis sem.
                            </p>
                            <div class="hero-btn">
                                <a class="btn" href="">Join Now</a>
                                <a class="btn" href="">Contact Us</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <div class="hero-image">
                            <img src="../user/assets/img/hero.png" alt="Hero Image">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- About Start -->
        <div class="about wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-6">
                        <div class="about-img">
                            <img src="../user/assets/img/about.png" alt="Image">
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-6">
                        <div class="section-header text-left">
                            <p>Learn About Us</p>
                            <h2>Welcome to Yooga</h2>
                        </div>
                        <div class="about-text">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                            </p>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem. Curabitur non nisl nec nisi scelerisque maximus.
                            </p>
                            <a class="btn" href="">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Service Start -->
        <div class="service">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>What we do</p>
                    <h2>Yoga For Health</h2>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.0s">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="flaticon-workout"></i>
                            </div>
                            <h3>Heal emotions</h3>
                            <p>
                                Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                        <div class="service-item active">
                            <div class="service-icon">
                                <i class="flaticon-workout-1"></i>
                            </div>
                            <h3>Body Refreshes</h3>
                            <p>
                                Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="flaticon-workout-2"></i>
                            </div>
                            <h3>Mind & Serenity</h3>
                            <p>
                                Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="flaticon-workout-3"></i>
                            </div>
                            <h3>Enjoy Your life</h3>
                            <p>
                                Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.8s">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="flaticon-workout-4"></i>
                            </div>
                            <h3>Body & Spirituality</h3>
                            <p>
                                Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="1s">
                        <div class="service-item">
                            <div class="service-icon">
                                <i class="flaticon-yoga-pose"></i>
                            </div>
                            <h3>Body & Mind</h3>
                            <p>
                                Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->

        <!-- Discount Start -->
        <div class="discount wow zoomIn" data-wow-delay="0.1s">
            <div class="container">
                <div class="section-header text-center">
                    <p>Awesome Discount</p>
                    <h2>Get <span>30%</span> Discount for all Classes</h2>
                </div>
                <div class="container discount-text">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem. Curabitur non nisl nec nisi scelerisque maximus. 
                    </p>
                    <a class="btn">Join Now</a>
                </div>
            </div>
        </div>
        <!-- Discount End -->
        
        
        <!-- Price Start -->
        <div class="price">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Yoga Package</p>
                    <h2>Yoga Pricing Plan</h2>
                </div>
                <div class="row">
                    <div class="col-md-4 wow fadeInUp" data-wow-delay="0.0s">
                        <div class="price-item">
                            <div class="price-header">
                                <div class="price-title">
                                    <h2>Basic</h2>
                                </div>
                                <div class="price-prices">
                                    <h2><small>$</small>49<span>/ mo</span></h2>
                                </div>
                            </div>
                            <div class="price-body">
                                <div class="price-description">
                                    <ul>
                                        <li>Personal Trainer</li>
                                        <li>Special Class</li>
                                        <li>Free Tutorials</li>
                                        <li>Group Training</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="price-footer">
                                <div class="price-action">
                                    <a class="btn" href="">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="price-item featured-item">
                            <div class="price-header">
                                <div class="price-status">
                                    <span>Popular</span>
                                </div>
                                <div class="price-title">
                                    <h2>Standard</h2>
                                </div>
                                <div class="price-prices">
                                    <h2><small>$</small>99<span>/ mo</span></h2>
                                </div>
                            </div>
                            <div class="price-body">
                                <div class="price-description">
                                    <ul>
                                        <li>Personal Trainer</li>
                                        <li>Special Class</li>
                                        <li>Free Tutorials</li>
                                        <li>Group Training</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="price-footer">
                                <div class="price-action">
                                    <a class="btn" href="">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="price-item">
                            <div class="price-header">
                                <div class="price-title">
                                    <h2>Premium</h2>
                                </div>
                                <div class="price-prices">
                                    <h2><small>$</small>149<span>/ mo</span></h2>
                                </div>
                            </div>
                            <div class="price-body">
                                <div class="price-description">
                                    <ul>
                                        <li>Personal Trainer</li>
                                        <li>Special Class</li>
                                        <li>Free Tutorials</li>
                                        <li>Group Training</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="price-footer">
                                <div class="price-action">
                                    <a class="btn" href="">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Price End -->
        
        
        <!-- Testimonial Start -->
        <div class="testimonial wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="section-header text-center">
                    <p>Testimonial</p>
                    <h2>Our Client Say!</h2>
                </div>
                <div class="owl-carousel testimonials-carousel">
                    <div class="testimonial-item">
                        <div class="testimonial-img">
                            <img src="../user/assets/img/testimonial-1.jpg" alt="Image">
                        </div>
                        <div class="testimonial-text">
                            <p>
                                Lorem ipsum dolor sit amet consec adipis elit. Etiam accums lacus eget velit tincid, quis suscip justo dictum.
                            </p>
                            <h3>Customer Name</h3>
                            <h4>Profession</h4>
                        </div>
                    </div>
                    <div class="testimonial-item">
                        <div class="testimonial-img">
                            <img src="../user/assets/img/testimonial-2.jpg" alt="Image">
                        </div>
                        <div class="testimonial-text">
                            <p>
                                Lorem ipsum dolor sit amet consec adipis elit. Etiam accums lacus eget velit tincid, quis suscip justo dictum.
                            </p>
                            <h3>Customer Name</h3>
                            <h4>Profession</h4>
                        </div>
                    </div>
                    <div class="testimonial-item">
                        <div class="testimonial-img">
                            <img src="../user/assets/img/testimonial-3.jpg" alt="Image">
                        </div>
                        <div class="testimonial-text">
                            <p>
                                Lorem ipsum dolor sit amet consec adipis elit. Etiam accums lacus eget velit tincid, quis suscip justo dictum.
                            </p>
                            <h3>Customer Name</h3>
                            <h4>Profession</h4>
                        </div>
                    </div>
                    <div class="testimonial-item">
                        <div class="testimonial-img">
                            <img src="../user/assets/img/testimonial-4.jpg" alt="Image">
                        </div>
                        <div class="testimonial-text">
                            <p>
                                Lorem ipsum dolor sit amet consec adipis elit. Etiam accums lacus eget velit tincid, quis suscip justo dictum.
                            </p>
                            <h3>Customer Name</h3>
                            <h4>Profession</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->

        <!-- Footer Start -->
        <%@include file="gui/footer.jsp" %>
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        
    </body>
</html>