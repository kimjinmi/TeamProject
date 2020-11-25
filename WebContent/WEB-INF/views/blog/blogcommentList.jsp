<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4>댓글</h4>
<c:forEach var="comment" items="${commentlist}">
	<div class="comment-list">
		<div class="single-comment justify-content-between d-flex">

			<div class="user justify-content-between d-flex">
				<div class="thumb">
					<img src="assetsx/img/blog/comment_1.png" alt="">
				</div>




				<div class="media align-items-center">
					<div style="margin-right: 23px">
						<img class="rounded-circle" width="100px" height="100px"
							src="<%=application.getContextPath()%>/resources/assets/img/elements/g3.jpg" />
					</div>
					<div class="desc">
						<p class="comment">${comment.rcontent}</p>
						<div class="d-flex justify-content-between">
							<div class="d-flex align-items-center">
								<h5>
									<a href="#">${comment.mnickname }</a>
								</h5>
								<p class="date">
									<fmt:formatDate value="${comment.rdate}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
							<div class="reply-btn">
								<a href="#" class="btn-reply text-uppercase">답글</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>