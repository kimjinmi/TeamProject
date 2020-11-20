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
    <link rel="shortcut icon" type="image/x-icon" href="resources/assets/img/favicon.ico">

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
    
    <style>
    
 	.section-top-border h3{
 	font-size: 24px;
 	font-weight: 250px;
 	margin-bottom: 30px;
 	}
    
 	.section-top-border i {
 		font-size: 20px;
 		margin: 10px 10px 0 0 ;
 		color: 940128;
 	}

    </style>
    
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
								<h2>Sign up</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Hero End -->
		
		
		<!--? Start Sample Area -->
		 <div class="container-fluid">
		 	<div class="row">
		 		<div class="col-md-2">
		 		</div>
					<div class="col-md-5">
						<section class="sample-text-area" style="padding-bottom: 0; padding-top: 70px;">
							<div class="container box_1170">
								<hr align="left" style="border: solid 1px black; width: 100%;">
									<h3 class="text-heading" style="font-size: 30px;">회원가입 여부 안내</h3>
							</div>
						</section>
		<!-- End Sample Area 여기까지 회원가입 제목 사용-->  

								<!--? Start Align Area -->
								<div class="whole-wrap">
									<div class="container box_1170">
										<div class="section-top-border" style="padding-top: 30px;">
													<ul>
														<li>
															기존 회원가입 정보와 일치하는 정보를 입력하셔야 회원가입 여부를 정확하게  확인하실 수 있습니다.
														</li>
														<li style="color: orange; padding-bottom: 30px;">
															입력하신 정보는 회원가입 여부에만 사용되며 저장되지 않습니다.
														</li>
													</ul>
													<form action="#">									
														<div class="input-group mb-3">
                        									<input type="text" class="form-control" placeholder='  이메일을 입력하세요' 
                        									onfocus="this.placeholder = ''" onblur="this.placeholder = '  이메일을 입력하세요'" 
                        									style="height:45px; font-size:16px;">
														</div>			
														<div class="button-group-area mt-40" style="font-size: 20px; padding-bottom: 40px;">
														<a href="views/home.jsp" class="genric-btn info circle" style="width: 100%;">가입 여부 확인</a>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-5">
									<img src="<%=application.getContextPath()%>/resources/images/ponyo1.png" style="padding-top: 110px;">
									</div>
								</div>
							</div>
					

								<!-- End Align Area -->
								
							</main>
			   <footer>
        <div class="footer-wrapper section-bg2"  data-background="assets/img/gallery/footer-bg.png">
        <!-- Footer Start-->
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        
          <!-- Footer End-->
      </div>
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