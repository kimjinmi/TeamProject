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

   
<style type="text/css">
	.blog_list_content{  	
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3; 
		-webkit-box-orient: vertical;
	}
	.ck-editor__editable {
	       min-height: 800px;
	}
</style>
   
   

 <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>

</head>

<body onload="javascript:boardList('${member.murl}')">
	<script type="text/javascript">
	function boardList(murl, pageNo){
			
			if(!pageNo){
				pageNo=1;
			}
			
			$.ajax({
				url:"blogList",
				data: {murl:murl, pageNo:pageNo},
				success:function(data){
					$("#categoryListLinkBoard").html(data);
				}
			});
			
			$.ajax({
				url : "neighborlist",
				success : function(data){
					$("#neighborlist").html(data);	
				}
			});
			
		}
	</script>
   <!-- ? Preloader Start -->
<!--    <div id="preloader-active">
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
                        <h2>${member.mnickname}'s Blog</h2>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Hero End -->
      <!--? Blog Arㅠea Start -->
      <section class="blog_area single-post-area section-padding">


         <div class="container" >

            <div class="row">
               <div class="col-lg-4">
                  <div class="blog_right_sidebar">
                  
                     <aside class="single_sidebar_widget search_widget" style="padding:40px 30px">
                     <div class="align-items-center" style="width:100%; height:100%; text-align:center;">
                        <img src="photodownload?fileName=${member.mmyimage}" 
                        alt="" width="100" height="100" class="rounded-circle">
                        <hr/>
                        <a href="blog?UserUrl=${member.murl }"><h2 class="contact-title">${member.mnickname}</h2></a>
                        <p>${member.mintro}</p>
                        <hr/>
                        <!-- 게시글 작성 버튼 -->
                        <c:if test="${SessionMurl != null}">
	                        <c:if test="${member.murl==SessionMurl}">		<!-- member가 가지고 있는 murl과 session에 저장된 murl이 같을 때 (내 블로그일 때) -->
								<a class="genric-btn primary e-large" href="javascript:boardWrite()">POSTING</a>
					 				 <script type="text/javascript">
	                          			 function boardWrite() {
	                            			$.ajax({
	                                 			url: "boardWrite",
	                               				success:function(data){
	                                    			$("#categoryListLinkBoard").html(data);
	                                 			}
	                              			});
	                           			}
	                       			 </script>
							</c:if>
                       
                       
                        <!-- 친구 추가 버튼 -->
	                        <c:if test="${existRows==0}">
	                        	<a class="genric-btn primary e-large" href="javascript:neighborAdd('${member.memail}','${member.murl}')">친구추가</a>
	                        		<script type="text/javascript">
	                        			function neighborAdd(memail, murl){
	                        				$.ajax({
	                        					url:"neighborAdd",
	                        					data:{nememail:memail, nemurl:murl},
	                        					success:function(data){
	                        						if(data.result == "success"){
	                        							location.href = "blog?UserUrl="+murl;
	                        						}
	                        					}
	                        					
	                        				});
	                        			}
	                        		</script>
	                        </c:if>
                        </c:if>
                     </div>
                        
                     </aside>
                     
 
                     <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title" style="color: #2d2d2d;">Category</h4>
                        <ul class="list cat-list">
                        <!--    <div id="blog_category" style="margin-top:30px"></div> -->
                        
                        <!--    <li><a href="javascript:blogLife()" class="d-flex"></a></li> -->
                           <c:forEach var="category" items="${catelist}">
                           <li><a href="javascript:categoryListLinkBoard(${category.cno},'${category.murl}')" class="d-flex">
                           	 ${category.ccontent}</a></li>
                             <script type="text/javascript">
									//페이지 로드될때 댓글ajax로 가져옴
									function categoryListLinkBoard(cno,murl){
											$.ajax({
												url : "categoryListLinkBoard",
												method : "get",
												data : {cno:cno, murl:murl},
												success : function(data) {
													$("#categoryListLinkBoard").html(data);
												}
											});
									}
							   </script>
                           </c:forEach>
                        </ul>
                     </aside>
                     <aside class="single_sidebar_widget popular_post_widget">
                           <h3 class="widget_title" style="color: #2d2d2d;">Be Liked Posting</h3>
                           <c:forEach var="likelist" items="${likelist}">
	                           <div class="media post_item">    
	                               <i class="fas fa-heart" style="color: red;padding-top: 3px; padding-right: 3px;"></i>
	                                <h3 style="color: red;"> like : ${likelist.blike} </h3>                
	                                 <div class="media-body">
	                                	<a href="javascript:boardDetails(${likelist.bno})"><h3 style="color: #2d2d2d;">
	                                	${likelist.btitle}</h3> </a>
			                          	<script type="text/javascript">
											function boardDetails(bno) {
												location.href = "<%=application.getContextPath()%>/blog/blog_details?bno=" + bno;
											}
										</script>
									</div>
								</div>
                           </c:forEach>
                     </aside>
       				<c:if test="${SessionMurl != null}">
                    	<c:if test="${member.murl==SessionMurl}">
		                     <aside class="single_sidebar_widget popular_post_widget">
		                           <h3 class="widget_title" style="color: #2d2d2d;">Neighbor List</h3>
		                           <div id="neighborlist"></div>
		                           <script type="text/javascript">
			                           function neighborlist(pageNo){
			                        		if(!pageNo){
			                        			pageNo = 1;
			                        		}
			                        		$.ajax({
			                        			url:"neighborlist",
			                        			data:{pageNo:pageNo},
			                        			success:function(data) {
			                        				$("#neighborlist").html(data);
			                        			}
			                        		});
			                        		
			                        	}
		                           </script>
		                     </aside>
	                     </c:if>
	                 </c:if>
                  </div>
               </div>
            
            <!-- ////////////////////////////////// -->
               <div id="categoryListLinkBoard" class="col-lg-8 mb-5 mb-lg-0">
                        <!-- blog_item 시작 -->
                     
                           
                           <!-- page 네비게이션 -->
                           <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="#" class="page-link" aria-label="Previous">
                                            <i class="ti-angle-left"></i>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link">1</a>
                                    </li>
                                    <li class="page-item active">
                                        <a href="#" class="page-link">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link" aria-label="Next">
                                            <i class="ti-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>         
                            </nav>  
                            <!-- page 네비게이션 끝 -->
                        </div>
                          <!--  블로그 리스트 div 끝 -->       
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
