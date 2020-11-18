<%@ page contentType="text/html; charset=UTF-8"%>
<div class="col-xl-2 col-lg-2">
	<div class="logo">
		<br/>
		<img src="#" alt="">
	</div>
</div>
<div class="main-menu d-none d-lg-block">
	<nav>
		<ul id="navigation">
			<li><a href="<%=application.getContextPath()%>/">HOME</a></li>
			<li><a href="<%=application.getContextPath()%>/aboutus/about">ABOUT</a></li>
			<li><a href="#">PROJECT</a>
	            <ul class="submenu">
					<li><a href="<%=application.getContextPath()%>/ranking/ranking">RANKING</a></li>
					<li><a href="<%=application.getContextPath()%>/contents/contents">CONTENTS</a></li>
					<li><a href="<%=application.getContextPath()%>/elements">참고 : ELEMENTS</a></li>
					<li><a href="<%=application.getContextPath()%>/blog_details">참고 : BLOG_DETAILS</a></li>
	            </ul>
	        </li>
            <li><a href="#">BLOG</a>
            	<ul class="submenu">
					<li><a href="<%=application.getContextPath()%>/blog/blog">BLOG</a></li>
					<li><a href="<%=application.getContextPath()%>/setting/content">SETTING</a></li>
				</ul>
			</li>
			<li><a href="<%=application.getContextPath()%>/contact/contact">CONTANCT</a></li>
			<!-- Header btn -->
			<li>
				<div class="header-right-btn ml-40">
					<a href="<%=application.getContextPath()%>/signup/content" class="btn btn-sm">SIGN UP</a> 
					<a href="<%=application.getContextPath()%>/signin/content" class="btn btn-sm">SIGN IN</a>
				</div>
			</li>
		</ul>
	</nav>
</div>