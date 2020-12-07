<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/rank/css/rank_page.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.carousel-inner img {
	width: 100%;
	height: 100%;
}

.video {
	width: 100%;
	max-width: 900px;
	margin: 30px auto;
	border-radius: 30px;
	background-color: #f0f0f0;
	padding: 20px;
	box-sizing: border-box;
	box-shadow: 0px 8px 33px #999;
}

.video-container {
	position: relative;
	width: 100%;
	height: auto;
	padding-top: 50%;
}

iframe {
	z-index: 1;
	top: 0;
	left: 0;
	position: absolute;
	width: 100%;
	height: 100%;
}
</style>

</head>

<body onload="homeRanking()">
	<!-- ? Preloader Start -->
<%-- 	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img
						src="<%=application.getContextPath()%>/resources/assets/img/logo/loder.png"
						alt="">
				</div>
			</div>
		</div>
	</div> --%>
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
		<!--? slider Area Start-->
		<section class="slider-area ">
			<div class="slider-active">

				<div id="demo" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<!--  출처: <Pinterest> '땡스아트' 
								   출처: <크라우드픽> '@woocat'  -->
							<img
								src="<%=application.getContextPath()%>/resources/assets/img/hero/image_5.png"
								width="100%">
						</div>
						<div class="carousel-item">
							<!-- 출처: [아이패드] PNGEGG -->
							<img
								src="<%=application.getContextPath()%>/resources/assets/img/hero/image_11.png"
								width="100%">
						</div>
						 <div class="carousel-item">
							<img
								src="<%=application.getContextPath()%>/resources/assets/img/hero/image_6.png"
								width="100%"/>
						</div> 
					</div>
					 <a class="carousel-control-prev" href="#demo" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#demo" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
				</div>

			</div>
		</section>
		<!-- slider Area End-->
		<div id="homeRanking">
			<script type="text/javascript">
				function homeRanking() {
					$.ajax({
						url: "homeRanking",
						success: function(data) {
							$("#homeRanking").html(data);
						}
					});
				}
			</script>
		</div>
			<!--? video_start -->
		<div class="video" style="margin-top: 5%;">
			<div class="video-container">
				<iframe width="560" height="315" 
					src="https://www.youtube.com/embed/sOcWhjbuKwk" 
					frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen></iframe>
			</div>
		</div>
		<!-- video_end -->

		<!--? services area start -->
		<section class="services-section pb-padding fix">
			<div class="container" style="margin-top: 5%;">
				<div class="custom-row">
					<div class="services-active">
						<div class="col-lg-4">
							<div class="single-cat">
								<div class="cat-icon">
									<img
										src="<%=application.getContextPath()%>/resources/assets/img/gallery/진미.jpg"
										alt="">
								</div>
								<div class="cat-cap">
									<h5>
										<a class="home_h" href="https://github.com/kimjinmi">김진미</a>
									</h5>
									<p class="home_h">프로젝트 팀장을 처음 맡게 되어서 잘 이끌어가질 못했던 것 같은데 모든 팀원들이 많이 도와줘서
									좋은 결과물을 이끌어 낸 것 같습니다. 스프링 프로젝트는 처음이라 힘들었던 부분도 많았지만 재밌었던 부분이
									더 큰 것 같고 앞으로도 새로운 기술을 익혀 프로젝트를 만들어 보는 경험을 가지도록 노력하겠습니다!</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-cat">
								<div class="cat-icon">
									<img
										src="<%=application.getContextPath()%>/resources/assets/img/gallery/영아.jpg"
										alt="">
								</div>
								<div class="cat-cap">
									<h5>
										<a class="home_h" href="https://github.com/yeonga">피영아</a>
									</h5>
									<p class="home_h" >문제가 해결이 되지 않을 때에도 포기보다는 끈기있게 문제를 해결하려는 태도를 기를 수 있습니다. 또한, 팀원들과 서로의 의견을 존중해주며 팀 프로젝트를 해서 성공적으로 프로젝트를 마칠 수 있었고, 협동심을 기를 수 있었습니다.<p>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-cat">
								<div class="cat-icon">
									<img
										src="<%=application.getContextPath()%>/resources/assets/img/gallery/선명.jpg"
										alt="">
								</div>
								<div class="cat-cap">
									<h5>
										<a class="home_h" href="https://github.com/aodrhfk">조선명</a>
									</h5>
									<p class="home_h">많은 어려움을 겪었지만 좋은 팀원들과 함께 공부하고 의견을 나누며 문제를 해결해나가는 방법을 배웠고 그로 인해 좋은 경험이 되었습니다.</p>
								</div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="single-cat">
								<div class="cat-icon">
									<img
										src="<%=application.getContextPath()%>/resources/assets/img/gallery/선.jpg"
										alt="">
								</div>
								<div class="cat-cap">
									<h5>
										<a class="home_h" href="https://github.com/2SunE">이선</a>
									</h5>
									<p class="home_h">과거에는 "이렇게 하면 될까?" 하는 생각이 들어도 직접 코딩을 할 수 없었지만 지금은 고민이 담긴 코드를 작성할 수 있게 됐습니다. 지난 3개월동안 정말 많은 성장을 이뤘다고 자신할 수 있습니다. (난 정말 멋찐사람..) 주니어 개발자지만 앞으로도 배워야할 것들이 많아서 너무 좋고 기대 됩니다!</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="single-cat">
								<div class="cat-icon">
									<img
										src="<%=application.getContextPath()%>/resources/assets/img/gallery/지훈.jpg"
										alt="">
								</div>
								<div class="cat-cap">
									<h5>
										<a class="home_h" href="https://github.com/JIHOONKIM3949">김지훈</a>
									</h5>
									<p class="home_h">이론적으로 배운 Spring FrameWork 를 사용하여 직접 웹 애플리케이션을 개발하며 어려월던 Di, loc 등의 개념을  확실하게 이해 할 수 있었고 mybatis를 통해 쉽게  DB 데이터를 관리해보며 어렸울 것 같던 Spring 개발에 자신감을 더 가질 수 있는 계기가 되었습니다.</p>
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

</body>
</html>