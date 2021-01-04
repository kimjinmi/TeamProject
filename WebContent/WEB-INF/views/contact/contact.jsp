<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<style type="text/css">
   .blog_list_content{  	
   			overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3; 
            -webkit-box-orient: vertical;
   }
	.ck-editor__editable {
	       min-height: 500px;
	}
	.container img {
	  max-width: 100%;
	  height: auto;
	  display: block;
	}
</style>
<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>    
</head>

<body onload="onload();">
<script type="text/javascript">
function onload(){
	$.ajax({
		url : "announcelist",
		success : function(data){
			$("#table_result").html(data);	
		}
	});
}
function allannouncelist(pageNo){
	if(!pageNo){
		pageNo=1;
	}
	$.ajax({
		url : "announcelist",
		data:{pageNo:pageNo},
		success : function(data){
			$("#table_result").html(data);	
		}
	});

}
function announcewrte(){
	$("#inquiry").hide();
	$.ajax({
		url : "announcewrite",
		success : function(data){
			$("#table_result").html(data);	
		}
	});

}
</script>
    <!-- ? Preloader Start -->
    <!-- <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
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

        <!--? Hero Start -->
        <div class="slider-area2 ">
            <div class="slider-height2 hero-overly d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero__caption hero__caption2">
                                <h2>Contact</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        <!--?  Contact Area start  -->
        <section class="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                    	<h2 class="contact-title" style="display: inline;">공지사항</h2>
                    	<sec:authorize access="hasRole('ROLE_MANAGER')">
	                    	<span id="write"><a class="genric-btn primary small" href="javascript:announcewrte()"><i class="fa fa-pencil" aria-hidden="true"></i>NEW</a></span>
	                    </sec:authorize>
                    	
                    	<div id="table_result">
                    		
								
                    	</div>
                    </div>
                 
                    
                </div>
                <div class="row" style="height: 50px;"></div>
                <div class="row" id="inquiry">
                    <div class="col-12">
                     <hr>   
                         
                    </div>
                    <div class="col-lg-4">
                        <img src="<%=application.getContextPath()%>/resources/images/tma1.PNG">
                    </div>
                    
                    <div class="col-lg-8" id="contactform">
                    
                    <h2 class="contact-title" >문의사항</h2>
                        <form class="form-contact contact_form">
                            <div class="row">
	                            <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="isubject" id="isubject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Enter Subject">
                                    </div>
                                    <span id="isubjectError" style="color:#CC3300;"></span>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100" name="imessage" id="imessage" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder=" Enter Message"></textarea>
                                    </div>
                                    <span id="imessageError" style="color:#CC3300;"></span>
                                </div>
                                
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <input class="form-control valid" name="iemail" id="iemail" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email" value="${sessionMemail}">                                        
                                    </div>
                                    <span id="iemailError" style="color:#CC3300;"></span>
                                </div>
                                
                            </div>
                            <div class="col-sm-12">
                                <a style="width: 100%" href="javascript:contactform()" class="button button-contactForm boxed-btn">Send</a>
                            </div>
                            <div class="col-sm-12">
	                            <span id="contact_result" style="text-align:center; color:#CC3300;">
	                            </span>
                            </div>
                        </form>
                        <script type="text/javascript">
                        function contactform(){
                        	var isubject = $("#isubject").val().trim();
                        	if(isubject == "") { $("#isubjectError").text("필수"); }
            				else { $("#isubjectError").text(""); }
                        	
                        	var imessage = $("#imessage").val().trim();
                        	if(imessage == "") { $("#imessageError").text("필수"); }
            				else { $("#imessageError").text(""); }
                        	
                        	var iemail = $("#iemail").val().trim();
                        	if(imessage == "") { $("#iemailError").text("필수"); }
            				else { $("#iemailError").text(""); }
                        	
                        	if(isubject == "" || imessage == "" || iemail == "") {
            					return;	
            				} 
                        	
                        	$.ajax({
                        		url:"contactform",
                        		method:"post",
                        		data:{isubject:isubject, imessage:imessage, iemail:iemail},
                        		success:function(data){
                        			if(data.result == "success") {
                        				$("#contact_result").text("문의가 완료되었습니다.");
            						}
                        		}
                        	});
            				
            				
                        }
                        </script>
                    </div>
                    

                </div>
            </div>
        </section>
        <!-- Contact Area End -->
   <footer>
        <!-- <div class="footer-wrapper section-bg2"  data-background="assets/img/gallery/footer-bg.png"> -->
        <!-- Footer Start-->
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        
          <!-- Footer End-->
     <!--  </div> -->
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
