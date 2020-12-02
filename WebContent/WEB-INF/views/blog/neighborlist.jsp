<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="list" items="${list}">
	<div class="media post_item">    
		<img class="rounded-circle" width="50px" height="50px"
							src="photodownload?fileName=${list.mmyimage}" />      
			<div class="media-body">
				<a href="<%=application.getContextPath()%>/blog/blog?UserUrl=${list.nemurl}">
				<h3 style="color: #2d2d2d;">${list.mnickname}</h3> </a>
				
				
			</div>
	</div>
</c:forEach>
<p></p> 
<center>
	<c:if test="${pager.groupNo >1}">
			<a class="genric-btn primary-border small" href="javascript:neighborlist(${pager.startPageNo-1})"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
	</c:if>
	
	<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		<c:if test="${pager.pageNo == i}">
			<a class="genric-btn primary small" href="javascript:neighborlist(${i})">${i}</a>
		</c:if>
		<c:if test="${pager.pageNo != i}">
			<a class="genric-btn primary-border small" href="javascript:neighborlist(${i})">${i}</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${pager.groupNo <pager.totalGroupNo}">
		<a class="genric-btn primary-border small" href="javascript:neighborlist(${pager.endPageNo+1})"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
	</c:if>
</center>
			
