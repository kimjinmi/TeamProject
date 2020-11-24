<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
					
	            </ul>
	        </li>
            <li><a href="#">BLOG</a>
            	<ul class="submenu">
					<li><a href="<%=application.getContextPath()%>/blog/blog">BLOG</a></li>
					<%-- <li><a href="<%=application.getContextPath()%>/blog/blog_details">BLOG_DETAILS</a></li> --%>
					<li><a href="<%=application.getContextPath()%>/setting/content">SETTING</a></li>
					
				</ul>
			</li>
			<li><a href="<%=application.getContextPath()%>/contact/contact">CONTANCT</a></li>
			<!-- Header btn -->
			<li>
				<div class="header-right-btn ml-40">
					<sec:authorize access="isAnonymous()">
						<a href="<%=application.getContextPath()%>/signup/content" class="btn btn-sm">SIGN UP</a> 
						<a href="<%=application.getContextPath()%>/signin/content" class="btn btn-sm">SIGN IN</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<form method="post" action="<%=application.getContextPath()%>/SIGNOUT">
							
							<input class="btn btn-info" type="submit" value='SIGNOUT'/>
						</form>
					</sec:authorize>
				
				</div>
			</li>
		</ul>
	</nav>
</div>