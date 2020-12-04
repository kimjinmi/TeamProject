<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<li><a href="<%=application.getContextPath()%>/blog/blog?UserUrl=adminadmincom">ABOUT</a></li>
			<li><a href="#">STORY</a>
	            <ul class="submenu">
					<li><a href="<%=application.getContextPath()%>/ranking/ranking">RANKING</a></li>
					<li><a href="<%=application.getContextPath()%>/contents/contents">CONTENTS</a></li>
					<li><a href="<%=application.getContextPath()%>/elements">참고 : ELEMENTS</a></li>
					
	            </ul>
	        </li>
	        <sec:authorize access="isAuthenticated()">
	            <li><a href="#">BLOG</a>
	            	<ul class="submenu">
	            		<li><a href="<%=application.getContextPath()%>/blog/blog?UserUrl=${SessionMurl}">BLOG</a></li>
	            		
						<%-- <li><a href="<%=application.getContextPath()%>/blog/blog_details">BLOG_DETAILS</a></li> --%>
						<li><a href="<%=application.getContextPath()%>/setting/content">SETTING</a></li>
						<sec:authorize access="hasRole('ROLE_MANAGER')">
							<li><a href="<%=application.getContextPath()%>/manager/content">MANAGER</a></li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li><a href="<%=application.getContextPath()%>/admin/content">ADMIN</a></li>
						</sec:authorize>
					</ul>
				</li>
			</sec:authorize>
			<li><a href="<%=application.getContextPath()%>/contact/contact">CONTACT</a></li>
			<!-- Header btn -->
			<li>
				<div class="header-right-btn ml-40">
					<sec:authorize access="isAnonymous()">
						<a href="<%=application.getContextPath()%>/signup/signupcheck" class="btn" style="border-radius: 20px;">SIGN UP</a> 
						<a href="<%=application.getContextPath()%>/signin/content" style="margin-left: 3px; border-radius: 20px;" class="btn">SIGN IN</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<form method="post" action="<%=application.getContextPath()%>/SIGNOUT">
							<input style="color: #fff; border-radius: 20px;" class="btn" type="submit" value='SIGNOUT'/>
						</form>
					</sec:authorize>
				</div>
			</li>
		</ul>
	</nav>
</div>