<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2 style="color: #2d2d2d; display:inline;">차단 회원 관리</h2>

<hr style="margin-top:12px;">

<div class="container">	
<p style="font-size: 20px; font-weight: bold; color: red;"><i class="fas fa-info" style="padding-right: 2%; font-size: 20px;"></i>Disabled User Information</p>
	<div class="row">
		<c:forEach var="mdisabled" items="${mdisabled}">
			<div class="col-3" style="padding-top: 3%;">
				<img src="photodownload?fileName=${mdisabled.mmyimage}" 
				alt="" width="100" height="100" class="rounded-circle">
			</div>
			<div class="col-9">
				<ul class="list-group list-group-flush">
					<%-- <li class="list-group-item">
						<a href="<%=application.getContextPath()%>/blog/blog?UserUrl=">
						<i class="fa fa-user" aria-hidden="true"></i> 회원이름</li></a> --%>
						
					<li class="list-group-item"><i class="fa fa-user"
						aria-hidden="true"></i> Email : ${mdisabled.memail}</li>
					<li class="list-group-item"><i class="fa fa-user"
						aria-hidden="true"></i> Nickname : ${mdisabled.mnickname}</li>
					<li class="list-group-item"><i class="fa fa-bookmark" 
						aria-hidden="true"></i> Disabled Reason : ${mdisabled.dreason}</li>
					<li class="list-group-item"><i class="fa fa-calendar" 
						aria-hidden="true"></i> Disabled Date : <fmt:formatDate value="${mdisabled.ddate}" pattern="MM월 dd일" /></li>
					<li class="list-group-item" style="color:red;"><i class="fa fa-minus" aria-hidden="true">
						<a href="javascript:disabledclick()" class="list-group-item" 
							style="color:red; display: inline-block; padding-left: 0; padding-right: 0;">&nbsp;&nbsp;선택 회원 차단 풀기</a></i></li>
				</ul>
			</div>
			<%-- <div class="col-3" style="padding-top: 30px;">
				<a style="width: 90%; height: 55%; font-size: large; font-weight: bold; padding-top: 5%;"
					class="genric-btn danger" href="javascript:adddisabledmember(${mdisabled.memail})">선택 회원 차단 풀기</a>
			</div> --%>
		</c:forEach>
		<div class="row">
			<div class="col-12">
				<tr style="text-align: center;">
					<td colspan="4" style="text-align: center;"><a
						class="genric-btn primary radius btn-md"
						href="javascript:disabledmember(1)">처음</a> <c:if
							test="${pager.groupNo>1}">
							<a class="genric-btn primary radius btn-md"
								href="javascript:disabledmember(${pager.startPageNo-1})">이전</a>
						</c:if> <c:forEach var="i" begin="${pager.startPageNo}"
							end="${pager.endPageNo}">
							<c:if test="${pager.pageNo==i}">
								<a class="genric-btn primary radius btn-md"
									href="javascript:disabledmember(${i})">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo != i}">
								<a class="genric-btn primary radius btn-md"
									href="javascript:disabledmember(${i})">${i}</a>
							</c:if>
						</c:forEach> <c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="genric-btn primary radius btn-md"
								href="javascript:disabledmember(${pager.endPageNo+1})">다음</a>
						</c:if> <a class="genric-btn primary radius btn-md"
						href="javascript:disabledmember(${pager.totalPageNo})">맨끝</a></td>
				</tr>
			</div>
		</div>
	</div>
	<p></p>
</div>

	



					