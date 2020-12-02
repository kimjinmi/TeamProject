<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d; display:inline;">차단 회원 관리</h2>

<hr style="margin-top:12px;">

<div class="container">	
	<div class="row">
		<c:forEach var="mdisabled" items="${mdisabled}">
			<div class="col-3" style="padding-top: 5%;">
				<img src="photodownload?fileName=${mdisabled.mmyimage}" 
				alt="" width="100" height="100" class="rounded-circle">
			</div>
			<div class="col-6">
				<ul class="list-group list-group-flush">
					<%-- <li class="list-group-item">
						<a href="<%=application.getContextPath()%>/blog/blog?UserUrl=">
						<i class="fa fa-user" aria-hidden="true"></i> 회원이름</li></a> --%>
						
					<li class="list-group-item"><i class="fa fa-user"
						aria-hidden="true"></i> Email : ${mdisabled.memail}</li>
					<li class="list-group-item"><i class="fa fa-user"
						aria-hidden="true"></i> Nickname : ${mdisabled.mnickname}</li>
					<li class="list-group-item"><i class="fa fa-bookmark" aria-hidden="true"></i> Disabled Reason : ${mdisabled.dreason}</li>
					<li class="list-group-item"><i class="fa fa-calendar" aria-hidden="true"></i> Disabled Date : ${mdisabled.ddate}</li>
					<li class="list-group-item" style="color:red;">
						<a href="javascript:"><i class="fa fa-minus" aria-hidden="true"></i>&nbsp;&nbsp;Turn to be Able</a></li>
				<p></p>
				</ul>
			</div>
		</c:forEach>
		<tr>
		<td colspan="4" style="text-align: center;"><a
			class="genric-btn primary radius btn-md"
			href="javascript:usersetting(1)">처음</a> <c:if
				test="${pager.groupNo>1}">
				<a class="genric-btn primary radius btn-md"
					href="javascript:usersetting(${pager.startPageNo-1})">이전</a>
			</c:if> <c:forEach var="i" begin="${pager.startPageNo}"
				end="${pager.endPageNo}">
				<c:if test="${pager.pageNo==i}">
					<a class="genric-btn primary radius btn-md"
						href="javascript:usersetting(${i})">${i}</a>
				</c:if>
				<c:if test="${pager.pageNo != i}">
					<a class="genric-btn primary radius btn-md"
						href="javascript:usersetting(${i})">${i}</a>
				</c:if>
			</c:forEach> <c:if test="${pager.groupNo<pager.totalGroupNo}">
				<a class="genric-btn primary radius btn-md"
					href="javascript:usersetting(${pager.endPageNo+1})">다음</a>
			</c:if> <a class="genric-btn primary radius btn-md"
			href="javascript:usersetting(${pager.totalPageNo})">맨끝</a>	
	</div>
	<p></p>
</div>

	



					