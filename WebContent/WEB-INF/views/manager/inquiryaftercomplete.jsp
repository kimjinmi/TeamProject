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

<script>

function inquiryaftercomplete(pageNo) {
	if(!pageNo) {
		pageNO = 1;
	}
	
	$.ajax({
		url:"inquiryaftercomplete",
		data:{pageNo:pageNo},
		success:function(data) {
			$("#afterview").html(data);
		}
	});	
}
</script> 

		<table style="text-align:center; width: 70%">
			<colgroup>
				
				<col width="35%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
				<col width="5%">
			</colgroup>
			<thead>
				<tr style="background-color:#FBF9FF;">
					
					<th scope="col">Title</th>
					<th scope="col">Writer</th>
					<th scope="col">Date</th>
					
					<th scope="col"><i class="fa fa-trash" aria-hidden="true"></i></th>
				</tr>
			</thead>
			<%-- <td><a href="<%=application.getContextPath()%>/blog/blog_details?bno=${inquiryList.ititle}">${inquiryList.ititle}</a></td> --%>
			<c:forEach var="inquiryList" items="${inquiryList}">
				<c:if test="${inquiryList.iresult == true}">
					<tr style="border-spacing: 5px;">
						
						<td><a href="javascript:inquirydetail(${inquiryList.ino})">${inquiryList.isubject}</a></td>
						<td>${inquiryList.iemail}</td>
					
						<td><fmt:formatDate value="${inquiryList.idate}" pattern="yyyy-MM-dd" /></td>
						
						<td><a href="javascript:inquirydelete(${inquiryList.ino})"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
					</tr>
				</c:if>	
			</c:forEach>
			
		
			<tr>
				<td colspan="4" style="text-align:center;">
					<a class="genric-btn primary-border small" href="javascript:inquiryaftercomplete(1)">처음</a>
					
					<c:if test="${pager.groupNo >1}">
						<a class="genric-btn primary-border small" href="javascript:inquiryaftercomplete()(${pager.startPageNo-1})">이전</a>
					</c:if>
					
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo == i}">
							<a class="genric-btn primary small" href="javascript:inquiryaftercomplete(${i})">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo != i}">
							<a class="genric-btn primary-border small" href="javascript:inquiryaftercomplete(${i})">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo <pager.totalGroupNo}">
						<a class="genric-btn primary-border small" href="javascript:inquiryaftercomplete(${pager.endPageNo+1})">다음</a>
					</c:if>
					<a class="genric-btn primary-border small" href="javascript:inquiryaftercomplete(${pager.totalPageNo})">맨끝</a>
					
				</td>
			</tr>
		</table> 


