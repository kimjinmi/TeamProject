<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
								<h2>Sign in</h2>
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
									<h3 class="text-heading" style="font-size: 30px;">비밀번호 변경</h3>
							</div>
						</section>
			<!-- End Sample Area 여기까지 회원가입 제목 사용-->  
			<div class="whole-wrap">
				<div class="container box_1170">
					<div class="section-top-border" style="padding-top: 30px;">
						<ul>
							<li style="padding-bottom:10px">
								새비밀번호를 입력해주세요
							</li>
								</ul>
									<form method="post" action="">								
										<!-- 이메일 입력 & 비밀번호 입력 시작 -->
										<div class="input-group mb-3">
                   							<input type="password" class="form-control" id="mpassword1" name="mpassword1" 
                   							placeholder=' 새로운 비밀번호를 입력하세요' onfocus="this.placeholder = ''" onblur="this.placeholder = '  새로운 비밀번호를 입력하세요'" 
                   								style="height:45px; font-size:16px;">
										</div>
										<div class="input-group mb-3">
                   							<input type="password" class="form-control" id="mpassword2" name="mpassword2" 
                   							placeholder='  비밀번호를 다시 입력하세요' onfocus="this.placeholder = ''" onblur="this.placeholder = '  비밀번호를 다시 입력하세요'" 
                   								style="height:45px; font-size:16px;">
										</div>
										
										<div class="input-group mb-3" id="passwordresult" style="font-weight: 700;font-size: 13px;"></div>			
										<div class="button-group-area mt-40" style="font-size: 20px; padding-bottom: 40px;">
											<a class="genric-btn info circle" href="javascript:passwordcheck()" name="submit" style="width: 100%;">비밀번호 변경</a>
										</div>
										<a class="ex" href="findemail" style="color:black; font-size:7px;">이메일 찾기></a> 
									
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<img src="<%=application.getContextPath()%>/resources/images/ponyo1.png" style="padding-top: 110px; width:90%; height:80%">
					</div>
				</div>
			</div>


		<!-- End Align Area -->
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

	
	<script type="text/javascript">

		$('#mpassword2').keyup(function(){
			var mpassword1 = $("#mpassword1").val().trim();
			var mpassword2 = $("#mpassword2").val().trim();

			if(mpassword1 != mpassword2){
				$("#passwordresult").css('color','#f74242');
				$("#passwordresult").text("※ 새비밀번호와 확인비밀번호가 일치하지않습니다");
			}else{
				$("#passwordresult").css('color','#7ad263');
				$("#passwordresult").text("※ 새비밀번호와 확인비밀번호가 일치합니다");
			}
		})
		
		
		function passwordcheck(){
			$.ajax({
				url:"passwordresult",
				data:{memail: '${member.memail}' ,mpassword:$("#mpassword2").val().trim()},
				success:function(data){
					if(data.result == 'success'){
						location.href="content";
					}
				}
			});
			
		}
		
	
		
	</script>

</body>
</html>