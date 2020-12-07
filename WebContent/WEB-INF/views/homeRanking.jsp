<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 홈 상위 랭킹 5위 시작 -->

	<div class="container" style="margin-top: 5%;">
		<div class="row">
			<h1 class="widget_title" style="color: purple; padding-bottom: 5%;">&nbsp;&nbsp;&nbsp;&nbsp;Be Liked Posting</h1>
		</div>
	<div class="row">
		<c:forEach var="board" items="${board}" varStatus="status">
			<div class="col-lg-3">
				<div class="single-cat">
					<div class="cat-icon"  style="padding-top: 4%;">
						<img class="card-img rounded-0" height="350px"
							src="boardphotodownload?fileName=${board.bimage}" alt=""> <a
							href="<%=application.getContextPath() %>/blog/blog_details?bno="${board.bno}
							class="blog_item_date"></a>
					</div>
					<div class="cat-cap">
						<h3 style="font-weight: bold; padding-top: 4%; text-align: center;">이 달의 랭킹 -  ${status.count}위</h3>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
	
	
	
