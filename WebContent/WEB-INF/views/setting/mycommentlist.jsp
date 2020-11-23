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
                                <h2>Setting</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        <!--? Visit Our Tailor Start -->
        <section class="blog_area single-post-area section-padding">
			<div class="container" style="margin: 0px 55px;">
				<div class="row">
					<div class="col-lg-4">
						<div class="blog_right_sidebar">
						
							<aside class="single_sidebar_widget search_widget" style="padding:40px 30px">
							<div class="align-items-center" style="width:100%; height:100%; text-align:center;">
								<img src="<%=application.getContextPath()%>/resources/assets/img/elements/d.jpg" alt="" width="100" height="100" class="rounded-circle">
								<hr/>
								<h2 class="contact-title">김지훈</h2>
								<p>내 블로그</p>
							</div>
								
							</aside>
							  
							 <aside class="single_sidebar_widget post_category_widget">
								<h4 class="widget_title" style="color: #2d2d2d;">계정 관리</h4>
								<ul class="list cat-list">
									<li><a href="content" class="d-flex">
											<p>내 페이지 설정</p>
											
									</a></li>
									<li><a href="imagechange" class="d-flex">
											<p>내 프로필 사진 변경</p>
											
									</a></li>
									<li><a href="#" class="d-flex">
											<p>비밀번호 변경</p>
											
									</a></li>
									<li><a href="mybloglist" class="d-flex">
											<p>게시글 관리</p>
											
									</a></li>
									<li><a href="mycommentlist" class="d-flex">
											<u><p>댓글 관리</p></u>
											
									</a></li>
									<li><a href="delete" class="d-flex">
											<p>회원 탈퇴</p></u>
											
									</a></li>
									
								</ul>
							</aside>
						</div>
					</div>
			            
						 <div class="col-lg-8 mb-5 mb-lg-0">
						<div class="single-post">
							<div class="feature-img">
								<img class="img-fluid" src="assets/img/blog/single_blog_1.png"
									alt="">
							</div>
							<div class="blog_details">
								<h2 style="color: #2d2d2d;">댓글 관리</h2>
								<hr/ style="margin-top:12px;">
								
						<div class="container">
			                	<div class="row">
			                	<div class="col-md-6">
					                	<!--< div class="dropdown">
										  <button type="button" class="genric-btn default radius" data-toggle="dropdown">
										    	카테고리
										  </button>
										  <div class="dropdown-menu"> 
										  	<a class="dropdown-item" href="#">전체보기</a>
										    <a class="dropdown-item" href="#">요리</a>
										    <a class="dropdown-item" href="#">음악</a>
										    <a class="dropdown-item" href="#">영화</a>
										  </div>
										</div> -->
									</div>
					                <div class="col-md-3">댓글 전체 선택 <label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label></div>
					                <div class="col-md-3"><a href="#" class="genric-btn danger radius small">댓글 삭제</a></div>
			                	</div>
			                </div>
							
                            <!-- 1 -->
                               <div class="blog_details">
                                	<div class="container" style="background-color: #fbf9ff; padding:30px;">
	                                	<div class="row">
		                                    <div class="col-sm-1">
		                                    	<label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label>
		                                    </div>
		                                    <div class="col-sm-11">
		                                    <a class="d-inline-block" href="#">
		                                        <h2 class="blog-head" style="color: #2d2d2d;">[글]Google inks pact for new 35-storey office</h2>
		                                        <p>[댓글] INFO : com.mycompany.webapp.controller.SettingController.content() - 실행</p>
		                                    </a>
		                                    <ul class="blog-info-link">
		                                    	<li><a href="#"><i class="fa fa-user"></i> 댓글 작성자 이름</a></li>
		                                        
		                                        <li><a href="#"><i class="fa fa-calendar"></i> 2020.11.11</a></li>
		                                    </ul>
		                                    </div>
	                                    </div>
                                    </div>
                                </div>

                            
                            <!-- 2 -->
                                <div class="blog_details">
                                	<div class="container" style="background-color: #fbf9ff; padding:30px;">
	                                	<div class="row">
		                                    <div class="col-sm-1">
		                                    	<label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label>
		                                    </div>
		                                    <div class="col-sm-11">
		                                    <a class="d-inline-block" href="#">
		                                        <h2 class="blog-head" style="color: #2d2d2d;">[글]Google inks pact for new 35-storey office</h2>
		                                        <p>[댓글] INFO : com.mycompany.webapp.controller.SettingController.content() - 실행</p>
		                                    </a>
		                                    <ul class="blog-info-link">
		                                    	<li><a href="#"><i class="fa fa-user"></i> 댓글 작성자 이름</a></li>
		                                        
		                                        <li><a href="#"><i class="fa fa-calendar"></i> 2020.11.11</a></li>
		                                    </ul>
		                                    </div>
	                                    </div>
                                    </div>
                                </div>

                            <!-- 3 -->
                                <div class="blog_details">
                                	<div class="container" style="background-color: #fbf9ff; padding:30px;">
	                                	<div class="row">
		                                    <div class="col-sm-1">
		                                    	<label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label>
		                                    </div>
		                                    <div class="col-sm-11">
		                                    <a class="d-inline-block" href="#">
		                                        <h2 class="blog-head" style="color: #2d2d2d;">[글]Google inks pact for new 35-storey office</h2>
		                                        <p>[댓글] INFO : com.mycompany.webapp.controller.SettingController.content() - 실행</p>
		                                    </a>
		                                    <ul class="blog-info-link">
		                                    	<li><a href="#"><i class="fa fa-user"></i> 댓글 작성자 이름</a></li>
		                                        
		                                        <li><a href="#"><i class="fa fa-calendar"></i> 2020.11.11</a></li>
		                                    </ul>
		                                    </div>
	                                    </div>
                                    </div>
                                </div>

                            </div>
                           </div>
			                
			                       
			             </div>
		             </div>
		            </div>
                </section>
        
        <!-- Services End -->
        
        
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