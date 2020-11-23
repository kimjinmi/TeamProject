<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<c:forEach var="board" items="${list}">
	<ul>
		<li>
			<div class="cat-icon">
				<img
					src="<%=application.getContextPath()%>/resources/assets/img/gallery/services1.png"
					alt="" style="width: 100%; height: 100%;">
			</div> <!-- [클릭] 게시글을 올린 회원 홈페이지로 이동 -->
			<div class="cat-cap">
				<a href="#"> <img class="profile"
					src="<%=application.getContextPath()%>/resources/images/프로필-1.jpg" />
				</a>
				<!-- 이미지 -->
				<div class="#">
					<!-- 닉네임 -->
					<a href="#" class="nick-name"> <strong>${board.memail}</strong>
					</a>
					<!-- 홈페이지 소개글 -->
					<a href="#">
						<p id="home-title">${board.btitle}</p>
					</a>
				</div>
			</div>
		</li>
	</ul>
	
					
</c:forEach>


			