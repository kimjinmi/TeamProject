<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="shortcut icon" type="image/x-icon"
	href="resources/assets/img/favicon.ico">
 
<!-- CSS here -->
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/slicknav.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/gijgo.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/animate.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/animated-headline.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/slick.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/nice-select.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/style.css">
</head>

<body>
	<!-- ? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
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
								<div
									class="menu-wrapper  d-flex align-items-center justify-content-end">
									<!-- Main-menu -->
									<jsp:include page="/WEB-INF/views/include/menu.jsp" />
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
								<h2>MANAGER</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Hero End -->
		<!--? Blog Area Start -->
		<section class="blog_area single-post-area section-padding">
			<div class="container" style="margin: 0px 55px;">
				<div class="row">
				<div class="col-lg-4">
						<div class="blog_right_sidebar">
						
							<aside class="single_sidebar_widget search_widget" style="padding:40px 30px">
							<div class="align-items-center" style="width:100%; height:100%; text-align:center;">
								<img src="photodownload?fileName=${member.mmyimage}" alt="" width="100" height="100" class="rounded-circle"><br>
								<hr/>
								<h2 class="contact-title">${member.mnickname}</h2>
								<p>${member.mintro}</p>
								
								<hr/>
		                        <!-- 게시글 작성 버튼 -->
		                        <a class="genric-btn primary e-large" href="javascript:boardWrite()">POSTING</a>
		                        
		                        <!-- 게시글 작성 버튼 -->
		                        </div>
							</aside>
							
							<aside class="single_sidebar_widget post_category_widget">
								<h4 class="widget_title" style="color: #2d2d2d;">계정 관리</h4>
								<ul class="list cat-list">
									
									<li><a href="javascript:setting()" class="d-flex">
										<p>내 페이지 설정</p></a>
										
											
									</li>
									<li><a href="javascript:imagechange()" class="d-flex">
										<p>프로필 사진 설정</p></a>
										<script type="text/javascript">
											function imagechange(){
												$.ajax({
													url:"imagechange",
													success:function(data) {
														$("#setting_result").html(data);
													}
												});
												
											}
										
										</script>
											
									</li>
									<li><a href="javascript:passwordchange()" class="d-flex">
											<p>비밀번호 변경</p></a>
											<script type="text/javascript">
											function passwordchange(){
												$.ajax({
													url:"passwordchange",
													success:function(data) {
														$("#setting_result").html(data);
													}
												});
											}
											</script>
									</li>
									<li><a href="javascript:mybloglist()" class="d-flex" >
											<p>게시글 관리</p></a>
										<script type="text/javascript">
										function mybloglist(pageNo){
											if(!pageNo){
												pageNo = 1;
											}
											$.ajax({
												url:"mybloglist",
												success:function(data) {
													$("#setting_result").html(data);
												}
											});
											
										}
										</script>	
									</li>
									<li><a href="javascript:mybloglist()" class="d-flex" style="padding-top: '15px';">
										
												<p>댓글 관리</p></a>
											<script type="text/javascript">
											function mycommentlist(){
												$.ajax({
													url:"mycommentlist",
													success:function(data) {
														$("#setting_result").html(data);
													}
												});
												
											}
											</script>
												
									</li>
									
									<!-- <li><a href="javascript:mycommentlist()" class="d-flex">
											<p>댓글 관리</p></a>
										<script type="text/javascript">
										function mycommentlist(){
											$.ajax({
												url:"mycommentlist",
												success:function(data) {
													$("#setting_result").html(data);
												}
											});
											
										}
										</script>
											
									</li> -->
									<li><a href="javascript:myneighborlist()" class="d-flex">
											<p>이웃 관리</p></a>
										<script type="text/javascript">
										function myneighborlist(){
											$.ajax({
												url:"myneighborlist",
												success:function(data) {
													$("#setting_result").html(data);
												}
											});
											
										}
										</script>
											
									</li>
									<li><a href="javascript:deletemember()" class="d-flex">
											<p>회원 탈퇴</p></a>
										<script type="text/javascript">
										function deletemember(){
											$.ajax({
												url:"delete",
												success:function(data) {
													$("#setting_result").html(data);
												}
											});
											
										}
										</script>	
									</li>
									
								</ul>
							</aside>
							
							
						</div>
					</div>
				
				<!-- ////////////////////////////////// -->
					<div class="col-lg-8 posts-list">
						<div class="single-post">
							<div class="feature-img">
								<img class="img-fluid" src="#"
									alt="">
							</div>
						<div id="setting_result" class="blog_details">
							<jsp:include page="/WEB-INF/views/setting/setting.jsp"/>
						</div>
					</div>
				</div>
		</section>
		<!-- Blog Area End -->
	</main>


	<footer>
		<div class="footer-wrapper section-bg2"
			data-background="assets/img/gallery/footer-bg.png">
			<!-- Footer Start-->
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />

			<!-- Footer End-->
		</div>
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/popper.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/owl.carousel.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/wow.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/animated.headline.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.nice-select.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.sticky.js"></script>
	<!-- Progress -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.barfiller.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.counterup.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/waypoints.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.countdown.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/contact.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.form.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.validate.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/mail-script.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/plugins.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/main.js"></script>
</html>