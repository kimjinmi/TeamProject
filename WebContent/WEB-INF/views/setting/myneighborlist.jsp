<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<h2 style="color: #2d2d2d;">My Neighborhood List</h2>
<hr/ style="margin-top:12px;">
	


                   <!-- 1 -->
<div class="blog_details">
	<div class="container"
		style="background-color: #fbf9ff; padding: 30px;">
		<c:forEach var="likelist" items="${mynlist}">
			<div class="row" style="padding-bottom : 30px;'">
				<div class="col-sm-3">
					<img src="photodownload?fileName=${likelist.mmyimage}" alt=""
						width="100" height="100" class="rounded-circle">
				</div>
				<div class="col-sm-9">
					<a class="d-inline-block" href="#">
						<h2 class="blog-head" style="color: #FF1493;  font-weight: bolder;">${likelist.mnickname}</h2>
					</a>
					<p></p>
					<ul class="blog-info-link" style="padding-top: 5px;">
						<li><a href="<%=application.getContextPath()%>/blog/blog?UserUrl=${likelist.nemurl}" style="color: #FF73BE;"><i class="fas fa-map-marker-alt"></i>
						내 이웃 주소 : ${likelist.nememail}</a></li>

					</ul>
					<ul class="blog-info-link" style="padding-top: 5px;">
						<li><a href="#"style="color: #FF7DC8;"><i class="fa fa-calendar"></i> 
						우리가 이웃이 시작된 날 : ${likelist.ndate}</a></li>
					</ul>
					<ul class="blog-info-link" style="padding-top: 5px;">
						<li><a href="#" style="color: #EE0000; font-weight: bolder;"><i class="fa fa-minus-square"></i>
						 친구 삭제</a></li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- 2 -->
                               