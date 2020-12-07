<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<c:forEach var="board" items="${list}">
	<div class="col-lg-4 col-md-6 col-sm-12">
		<div class="cat-icon" style="background-color: #f6f6f6; margin-bottom: 5%;">
			<div class="d-none d-sm-block" style="width: 100%;">
				<img src="photodownload_board?fileName=${board.bimage}" style="margin: 5% 5% 0% 5%; width: 90%" height="275">
			</div>
			<div class="d-block d-sm-none" style="width: 100%;">
				<img src="photodownload_board?fileName=${board.bimage}" style="margin: 5% 5% 0% 5%; width: 90%;" height="275">
			</div>
			<!-- [클릭] 게시글을 올린 회원 홈페이지로 이동 -->
			<div class="cat-cap"
				style="padding-top: 5%; padding-bottom: 7%; padding-left: 6%;">
				<a
					href="<%=application.getContextPath()%>/blog/blog?UserUrl=${board.murl}">
					<img class="profile_rank rounded-circle" src="photodownload_member?fileName=${board.mmyimage}" width="60" height="60"/>
				</a>
				<!-- 이미지 -->
				<div class="#">
					<!-- 홈페이지 소개글 -->
					<a href="javascript:boardDetails(${board.bno})">
						<p id="home-title" style="margin-bottom: 0;">${board.btitle}</p>
					</a>
					<!-- 닉네임 -->
					
					<a
						href="<%=application.getContextPath()%>/blog/blog?UserUrl=${board.murl}"
						class="nick-name"> by <strong>
							${board.mnickname}</strong>
					</a>
					<script type="text/javascript">
						function boardDetails(bno) {
							location.href = "<%=application.getContextPath()%>/blog/blog_details?bno="+ bno;
						}
					</script>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
