<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
var replyinreply = false; 
var togglehide;
</script>
<h4>댓글</h4>
<c:forEach var="comment" items="${commentlist}" varStatus = "status">
	<div class="comment-list">
		<div class="single-comment justify-content-between d-flex">

			<div class="user justify-content-between d-flex">
				<!-- <div class="thumb">
					<img src="assetsx/img/blog/comment_1.png" alt="">
				</div> -->

				<div class="media align-items-center">
					<div style="margin-right: 23px">
						<img class="rounded-circle" width="70px" height="70px"
							src="photodownload?fileName=${comment.mmyimage}" />
					</div>
					<div class="desc" id="desc">
						<p class="comment">${comment.rcontent}</p>
						
						<div class="d-flex justify-content-between">
							<div class="d-flex align-items-center">
								<h5>
									<a href="blog?UserUrl=${comment.murl}">${comment.mnickname }</a>
								</h5>
								<p class="date" style="margin-right:20px;">
									<fmt:formatDate value="${comment.rdate}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
							<div class="reply-btn">
								<%-- <a href="javascript:addComment(${comment.rno })" class="btn-reply text-uppercase">답글</a> <!-- 답글 --> --%>
								<c:if test="${comment.murl == SessionMurl}">
									<a href="javascript:commentModify(${status.index})" style="color:gray"><i class="fa fa-pencil-square-o" style="font-size:18px; margin-right:0px 6px;"></i>  </a>
									<a href="javascript:commentDelete(${comment.rno})" style="color:gray"><i class="fa fa-trash" aria-hidden="true" style="font-size:18px"></i></a>
									</c:if>
								<script type="text/javascript">
								  function addComment(rno){
									  
									  $.ajax({
										  url: "addComment",
										  data: {rno:rno },
										  method:"get",
										  success:function(data){
											  alert("addComment success 실행");
										  }			  
									  });
								  }
								</script>
							</div>
						</div>
						<c:if test="${comment.murl == SessionMurl}">
								<div style="text-align:left	;">
									
								</div>	
									<hr/>
									<p class="comment" id="comment${status.index}" style="display:none; text-align: right;">
										<textarea class="form-control w-100" name="comment" id="modify_content${status.index}" cols="100" rows="2" placeholder="수정할 댓글을 입력하세요"></textarea>
										<a href="javascript:modify(${comment.rno }, ${status.index})" class="genric-btn success medium small">작성하기</a>		
									</p>
									
						<script type="text/javascript">
						 	function commentModify(number){
						 	
						 		$("#comment"+number).toggle();
						 		
								/* alert("commentModify 실행");
						 		 */
								
								
								
								/*  var tags = '<textarea name="test" id="test" cols="30" rows="30"></textarea>';	 
								 alert(tags);
									${"#desc"}.html(tags); */
								
							}
						 
							function commentDelete(rno){	
								 if(confirm("정말로 삭제 하시겠습니까?")){
								 	$.ajax({
										url: "commentDelete",
										data: {rno:rno},
										success: function(data){
										// 삭제는 됬고  댓글 리스트를  새로고침 해야함	
										onload();
										//location.href="blog_details?bno=${comment.bno}";		
										}
									}); 
							 	}  
							}
						
							function modify(rno, number){
								 var rcontent1 = $("#modify_content"+number).val().trim();
								
								$.ajax({
						 			url : "commentModify",
						 			data : {rno:rno, rcontent:rcontent1},
						 			method : "post",
						 			success: function(data){
						 				onload();
						 			}
						 		});
							}
							
							 
						</script>
										
						</c:if>	
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>