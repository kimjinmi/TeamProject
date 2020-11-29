<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<h2 style="color: #2d2d2d;">My Neighborhood List</h2>
<hr/ style="margin-top:12px;">
	


                   <!-- 1 -->
<div class="blog_details">
	<div class="container"
		style="background-color: #fbf9ff; padding: 30px;">
		<c:forEach var="likelist" items="${mynlist}">
			<div class="row">
				<div class="col-sm-3">
					<img src="photodownload?fileName=${neighbor.mmyimage}" alt=""
						width="100" height="100" class="rounded-circle">
				</div>
				<div class="col-sm-9">
					<a class="d-inline-block" href="#">
						<h2 class="blog-head" style="color: #2d2d2d;">${neighbor.nemurl}</h2>
					</a>
					<p></p>
					<ul class="blog-info-link">
						<li><a href="#"><i class="fa fa-calendar"></i> 우리가 이웃이 시작
								된 날 : ${neighbor.ndate}</a></li>
						<li><a href="#"><i class="fa fa-minus-square"></i> 친구 삭제</a></li>
					</ul>

				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- 2 -->
                               