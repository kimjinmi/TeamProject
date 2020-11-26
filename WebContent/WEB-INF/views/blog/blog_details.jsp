<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


<body onload="javascript:onload(${board.bno})">
	<script type="text/javascript">
	function onload(bno){
		$.ajax({
			url : "blogcommentlist",
			method : "get",
			data : {
				bno:bno
			},
			success : function(data) {
				$("#comments-area").html(data);
			}
		});
	}
   </script>

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
								<h2>Blog Details</h2>
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

							<aside class="single_sidebar_widget search_widget"
								style="padding: 40px 30px">
								<div class="align-items-center"
									style="width: 100%; height: 100%; text-align: center;">
									<img
										src="<%=application.getContextPath()%>/resources/assets/img/elements/d.jpg"
										alt="" width="100" height="100" class="rounded-circle">
									<hr />
									<h2 class="contact-title">영아나라</h2>
									<p>혼저옵서예~ 영아 블로그에유 반가워유</p>
									<hr />
									<a class="genric-btn primary e-large"
										href="javascript:boardWrite()">POSTING</a>
									<script type="text/javascript">
									function boardWrite() {
										$.ajax({
											url: "boardWrite",
											success:function(data){
												$("#test").html(data);
											}
										});
									}
								</script>
								</div>

							</aside>

							<aside class="single_sidebar_widget search_widget">
								<form action="#">
									<div class="form-group">
										<div class="input-group mb-3">
											<input type="text" class="form-control"
												placeholder='검색어를 입력하세요' onfocus="this.placeholder = ''"
												onblur="this.placeholder = '검색어를 입력하세요'">
											<div class="input-group-append">
												<button class="btns" type="button">
													<i class="ti-search"></i>
												</button>
											</div>
										</div>
									</div>
									<button
										class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
										type="submit">검색하기</button>
								</form>
							</aside>
							<aside class="single_sidebar_widget post_category_widget">
								<h4 class="widget_title" style="color: #2d2d2d;">Category</h4>
								<ul class="list cat-list">
									<c:forEach var="category" items="${catelist}">
										<li><a href="#" class="d-flex"> ${category.ccontent}
										</a></li>
									</c:forEach>
								</ul>
							</aside>
							<aside class="single_sidebar_widget popular_post_widget">
								<h3 class="widget_title" style="color: #2d2d2d;">Recent
									Posting</h3>
								<c:forEach var="btitle" items="${btitlelist}">
									<div class="media post_item">
										<img src="assets/img/post/post_1.png" alt="post">
										<div class="media-body">
											<a href="javascript:selectBoard()"> <script></script>
												<h3 style="color: #2d2d2d;">${btitle.btitle}</h3>
											</a>
											<p>1시간 전 작성</p>
										</div>
									</div>
								</c:forEach>


								<!-- <div class="media post_item">
									<img src="assets/img/post/post_2.png" alt="post">
									<div class="media-body">
										<a href="blog_details.html">
											<h3 style="color: #2d2d2d;">최근 포스팅2</h3>
										</a>
										<p>2시간 전 작성</p>
									</div>
								</div>
								<div class="media post_item">
									<img src="assets/img/post/post_3.png" alt="post">
									<div class="media-body">
										<a href="blog_details.html">
											<h3 style="color: #2d2d2d;">최근 포스팅3</h3>
										</a>
										<p>3시간 전 작성</p>
									</div>
								</div>
								<div class="media post_item">
									<img src="assets/img/post/post_4.png" alt="post">
									<div class="media-body">
										<a href="blog_details.html">
											<h3 style="color: #2d2d2d;">최근 포스팅4</h3>
										</a>
										<p>4시간 전 작성</p>
									</div>
								</div> -->
							</aside>
							<!-- <aside class="single_sidebar_widget tag_cloud_widget">
								<h4 class="widget_title" style="color: #2d2d2d;">Tag Clouds</h4>
								<ul class="list">
									<li><a href="#">project</a></li>
									<li><a href="#">love</a></li>
									<li><a href="#">technology</a></li>
									<li><a href="#">travel</a></li>
									<li><a href="#">restaurant</a></li>	
									<li><a href="#">life style</a></li>
									<li><a href="#">design</a></li>
									<li><a href="#">illustration</a></li>
								</ul>
							</aside> -->
							<!-- <aside class="single_sidebar_widget instagram_feeds">
								<h4 class="widget_title" style="color: #2d2d2d;">Instagram
									Feeds</h4>
								<ul class="instagram_row flex-wrap">
									<li><a href="#"> <img class="img-fluid"
											src="assets/img/post/post_5.png" alt="">
									</a></li>
									<li><a href="#"> <img class="img-fluid"
											src="assets/img/post/post_6.png" alt="">
									</a></li>
									<li><a href="#"> <img class="img-fluid"
											src="assets/img/post/post_7.png" alt="">
									</a></li>
									<li><a href="#"> <img class="img-fluid"
											src="assets/img/post/post_8.png" alt="">
									</a></li>
									<li><a href="#"> <img class="img-fluid"
											src="assets/img/post/post_9.png" alt="">
									</a></li>
									<li><a href="#"> <img class="img-fluid"
											src="assets/img/post/post_10.png" alt="">
									</a></li>
								</ul>
							</aside> -->
							<!-- <aside class="single_sidebar_widget newsletter_widget">
								<h4 class="widget_title" style="color: #2d2d2d;">Newsletter</h4>
								<form action="#">
									<div class="form-group">
										<input type="email" class="form-control"
											onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Enter email'"
											placeholder='Enter email' required>
									</div>
									<button
										class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
										type="submit">Subscribe</button>
								</form>
							</aside> -->
						</div>
					</div>

					<!-- ////////////////////////////////// -->
					<div id="test" class="col-lg-8 posts-list">
						<div class="single-post">
							<div class="feature-img">
								<img class="img-fluid" src="assets/img/blog/single_blog_1.png"
									alt="">
							</div>


							<div class="blog_details" id="board__title">
								<h2 style="color: #2d2d2d;">${board.btitle}</h2>
								<ul class="blog-info-link mt-3 mb-4">
									<li><a href="#"><i class="fa fa-user"></i>${board.memail }</a></li>
									<li><a href="#"><i class="fa fa-comments"></i> 댓글 3개 </a></li>
									<li><i class="fa fa-calendar" style="color: #999999"></i>
										<fmt:formatDate value="${board.bdate}"
											pattern="yyyy-MM-dd HH:mm:ss" /></a></li>
								</ul>
								<p class="excert">${board.bcontent}</p>
								<!-- <p class="excert">학교를 졸업한 뒤, 부푼 꿈을 안고 16년도 해운회사 입사하여, 3등 기관사로서 직책을
								 맡고 승선근무(21개월)를 하면서 선박 내 보일러,냉동기,에어컨,조수기,소각기,엘레베이터 및 각종 보조기기 및 비상기기 등을 안전 점
								 검 및 유지보수 하였으며, 주기관 냉각수 분석 및 진단 등을 통하여 선박의 안전운항을 할 수 있도록 안전점검하는 것이 제 업무였습니다. 기
								 관부의 막내로서 늘 한 시간 일찍 출근하여 부족한 부분을 보완하고자 매뉴얼과 절차서를 숙지하고, 업무가 완전히 마무리될 때까지 책임감을 느끼고 업무
								 를 수행했습니다. 덕분에 선박에 대해 각종 기기의 원리 및 시스템을 파악하고 선박의 안전을 위해서 법이나 회사 내 절차 등을 숙지하여 선장님과
								  기관장님께 진급 추천서를 2차례 받아 2등 기관사로 진급하였습니다</p>
								<p>학교를 졸업한 뒤, 부푼 꿈을 안고 16년도 해운회사 입사하여, 3등 기관사로서 직책을
								 맡고 승선근무(21개월)를 하면서 선박 내 보일러,냉동기,에어컨,조수기,소각기,엘레베이터 및 각종 보조기기 및 비상기기 등을 안전 점
								 검 및 유지보수 하였으며, 주기관 냉각수 분석 및 진단 등을 통하여 선박의 안전운항을 할 수 있도록 안전점검하는 것이 제 업무였습니다. 기
								 관부의 막내로서 늘 한 시간 일찍 출근하여 부족한 부분을 보완하고자 매뉴얼과 절차서를 숙지하고, 업무가 완전히 마무리될 때까지 책임감을 느끼고 업무
								 를 수행했습니다. 덕분에 선박에 대해 각종 기기의 원리 및 시스템을 파악하고 선박의 안전을 위해서 법이나 회사 내 절차 등을 숙지하여 선장님과
								  기관장님께 진급 추천서를 2차례 받아 2등 기관사로 진급하였습니다</p>
								<div class="quote-wrapper">
									<div class="quotes">학교를 졸업한 뒤, 부푼 꿈을 안고 16년도 해운회사 입사하여, 3등 기관사로서 직책을
								 맡고 승선근무(21개월)를 하면서 선박 내 보일러,냉동기,에어컨,조수기,소각기,엘레베이터 및 각종 보조기기 및 비상기기 등을 안전 점
								 검 및 유지보수 하였으며, 주기관 냉각수 분석 및 진단 등을 통하여 선박의 안전운항을 할 수 있도록 안전점검하는 </div>
								</div>
								<p>학교를 졸업한 뒤, 부푼 꿈을 안고 16년도 해운회사 입사하여, 3등 기관사로서 직책을
								 맡고 승선근무(21개월)를 하면서 선박 내 보일러,냉동기,에어컨,조수기,소각기,엘레베이터 및 각종 보조기기 및 비상기기 등을 안전 점
								 검 및 유지보수 하였으며, 주기관 냉각수 분석 및 진단 등을 통하여 선박의 안전운항을 할 수 있도록 안전점검하는 것이 제 업무였습니다. 기
								 관부의 막내로서 늘 한 시간 일찍 출근하여 부족한 부분을 보완하고자 매뉴얼과 절차서를 숙지하고, 업무가 완전히 마무리될 때까지 책임감을 느끼고 업무
								 를 수행했습니다. 덕분에 선박에 대해 각종 기기의 원리 및 시스템을 파악하고 선박의 안전을 위해서 법이나 회사 내 절차 등을 숙지하여 선장님과
								  기관장님께 진급 추천서를 2차례 받아 2등 기관사로 진급하였습니다</p>
								<p>학교를 졸업한 뒤, 부푼 꿈을 안고 16년도 해운회사 입사하여, 3등 기관사로서 직책을
								 맡고 승선근무(21개월)를 하면서 선박 내 보일러,냉동기,에어컨,조수기,소각기,엘레베이터 및 각종 보조기기 및 비상기기 등을 안전 점
								 검 및 유지보수 하였으며, 주기관 냉각수 분석 및 진단 등을 통하여 선박의 안전운항을 할 수 있도록 안전점검하는 것이 제 업무였습니다. 기
								 관부의 막내로서 늘 한 시간 일찍 출근하여 부족한 부분을 보완하고자 매뉴얼과 절차서를 숙지하고, 업무가 완전히 마무리될 때까지 책임감을 느끼고 업무
								 를 수행했습니다. 덕분에 선박에 대해 각종 기기의 원리 및 시스템을 파악하고 선박의 안전을 위해서 법이나 회사 내 절차 등을 숙지하여 선장님과
								  기관장님께 진급 추천서를 2차례 받아 2등 기관사로 진급하였습니다</p> -->
							</div>
						</div>


						<div class="navigation-top">
							<div class="d-sm-flex justify-content-between text-center">
								<p class="like-info">
									<span class="align-middle"><i class="fa fa-heart"></i></span>
									김지훈 외 좋아요 4개
								</p>
								<div class="col-sm-4 text-center my-2 my-sm-0">
									<!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
								</div>
								<ul class="social-icons">
									<li><a href="https://www.facebook.com/sai4ull"><i
											class="fab fa-facebook-f"></i></a></li>
									<li><a href="#"><i class="fab fa-twitter"></i></a></li>
									<li><a href="#"><i class="fab fa-dribbble"></i></a></li>
									<li><a href="#"><i class="fab fa-behance"></i></a></li>
								</ul>
							</div>
							<div class="navigation-area">
								<div class="row">
									<div
										class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
										<div class="thumb">
											<a href="#"> <img class="img-fluid"
												src="assets/img/post/preview.png" alt="">
											</a>
										</div>
										<div class="arrow">
											<a href="#"> <span class="lnr text-white ti-arrow-left"></span>
											</a>
										</div>
										<div class="detials">
											<p>이전 게시물</p>
											<!-- <a href="#">
												<h4 style="color: #2d2d2d;">Space The Final Frontier</h4>
											</a> -->
										</div>
									</div>
									<div
										class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
										<div class="detials">
											<p>다음 게시글</p>
											<!-- <a href="#">
												<h4 style="color: #2d2d2d;">Telescopes 101</h4>
											</a> -->
										</div>
										<div class="arrow">
											<a href="#"> <span class="lnr text-white ti-arrow-right"></span>
											</a>
										</div>
										<div class="thumb">
											<a href="#"> <img class="img-fluid"
												src="assets/img/post/next.png" alt="">
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="blog-author">
							<div class="media align-items-center">
								<img
									src="<%=application.getContextPath()%>/resources/assets/img/elements/f1.jpg"
									alt="">
								<div class="media-body">
									<p>돼지고기 마늘 상추 양파 된장 쌈장 고추장 와사비</p>
									<a
										href="https://www.coupang.com/vp/products/306264774?itemId=965657775&vendorItemId=5265041997&sourceType=srp_product_ads&isAddedCart="
										target="_blank">
										<h4>지금 바로 구매하기</h4>
									</a>
								</div>
							</div>
						</div>
						<div class="comments-area" id="comments-area">
							<%-- <h4>댓글</h4>

							<!-- -----------------------------------댓글 폼1 시작----------------------------------------- -->
							<c:forEach var="comment" items="${commentlist}">
								<div class="comment-list">
									<div class="single-comment justify-content-between d-flex">

										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img src="assetsx/img/blog/comment_1.png" alt="">
											</div>




											<div class="media align-items-center">
												<div style="margin-right: 23px">
													<img class="rounded-circle" width="100px" height="100px"
														src="<%=application.getContextPath()%>/resources/assets/img/elements/g3.jpg" />
												</div>
												<div class="desc">
													<p class="comment">${comment.rcontent}</p>
													<div class="d-flex justify-content-between">
														<div class="d-flex align-items-center">
															<h5>
																<a href="#">${comment.mnickname }</a>
															</h5>
															<p class="date">
																<fmt:formatDate value="${comment.rdate}"
																	pattern="yyyy-MM-dd HH:mm:ss" />
															</p>
														</div>
														<div class="reply-btn">
															<a href="#" class="btn-reply text-uppercase">답글</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach> --%>
						</div>

						<div class="comment-form">
							<h4>댓글 작성</h4>
							<form class="form-contact comment_form" action="#"
								id="commentForm">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<textarea class="form-control w-100" name="comment"
												id="comment" cols="30" rows="4" placeholder="댓글을 작성하세요"></textarea>
										</div>
									</div>
								</div>
								<div class="form-group">
									<a href="javascript:commentWrite(${board.bno })"
										class="button button-contactForm btn_1 boxed-btn">작성하기</a>
									<script type="text/javascript">
										function commentWrite(bno) {								
											// 데이터 검사	
											var comment = $("#comment").val().trim();
											if(comment == ""){
												alert("2글자 이상 입력해야 합니다.");
												return;
											}	

											// 댓글리스트 리로드
											$.ajax({
												url : "blogcommentlist",
												method : "get",
												data : {
													bno:bno,
													rcontent:comment
												},
												success : function(data) {
													$("#comments-area").html(data);
												}
												
										/////댓글리스트 리로드///////////////////
											});
											
									/* 		
											//데이터베이스 값 입력
											$.ajax({
												url:"blogcommentlist";
												method:"post",
												data{comment:comment
													},
												success:function(data){
													if(data.result = "success"){
														console.log("성공하였습니다.");
	
													}
												}
											}); */
											
										}
											
											
										
									</script>
								</div>
							</form>
						</div>
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