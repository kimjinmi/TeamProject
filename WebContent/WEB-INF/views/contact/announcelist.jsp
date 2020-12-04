<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<style>
tr, th, td{
padding: 10px;

}
a, button {
    color: black;
}
b > a, button{
	color: #1f2b7b;
}


</style>
<script type="text/javascript">
function announcedetail(ano){
	var pageNo = $("#pageNo").val();
	$.ajax({
		url:"announcedetail",
		data:{ano:ano, pageNo:pageNo},
		success : function(data){
			$("#table_result").html(data);	
		}
	});

}

</script>
<table style="text-align:center; width: 100%">
	<colgroup>
		<col width="10%">
		<col width="60%">
		<col width="20%">
		<col width="10%">
	</colgroup>
	<thead>
		<tr style="background-color:#FBF9FF;">
			<th scope="col">No</th>
			<th scope="col">title</th>
			<th scope="col">date</th>
			<th scope="col">views</th>
		</tr>
	</thead>
	<c:forEach var="list" items="${list}">
		<c:if test="${list.aifmain == 'true'}">
			<tr style="border-spacing: 5px;">
				<td><b>${list.ano}</b></td>
				<td><b><a href="javascript:announcedetail(${list.ano})">${list.atitle}</a></b></td>
				<td><b><fmt:formatDate value="${list.adate}" pattern="yyyy-MM-dd" /></b></td>
				<td><b>${list.ahitnum}</b></td>
			</tr>
		</c:if>	
	</c:forEach>
	<c:forEach var="list" items="${list}">
		<c:if test="${list.aifmain == 'false'}">
			<tr style="border-spacing: 5px;">
				<td>${list.ano}</td>
				<td><a href="javascript:announcedetail(${list.ano})">${list.atitle}</a></td>
				<td><fmt:formatDate value="${list.adate}" pattern="yyyy-MM-dd" /></td>
				<td>${list.ahitnum}</td>
			</tr>
		</c:if>	
	</c:forEach>
	<tr>
		<td colspan="4" style="text-align:center;">
			<a class="genric-btn primary-border small" href="javascript:allannouncelist(1)"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
			
			<c:if test="${pager.groupNo >1}">
				<a class="genric-btn primary-border small" href="javascript:allannouncelist(${pager.startPageNo-1})"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
			</c:if>
			
			<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				<c:if test="${pager.pageNo == i}">
					<a class="genric-btn primary small" href="javascript:allannouncelist(${i})">${i}</a>
					<input type="hidden" id="pageNo" value="${i}"/>
				</c:if>
				<c:if test="${pager.pageNo != i}">
					<a class="genric-btn primary-border small" href="javascript:allannouncelist(${i})">${i}</a>
				</c:if>
			</c:forEach>
			<c:if test="${pager.groupNo <pager.totalGroupNo}">
				<a class="genric-btn primary-border small" href="javascript:allannouncelist(${pager.endPageNo+1})"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
			</c:if>
			<a class="genric-btn primary-border small" href="javascript:allannouncelist(${pager.totalPageNo})"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
			
		</td>
	</tr>
</table>

		

	



					