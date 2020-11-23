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
<!--  rank_page.css -->
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/rank/css/rank_page.css">
</head>

<body>
	<!-- ? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<!-- <div class="preloader-circle"></div> -->
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
		<!-- ----- Ranking 글씨 시작 부분 ----- -->
		<div class="slider-area2 ">
			<div class="slider-height2 hero-overly d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero__caption hero__caption2">
								<!-- 	<h2>Ranking</h2> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ----- Ranking 글씨 끝 부분 ----- -->


		<!-- ----- 이달의 랭킹 카테고리 시작 부분 ----- -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 rt">
					<h2>Contents</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 rc">블로그 세상 속 다양한
					이야기들을 만나보세요</div>
				<div class="col-md-12">
					<ul class="nev">
						<li class="nev"><a class="link_tab #life" href="life"> <span
								class="inner_link">라이프</span>
						</a></li>
						<li class="nev"><a class="link_tab #travel" href="travle">
								<span class="inner_link">여행.맛집</span>
						</a></li>

						<li class="nev"><a class="link_tab #culture" href="culture">
								<span class="inner_link">문화.연예</span>
						</a></li>
						<li class="nev"><a class="link_tab #it" href="it">
								<span class="inner_link">IT</span>
						</a></li>
						<li class="nev"><a class="link_tab #sports" href="sports">
								<span class="inner_link">스포츠</span>
						</a></li>
						<li class="nev"><a class="link_tab #current" href="current">
								<span class="inner_link">시사</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- ----- 이달의 랭킹 카테고리 끝 부분 ----- -->

		<!-- ----- 이달의 랭킹 시작 부분 ----- -->
		<section class="services-section section-padding fix"
			style="background: #F2F2F2;">
			<div class="container">
				<div class="row">
					<!-- 포스팅 view 시작 -->
					<c:forEach var="board" items="${list}">
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="cat-icon">
								<div>
									<img
										src="<%=application.getContextPath()%>/resources/assets/img/gallery/services3.png"
										alt="">
								</div>
								<!-- [클릭] 게시글을 올린 회원 홈페이지로 이동 -->
								<div class="cat-cap">
									<a href="#"> <img class="profile"
										src="<%=application.getContextPath()%>/resources/images/프로필-3.jpg" />
									</a>
									<!-- 이미지 -->
									<div class="#">
										<!-- 닉네임 -->
										<a href="#" class="nick-name"> <strong>${board.mnickname}</strong>
										</a>
										<!-- 홈페이지 소개글 -->
										<a href="#">
											<p id="home-title">${board.btitle}</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 포스팅 view 끝 -->
				</div>
			</div>

		</section>
		<!-- ----- 이달의 랭킹 끝 부분 ----- -->
	</main>

	<footer>
		<!-- Footer Start-->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- Footer End-->
	</footer>
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
</body>
</html>