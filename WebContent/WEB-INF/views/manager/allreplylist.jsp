<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<style>
tr, th, td{
padding: 10px;
overflow:hidden;
text-overflow:ellipsis;


}

</style>
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
<h2 style="color: #2d2d2d; display:inline;">댓글 관리</h2>

<hr style="margin-top:12px;">


	<table style="text-align:center; width: 90%">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="30%">
			<col width="20%">
			<col width="20%">
			<col width="5%">
		</colgroup>
		<thead>
			<tr style="background-color:#FBF9FF;">
				<th scope="col">no</th>
				<th scope="col">title</th>
				<th scope="col">reply</th>
				<th scope="col">replywriter</th>
				<th scope="col">date</th>
				<th scope="col"><i class="fa fa-trash" aria-hidden="true"></i></th>
			</tr>
		</thead>
			<c:forEach var="reply" items="${list}">
				<tr style="border-spacing: 5px;">
					<td>${reply.rno}</td>
					<td><a href="<%=application.getContextPath()%>/blog/blog_details?bno=${reply.bno}">${reply.btitle}</a></td>
					<td>${reply.rcontent}</td>
					<td>${reply.memail}</td>
					<td><fmt:formatDate value="${reply.rdate}" pattern="yyyy-MM-dd" /></td>
					<td><a href="javascript:replydelete(${reply.rno})"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
				</tr>	
			</c:forEach>
			
		
			<tr>
				<td colspan="5" style="text-align:center;">
					<a class="genric-btn primary-border small" href="javascript:allreplylist(1)">처음</a>
					
					<c:if test="${pager.groupNo >1}">
						<a class="genric-btn primary-border small" href="javascript:allreplylist(${pager.startPageNo-1})">이전</a>
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
						<a class="genric-btn primary-border small" href="javascript:allreplylist(${pager.endPageNo+1})">다음</a>
					</c:if>
					<a class="genric-btn primary-border small" href="javascript:allreplylist(${pager.totalPageNo})">맨끝</a>
					
				</td>
			</tr>
		
	</table>

					