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
				<td><b>${list.atitle}</b></td>
				<td><b><fmt:formatDate value="${list.adate}" pattern="yyyy-MM-dd" /></b></td>
				<td><b>${list.ahitnum}</b></td>
			</tr>
		</c:if>	
	</c:forEach>
	<c:forEach var="list" items="${list}">
		<c:if test="${list.aifmain == 'false'}">
			<tr style="border-spacing: 5px;">
				<td>${list.ano}</td>
				<td>${list.atitle}</td>
				<td><fmt:formatDate value="${list.adate}" pattern="yyyy-MM-dd" /></td>
				<td>${list.ahitnum}</td>
			</tr>
		</c:if>	
	</c:forEach>
	<tr>
		<td colspan="3" style="text-align:center;">
			<a class="genric-btn primary-border small" href="javascript:allboardlist(1)"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
			
			<c:if test="${pager.groupNo >1}">
				<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.startPageNo-1})"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
			</c:if>
			
			<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				<c:if test="${pager.pageNo == i}">
					<a class="genric-btn primary small" href="javascript:allboardlist(${i})">${i}</a>
				</c:if>
				<c:if test="${pager.pageNo != i}">
					<a class="genric-btn primary-border small" href="javascript:allboardlist(${i})">${i}</a>
				</c:if>
			</c:forEach>
			<c:if test="${pager.groupNo <pager.totalGroupNo}">
				<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.endPageNo+1})"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
			</c:if>
			<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.totalPageNo})"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
			
		</td>
	</tr>
</table>
		

	



					