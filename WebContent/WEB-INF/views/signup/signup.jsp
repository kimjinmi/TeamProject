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

 	.section-top-border1 {
	padding: 50px 150px;
	border-top: 1px dotted #eee
	}    

 	.section-top-border1 h3{
 	font-size: 24px;
 	font-weight: 250px;
 	margin-bottom: 30px;
 	}
    
 	.section-top-border1 i {
 		font-size: 20px;
 		margin: 10px 10px 0 0 ;
 		color: #940128;
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
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-6">
					<section class="sample-text-area" style="padding: 50px 150px 0 150px;">
						<div class="container box_1170">
							<h3 class="text-heading">회원가입</h3>
								<i class="fas fa-check" style="color: #940128; margin: 0 5px 0 0 ;"></i><p style="display: inline; color: 940128; margin: 0 5px 0 0 ;  	font-weight: 250px;">표시는 필수사항입니다.</p>
								<br><i class="fas fa-exclamation-triangle"></i><span>비밀번호는 최소 8 자, 하나 이상의 문자와 숫자로 구성되어야 합니다.</span>	
								
						</div>
					</section>
		<!-- End Sample Area 여기까지 회원가입 제목 사용-->  


								<!--? Start Align Area -->
								<div class="whole-wrap">
									<div class="container box_1170">
										<div class="section-top-border1">
											<h3 class="mb-30">기본정보</h3>
												<form onsubmit="return validateForm()" method="post" action="signupform">
													<div class="input-group mb-3" id="nickname">
                        								<i class="fas fa-check"></i><input type="text" id="mnickname" name="mnickname" class="form-control" placeholder='  닉네임' 
                        								onfocus="this.placeholder = ''" onblur="this.placeholder = '  닉네임을 입력하세요'" 
                        								style="height:45px; font-size:16px;">
                        									<a type="button" class="genric-btn danger radius" href="javascript:idcnk();" >중복확인</a>  									
                        							</div>
                        							
													<div class="input-group mb-3" id="nicknameerror" style="display: none;">
														<i class="fas fa-exclamation-triangle"></i><span>닉네임 중복</span>	
													</div>	
															<script>
															/* var mnickname = $("#mnickname").val();
															
															function idchk(){
																alert(mnickname);
	                        									$.ajax({
	                        										url:"nicknamecheck",
	                        										type:"get",
	                        										data:{mnickname:mnickname},
	                        										success:function(data){
	                        											
	                        										}
	                        									});	
														
	                        								} */
                        									</script>
													<div class="input-group mb-3">
                        								<i class="fas fa-check"></i><input type="text" id="memail" name="memail" class="form-control" 
                        								style="height:45px; font-size:16px;" value="${Memail}" readonly>
													</div>
														
													<div class="input-group mb-3">
                        								<i class="fas fa-check"></i><input type="text" id="mphonenum" name="mphonenum" class="form-control" placeholder='  전화번호' 
                        								onfocus="this.placeholder = ''" onblur="this.placeholder = '  전화번호를 입력하세요'" 
                        								style="height:45px; font-size:16px;">
													</div>
													<div class="input-group mb-3" id="phonenumerror" style="display: none;">
														<i class="fas fa-exclamation-triangle"></i><span>전화번호 오류</span>	
													</div>	
			
													<div class="input-group mb-3">
                        								<i class="fas fa-check"></i><input type="password" id="mpassword" name="mpassword" class="form-control" placeholder='  비밀번호' 
                        								onfocus="this.placeholder = ''" onblur="this.placeholder = '  비밀번호를 입력하세요'" 
                        								style="height:45px; font-size:16px;">
													</div>
													<div class="input-group mb-3" id="passworderror" style="display: none;">
														<i class="fas fa-exclamation-triangle"></i><span>비밀번호는 최소 8 자, 하나 이상의 문자와 하나의 숫자로 구성</span>	
													</div>
													
									
													<div class="input-group mb-3">
	                        							<i class="fas fa-check"></i><input type="password" id="mpasswordcheck" class="form-control" placeholder='  비밀번호 확인' 
	                        							onfocus="this.placeholder = ''" onblur="this.placeholder = '  비밀번호를 확인하세요'" 
	                        							style="height:45px; font-size:16px;">
													</div>
													<div class="input-group mb-3" id="passwordcheckerror" style="display: none;">
														<i class="fas fa-exclamation-triangle"></i><span>비밀번호 불일치</span>	
													</div>	
																	
													<div class="button-group-area mt-40" style="font-size: 20px;">
														<input type="submit" class="genric-btn info circle" value="회원가입 완료" />
													</div>
												</form>
												<script type="text/javascript">
												function validateForm(){
													/* var mnickname = $("#mnickname").val();
													var mphonenum = $("#mphonenum").val();
													var mpassword = $("#mpassword").val();
													var mpasswordcheck = $("#mpasswordcheck").val();
													
													var pwchk = ^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$;
													var pnchk = /^\d{3}-\d{3,4}-\d{4}$/;
													
													if (!pnchk.test(mphonenum)) {
														
														$("#phonenumerror").show();
														$("#passworderror").hide();
														$("#passwordcheckerror").hide();
														return false;
													}else if(!pwchk.test(mpassword)){
														
														$("#phonenumerror").hide();
														$("#passworderror").show();
														$("#passwordcheckerror").hide();
														return false;
													}else if(mpassword != mpasswordcheck){
														
														$("#phonenumerror").hide();
														$("#passworderror").hide();
														$("#passwordcheckerror").show();
														return false;
													}else{
														
														$("#phonenumerror").hide();
														$("#passworderror").hide();
														$("#passwordcheckerror").show();  */
														return true;	
													
												}
												</script>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4" style=" text-align: center; padding-top: 150px; padding-right: 400px; padding-bottom: 100px; padding-left: 40px;">
									<div class="ponyoimage">
										<img src="<%=application.getContextPath()%>/resources/images/ponyo4.png" 
										style="width: 400px; height: 400px;">
									</div>
							</div>
							<div class="col-md-2">
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