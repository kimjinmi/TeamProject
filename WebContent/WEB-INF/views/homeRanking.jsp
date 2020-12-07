<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 홈 상위 랭킹 5위 시작 -->

	<div class="container" style="margin-top: 5%;">
		<div class="row">
			<h1 class="widget_title home_h" style="color: #6C6C6C; font-size: 18px; margin-left: 2%;">이달의 랭킹</h1>
		</div>
	<div class="row" style="background-color: #EAEAEA;  padding-bottom: 1%;">
		<c:forEach var="board" items="${board}" varStatus="status">
			<div class="col-lg-3">
				<div class="single-cat">
					<div style="width: 100%; background-color: #fff;">
						<div class="cat-icon"  style="padding-top: 1%; padding-top: 5%; margin-top:3%; margin-left: 5%; margin-right: 5%">
								<a href="<%= application.getContextPath()%>/blog/blog_details?bno=${board.bno}"
								class="blog_item_date" style="border: 1px solid #EAEAEA;">
									<img class="card-img rounded-0" height="200"
										src="boardphotodownload?fileName=${board.bimage}" alt=""> 
								</a>
						</div>
						<p class="home_p" style="font-weight: bold; padding-top: 4%; margin:0; text-align: center;">랭킹 ${status.count}위</p>
						<a href="<%= application.getContextPath()%>/blog/blog_details?bno=${board.bno}">
							<div style="width: 88%; margin-left: 6%; margin-right: 6%;">
								<p class="home_t" style="margin: 0;">${board.btitle}</p>
								<p class="home_p" style="color: #909090;">${board.bcontent}</p> 
							</div>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
	
	
	
