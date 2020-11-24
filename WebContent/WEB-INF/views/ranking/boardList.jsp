<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<c:forEach var="board" items="${list}">
	<div class="col-lg-4 col-md-6 col-sm-6">
		<div class="cat-icon">
			<div>
				<img
					src="<%=application.getContextPath()%>/resources/assets/img/gallery/services1.png"
					alt="">
			</div>
			<!-- [클릭] 게시글을 올린 회원 홈페이지로 이동 -->
			<div class="cat-cap"
				style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px;">
				<a href="#"> <img class="profile"
					src="<%=application.getContextPath()%>/resources/images/프로필-1.jpg" />
				</a>
				<!-- 이미지 -->
				<div class="#">
					<!-- 닉네임 -->
					<a href="#" class="nick-name"> <strong>${board.mnickname}</strong>
					</a>
					<!-- 홈페이지 소개글 -->
					<a href="#" class="home-title">
						<p id="home-title">${board.btitle}</p>
					</a>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
