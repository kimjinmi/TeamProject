<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
function replydelete(rno){
	$.ajax({
		url:"replydelete",
		data:{rno:rno},
		success:function(data){
			if(data.result == "success"){
				allreplylist();
			}
		}
	});
}
</script>
	<h2 style="color: #2d2d2d; display:inline;"><a href="javascript:allboardlist()">게시글 관리</a></h2>/
	<u><h2 style="color: #2d2d2d; display:inline;"><a href="javascript:allreplylist()">댓글 관리</a></h2></u>

<hr style="margin-top:12px;">


<div class="container">
	<div style="background-color:#FBF9FF; height: 30px; text-align: center;" class="row">
			<div class="col col-md-3"><b>title</b></div>
			<div class="col col-md-3"><b>reply</b></div>
			<div class="col col-md-3"><b>replywriter</b></div>
			<div class="col col-md-2"><b>date</b></div>
			<div class="col col-md-1"><i class="fa fa-trash" aria-hidden="true"></i></div>
	</div>
	<hr>
	<c:forEach var="reply" items="${list}">
		<div class="row">
			<div class="col-md-2"><a href="<%=application.getContextPath()%>/blog/blog_details?bno=${reply.bno}">${reply.btitle}</a></div>
			<div class="col-md-4">${reply.rcontent}</div>
			<div class="col-md-3">${reply.memail}</div>
			<div class="col-md-2"><fmt:formatDate value="${reply.rdate}" pattern="yy.MM.dd" /></div>
			<div class="col-md-1"><a href="javascript:replydelete(${reply.rno})"><i class="fa fa-trash" aria-hidden="true"></i></a></div>
		</div>
		<hr>
	</c:forEach>
	<div style="text-align:center;" class="row">
		<div class="col">
			<a class="genric-btn primary-border small" href="javascript:allreplylist(1)"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
			
			<c:if test="${pager.groupNo >1}">
				<a class="genric-btn primary-border small" href="javascript:allreplylist(${pager.startPageNo-1})"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
			</c:if>
		
			<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				<c:if test="${pager.pageNo == i}">
					<a class="genric-btn primary small" href="javascript:allreplylist(${i})">${i}</a>
				</c:if>
				<c:if test="${pager.pageNo != i}">
					<a class="genric-btn primary-border small" href="javascript:allreplylist(${i})">${i}</a>
				</c:if>
			</c:forEach>
		
			<c:if test="${pager.groupNo <pager.totalGroupNo}">
				<a class="genric-btn primary-border small" href="javascript:allreplylist(${pager.endPageNo+1})"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
			</c:if>
			<a class="genric-btn primary-border small" href="javascript:allreplylist(${pager.totalPageNo})"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
		</div>
	</div>	
</div>			
