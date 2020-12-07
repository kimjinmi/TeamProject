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
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/rank/css/rank_page.css">
</head>

<body>
	<!-- ? Preloader Start -->
	<!-- div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="assets/img/logo/loder.png" alt="">
				</div>
			</div>
		</div>
	</div> -->
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
								<!-- <h2>Contents</h2> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Hero End -->

		<!-- ----- 실시간 카테고리 게시물 시작 부분 ----- -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 rt">
					<p class="h">Contents</p>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 rc">블로그 세상 속 다양한
					이야기들을 만나보세요</div>
				<div class="col-md-12 d-none d-sm-block">
					<ul class="nev">
						<c:forEach var="i" items="${category_list}">
							<li class="nev"><a class="link_tab"
								href="javascript:boardList(${i.cno})"> <span
									class="inner_link">${i.ccontent}</span>
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<!-- ------------------------------------------------- -->
				<div class="col-md-12 d-block d-sm-none">
					<ul class="nev_sm">
						<c:forEach var="i" items="${category_list}">
							<li class="nev_sm"><a class="link_tab_sm"
								href="javascript:boardList(${i.cno})"> <span
									class="inner_link">${i.ccontent}</span>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- ----- 실시간 카테고리 게시물 끝 부분 ----- -->

		<!-- ----- 실시간 게시물 시작 부분 ----- -->
		<section class="services-section section-padding-contents fix"
			style="background: #F2F2F2;">
			<div class="container">
				<script>
					function boardList(cno) {
						$.ajax({
							url : "boardList",
							data : {
								cno : cno
							},
							success : function(data) {
								$("#board_result").html(data);
							}
						});
					}
				</script>
				<div id="board_result" class="row">
					<!-- 포스팅 view 시작 -->
					<c:forEach var="board" items="${list}">
						<div class="col-lg-12 col-md-12 d-none d-sm-block"
							style="border-bottom: 1px solid #E7E7E7; padding-bottom: 2%;">
							<a href="javascript:boardDetails(${board.bno})"
								class="box_desc box_desc_type"> <!-- 게시물 이미지 --> <script
									type="text/javascript">
										function boardDetails(bno) {
											location.href = "<%=application.getContextPath()%>/blog/blog_details?bno="+ bno;
										}
									</script>
								<div class="img_thumb">
									<img class="thumb_g"
										src="photodownload_board?fileName=${board.bimage}" />
								</div> <!-- 게시물 타이틀, 내용 -->
								<div class="wrap_cont">
									<div class="wrap_data">
										<dl class="list_data">
											<dt class="screen_out">카테고리</dt>
											<dd class="ddcss ddcss1" style="margin-bottom: 3%">${board.ccontent}</dd>
										</dl>
										<%-- <dl class="list_data" style="margin-bottom: 0px">
											<dt class="screen_out">게시된 시간</dt>
											<dd class="ddcss">${board.bdate }</dd>
										</dl> --%>
										<dl class="list_data">
											<dt
												style="color: #909090; font-size: 13px; display: inline;">좋아요</dt>
											<dd class="ddcss" style="display: inline;">${board.blike}</dd>
										</dl>
									</div>
								</div>
								<div>
									<strong class="desc_tit"> ${board.btitle } </strong>
									<p class="desc_g">${board.bcontent}</p>
								</div> 
								<a style="margin: 0; padding: 0;" href="<%=application.getContextPath()%>/blog/blog?UserUrl=${board.murl}">
									<div class="info_g">
										<!-- 사용자 이미지 -->
										<span class="wrap_thumb"> <img class="thumb_profile"
											src="photodownload_member?fileName=${board.mmyimage}">

										</span> <span class="txt_id">${board.mintro}</span> <span
											class="txt_date">by ${board.mnickname}</span>
									</div>
								</a>
							</a>
						</div>
						<!-- ---------------------------------------------------------------- -->
						<div class="col-sm-12 d-block d-sm-none"
							style="border-bottom: 1px solid #E7E7E7; padding-bottom: 2%;">
							<a href="javascript:boardDetails(${board.bno})"
								class="box_desc box_desc_type"> <!-- 게시물 이미지 --> <script
									type="text/javascript">
										function boardDetails(bno) {
											location.href = "<%=application.getContextPath()%>/blog/blog_details?bno="+ bno;
										}
									</script>
								<div class="img_thumb_sm">
									<img class="thumb_g_sm"
										src="photodownload_board?fileName=${board.bimage}" />
								</div> <!-- 게시물 타이틀, 내용 -->
								<div>
									<strong class="desc_tit_sm"> ${board.btitle } </strong>
									<p class="desc_sm" style="margin-bottom: 0;">${board.bcontent}</p>
								</div>
								<div class="info_g_sm">
									<!-- 사용자 이미지 -->
									<a href="<%=application.getContextPath()%>/blog/blog?UserUrl=${board.murl }"> <span
										class="wrap_thumb"> <img class="thumb_profile_sm"
											src="photodownload_member?fileName=${board.mmyimage}">
									</span> <span class="txt_id_sm">by ${board.mnickname}</span>
									</a>
								</div>
							</a>
						</div>
					</c:forEach>
					<!-- 포스팅 view 끝 -->
				</div>

			</div>
		</section>

		<!-- ----- 실시간 게시물 끝 부분 ----- -->

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


</body>
</html>