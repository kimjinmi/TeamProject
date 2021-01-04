<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<style type="text/css">
.container img {
	  max-width: 100%;
	  height: auto;
	  display: block;
	}

</style>


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
								<h2>Sign up</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Hero End -->
		<!--? Start Sample Area -->
	<p></p>
		 <div class="container">
		 	<div class="row">
		 		<div class="col">
			 		
					
		 		</div>
		 	</div>
		 	<p></p>
		 	<div class="row">
		 		<div class="col-md-6">
					<div style="height: 50px;"></div>
					<img src="<%=application.getContextPath()%>/resources/images/tumblr_pik.jpg">
				</div>
		 	
		 		<div class="col-md-6">
		 		<hr align="left" style="border: solid 1px black; width: 100%;">	
		 		<h3 class="text-heading">회원가입</h3>
		 			<p></p>
					<i class="fas fa-check" style="color: #940128; margin: 0 5px 0 0 ;"></i><p style="display: inline; color: 940128; margin: 0 5px 0 0 ;  	font-weight: 250px;">표시는 필수사항입니다.</p>
					<div style="height: 50px;"></div>
					
					<form onsubmit="return validateForm()" method="post" action="signupform">								
					<!-- 이메일 입력 & 비밀번호 입력 시작 -->
						<div class="input-group mb-3">
       						<i class="fas fa-check" style="color: #940128;"></i>
       						<input type="text" id="mnicknamecheck" name="mnicknamecheck" class="form-control" placeholder='  닉네임' 
    				    	   onblur="this.placeholder = '  닉네임을 입력하세요'"  style="height:45px; font-size:16px;">
    				    	<a href="javascript:nicknamecheck()"  class="genric-btn primary-border">CHECK</a>
    				    	<input type="hidden" id="mnickname" name="mnickname" value="${member.mnickname}"/>
                		<span id="checkresult" style="color: red;"></span>
						</div>
						<form:errors cssClass="error" path="membervalidation.mnickname"/>
						
						<div class="input-group mb-3">
 							<i class="fas fa-check"  style="color: #940128;"></i>
 							<input type="text" id="memail" name="memail" class="form-control" 
 							style="height:45px; font-size:16px;" value="${member.memail}" readonly="readonly">
						</div>
         				<div class="input-group mb-3">
							<i class="fas fa-check"  style="color: #940128;"></i>
							<input type="text" id="mphonenum" name="mphonenum" class="form-control" placeholder='  전화번호(010-0000-0000)' 
							onfocus="this.placeholder = ''" onblur="this.placeholder = '  전화번호를 입력하세요'" 
							style="height:45px; font-size:16px;" value="${member.mphonenum}">
						</div>
						<span id="checkmphonenum" style="color: red;"></span>
						<form:errors cssClass="error" path="membervalidation.mphonenum"/>	

						<div class="input-group mb-3">
							<i class="fas fa-check"  style="color: #940128;"></i>
							<input type="password" id="mpassword" name="mpassword" class="form-control" placeholder='  비밀번호' 
							onfocus="this.placeholder = ''" onblur="this.placeholder = '  비밀번호를 입력하세요'" 
							style="height:45px; font-size:16px;">
						</div>
						<div class="input-group mb-3">
							<i class="fas fa-check"  style="color: #940128;"></i>
							<input type="password" id="mpasswordcheck" name="mpasswordcheck" class="form-control" placeholder='  비밀번호체크' 
							onfocus="this.placeholder = ''" onblur="this.placeholder = '  비밀번호를 확인하세요'" 
							style="height:45px; font-size:16px;">
						</div>
						<span id="checkmpassword" style="color: red;"></span>
						<form:errors cssClass="error" path="membervalidation.mpassword"/>	
										
						<div class="button-group-area mt-40" style="font-size: 20px;">
							<input class="genric-btn primary circle" type="submit"  value="SIGN UP" style="width: 100%;">
						</div>
						
						
					</form>
					<script type="text/javascript">
					function nicknamecheck(){
						var mnicknamecheck = $("#mnicknamecheck").val().trim();
						
						if(mnicknamecheck == ""){
							$("#checkresult").text("작성필수");
							return;
						}
						$.ajax({
							url:"nicknamecheck",
							method : "post",
							data:{mnicknamecheck:mnicknamecheck},
							success : function(data){
									if(data.result == "fail"){
										$("#checkresult").text("닉네임중복");
									}
									if(data.result == "success"){
										$("#checkresult").text("닉네임사용가능");
										$("#mnickname").val(mnicknamecheck);
										$("#mnicknamecheck").attr("readonly", true);
									}
								}
						});
					}
					
					function validateForm(){
						var mnickname = $("#mnickname").val().trim();
						var mpassword = $("#mpassword").val().trim();
						var mpasswordcheck = $("#mpasswordcheck").val().trim();
						
						if(mnickname == ""){
							$("#checkresult").text("체크필수");
							return false;
						}else if(mpassword != mpasswordcheck){
							$("#checkresult").text("");
							$("#checkmpassword").text("비밀번호 불일치");
							return false;
						}else{
							$("#checkresult").text("");
							$("#checkmpassword").text("");
							return true;
						}
					}
					</script>
					
				</div>
				
				
			</div>
		</div>
		
		<div style="height: 50px;"></div>

			<!-- End Sample Area 여기까지 회원가입 제목 사용-->  
	


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


</body>
</html>
