<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
var replyinreply = false; 
var togglehide;
</script>
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
									<a href="blog?UserUrl=${comment.murl}">${comment.mnickname }</a>
								</h5>
								<p class="date">
									<fmt:formatDate value="${comment.rdate}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
							<div class="reply-btn">
								<a href="javascript:testing()" class="btn-reply text-uppercase">답글</a> <!-- 답글 -->
								<script type="text/javascript">
								  function testing(){
									  replyinreply = !replyinreply;
									  alert(replyinreply);
									  
									  if(replyinreply == true){
										  
									  }else{
										  
									  }
								  }
								</script>
								
				
							</div>
							
						</div>
						<c:if test="${comment.murl == SessionMurl}">
									<a href="javascript:commentDelete(${comment.rno})" class="genric-btn danger small">삭제</a>
									<a href="blog" class="genric-btn primary small">수정(미완성)</a>
									
						<script type="text/javascript">
							function commentDelete(rno){	
									
								 if(confirm("정말로 삭제 하시겠습니까?")){
								 	$.ajax({
										url: "commentDelete",
										data: {rno:rno},
										success: function(data){
										// 삭제는 됬고  댓글 리스트를  새로고침 해야함	
										location.href="blog_details?bno=${comment.bno}";		
										}
									}); 
							 	}  
							}
						</script>
						
							
						</c:if>
						
						
						
									
								
					</div>
				</div>
			
			</div>
		</div>
	</div>
</c:forEach>