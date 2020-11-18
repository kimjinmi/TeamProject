<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>HOBBYS</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/gijgo.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/animated-headline.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/slick.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/nice-select.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/style.css">
</head>
<body>
    <!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header ">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                           
                            <div class="col-xl-10 col-lg-10">
                                <div class="menu-wrapper  d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <jsp:include page="/WEB-INF/views/include/menu.jsp"/>
                                </div>
                            </div> 
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <main>
        <!--? Hero Start -->
        <div class="slider-area2 ">
            <div class="slider-height2 hero-overly d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero__caption hero__caption2">
                                <h2>About Us</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        <!--? About 1 Start-->
        <section class="about-low-area about-low-area2 section-padding30">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-xl-6 col-lg-6 col-md-10">
                        <div class="about-caption mb-50">
                            <!-- Section Tittle -->
                            <div class="section-tittle mb-35">
                                <h2>Hassle-Free Drone<br> Photography</h2>
                            </div>
                            <p class="about-cap-top">Inasfa reprehenderit in voluptate velit esse 
                            cillum reeut cupidatatfug nulla pariatur.</p>
                            <p>Aute irure dolor inasfa reprehenderit in voluptate velit esse 
                                cillum reeut cupidatatfug nulla pariatur. Excepteur sintxsdfas 
                            occaecat.</p>
                            <a href="#" class="btn black-btn">Explore services</a>
                        </div>
                    </div>
                    <div class="offset-xl-0 col-xl-6 offset-lg-0 col-lg-6 col-md-9 offset-md-1 offset-sm-1">
                        <div class="about-right-cap">
                            <div class="about-right-img">
                                <img src="assets/img/gallery/about1.png" alt="">
                            </div>
                            <div class="img-cap">
                                <span>20</span>
                                <p>Years of experience</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About  End-->
        <!--? video_start -->
        <div class="video-area section-bg2 d-flex align-items-end fix"  data-background="assets/img/gallery/video-bg.png">
            <!-- Video icon -->
            <div class="video-icon" >
                <a class="popup-video btn-icon" href="https://www.youtube.com/watch?v=up68UAfH0d0"><i class="fas fa-play"></i></a>
            </div>
            <div class="container">
                <div class="video-contents">
                    <div class="row justify-content-between">
                        <div class="col-xl-5 col-lg-5 col-md-10">
                            <div class="section-tittle  mb-90">
                                <h2>How we work?</h2>
                                <p class="tittle-pera1">Inasfa reprehenderit in voluptate velit esse  cillum reeut cupidatatfug nulla pariatur.</p>
                                <p>Aute irure dolor inasfa reprehenderit in voluptate velit esse cillum reeut cupidatatfug nulla pariatur. Excepteur sintxsdfas occaecat.</p>
                                <a href="#" class="btn black-btn">Start a Project</a>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-6 col-md-8">
                            <div class="edu-details">
                                <!-- single-item -->
                                <div class="single-items mb-50">
                                    <span>Tell Us About Your Project</span>
                                    <p>Aute irure dolor inasfa prehenderit  in voluptate velit esse cillum.</p>
                                </div>
                                <!-- single-item -->
                                <div class="single-items single-items2 mb-50">
                                    <span>We'll Schedule a Flight</span>
                                    <p>Aute irure dolor inasfa prehenderit in voluptate velit esse cillum.</p>
                                </div>
                                <!-- single-item -->
                                <div class="single-items single-items3 mb-50">
                                    <span>We'll Schedule a Flight</span>
                                    <p>Aute irure dolor inasfa prehenderit in voluptate velit esse cillum.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--? Testimonial Area Start -->
        <section class="testimonial-area testimonial-padding fix section-bg" data-background="assets/img/gallery/section_bg03.png">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class=" col-lg-9">
                        <div class="about-caption">
                            <!-- Testimonial Start -->
                            <div class="h1-testimonial-active dot-style">
                                <!-- Single Testimonial -->
                                <div class="single-testimonial position-relative">
                                    <div class="testimonial-caption">
                                        <img src="assets/img/icon/quotes-sign.png" alt="" class="quotes-sign">
                                        <p>"The automated process starts as soon as your clothe go into the machine. This site outcome is gleaming clothe. Placeholder text commonly used. In publishing and graphic.</p>
                                    </div>
                                    <!-- founder -->
                                    <div class="testimonial-founder d-flex align-items-center">
                                        <div class="founder-img">
                                            <img src="assets/img/icon/testimonial.png" alt="">
                                        </div>
                                        <div class="founder-text">
                                            <span>Robart Brown</span>
                                            <p>Creative designer at Colorlib</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Testimonial -->
                                <div class="single-testimonial position-relative">
                                    <div class="testimonial-caption">
                                        <img src="assets/img/icon/quotes-sign.png" alt="" class="quotes-sign">
                                        <p>"The automated process starts as soon as your clothe go into the machine. This site outcome is gleaming clothe. Placeholder text commonly used. In publishing and graphic.</p>
                                    </div>
                                    <!-- founder -->
                                    <div class="testimonial-founder d-flex align-items-center">
                                        <div class="founder-img">
                                            <img src="assets/img/icon/testimonial.png" alt="">
                                        </div>
                                        <div class="founder-text">
                                            <span>Robart Brown</span>
                                            <p>Creative designer at Colorlib</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Testimonial End -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--? Testimonial Area End -->
        <div class="contact-form">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-wrapper">
                            <div class="row ">
                                <div class="col-xl-12 col-lg-11 col-md-8 col-lg-7 col-sm-9">
                                    <div class="section-tittle mb-30">
                                        <h2>Get a Quote</h2>
                                        <p>Inasfa reprehenderit in voluptate velit esse cillum reeut cupidatatfug nulla pariatur.</p>
                                    </div>
                                </div>
                            </div>
                            <form id="contact-form" action="#" method="POST">
                                <div class="row">
                                    <div class="col-lg-12 col-md-6">
                                        <div class="form-box user-icon mb-15">
                                            <input type="text" name="name" placeholder="Your Name">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6">
                                        <div class="form-box email-icon mb-15">
                                            <input type="text" name="email" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6">
                                        <div class="form-box email-icon mb-15">
                                            <input type="text" name="email" placeholder="Phone no.">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6 mb-15">
                                        <div class="select-itms">
                                            <select name="select" id="select2">
                                                <option value="">Topic</option>
                                                <option value="">Topic one</option>
                                                <option value="">Topic Two</option>
                                                <option value="">Topic Three</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-box message-icon mb-15">
                                            <textarea name="message" id="message" placeholder="Message"></textarea>
                                        </div>
                                        <div class="submit-info">
                                            <button class="submit-btn2" type="submit">Send Message</button>
                                        </div>
                                    </div>
                                </div>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="contact-img">
                <img src="resources/assets/img/gallery/contact-img.png" alt="">
            </div>
        </div>
    </main>
    <footer>

        <!-- Footer Start-->
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        
          <!-- Footer End-->
      
  </footer>
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->

<script src="<%=application.getContextPath()%>/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="<%=application.getContextPath()%>/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/popper.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="<%=application.getContextPath()%>/resources/assets/js/owl.carousel.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/slick.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="<%=application.getContextPath()%>/resources/assets/js/wow.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/animated.headline.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.magnific-popup.js"></script>

<!-- Date Picker -->
<script src="<%=application.getContextPath()%>/resources/assets/js/gijgo.min.js"></script>
<!-- Nice-select, sticky -->
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.nice-select.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.sticky.js"></script>
<!-- Progress -->
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.barfiller.js"></script>

<!-- counter , waypoint,Hover Direction -->
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.counterup.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/waypoints.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.countdown.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script src="<%=application.getContextPath()%>/resources/assets/js/contact.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.form.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.validate.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/mail-script.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="<%=application.getContextPath()%>/resources/assets/js/plugins.js"></script>
<script src="<%=application.getContextPath()%>/resources/assets/js/main.js"></script>
    
</body>
</html>