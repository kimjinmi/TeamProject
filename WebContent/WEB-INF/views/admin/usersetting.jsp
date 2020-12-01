<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d; display:inline;">회원 관리</h2>

<hr style="margin-top:12px;">

<div class="container">	
	<div class="row">
		<div class="col-4"> Add Disabled Member </div>
		<div class="col-8">
			<input type="text" placeholder="Disabled Member Email" onblur="this.placeholder = 'Disabled Member Email'" class="single-input">
		</div>
	</div>
	<p></p>
	<div class="row">
		<div class="col-4"> </div>
		<div class="col-8">
			<input type="text" placeholder="Disabled Member Reason" onblur="this.placeholder = 'Disabled Member Reason'" class="single-input">
		</div>
	</div>
	<div class="row">
		<div class="col-4"></div>
		<div class="col-8"></div>
		<span id="adaError"></span>
	</div>
	<p></p>
	<p></p>
	<hr>
<!-- 	<div class="row">
		<div class="col-12">
			<a style="width: 100%" class="button button-contactForm boxed-btn" href="javascript:adddisabledmember()">차단 회원 추가</a>
		</div>
	</div>
	<p></p> -->
	<div class="row">
		<c:forEach var="mabled" items="${mabled}">
			<div class="col-3" style="padding-top: 5%;">
						<img src="photodownload?fileName=${mabled.mmyimage}" alt="" width="100" height="100" class="rounded-circle">
					</div>
					<div class="col-6">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><i class="fa fa-user" aria-hidden="true"></i> Email : ${mabled.memail}</li></a>
							<li class="list-group-item"><i class="fa fa-bookmark" aria-hidden="true"></i> Nickname : ${mabled.mnickname}</li>
							<li class="list-group-item"><i class="fa fa-bookmark" aria-hidden="true"></i> User Intro : ${mabled.mintro}</li>
							<li class="list-group-item"><i class="fa fa-phone" aria-hidden="true"></i> Phone Number : ${mabled.mphonenum}</li>
							<p></p>
						</ul>
					</div>
					<div class="col-3" style="padding-top: 30px;">
						<a style="width: 90%; height: 65%; font-size: large; font-weight: bold; padding-top: 5%;" 
						class="genric-btn danger" href="javascript:adddisabledmember()">선택 회원 차단하기</a>
					</div>
			</c:forEach>

			<tr>
				<td colspan="4" style="text-align: center;"><a
						class="genric-btn primary radius btn-md" 
						href="javascript:usersetting(1)">처음</a> 
				<c:if test="${pager.groupNo>1}">
					<a class="genric-btn primary radius btn-md" 
						href="javascript:usersetting(${pager.startPageNo-1})">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
						<a class="genric-btn primary radius btn-md"
							href="javascript:usersetting(${i})">${i}</a>
					</c:if>				
				
					<c:if test="${pager.pageNo != i}">
						<a class="genric-btn primary radius btn-md"
							href="javascript:usersetting(${i})">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<a class="genric-btn primary radius btn-md"
						href="javascript:usersetting(${pager.endPageNo+1})">다음</a>
				</c:if>
				<a class="genric-btn primary radius btn-md"
					href="javascript:usersetting(${pager.totalPageNo})">맨끝</a>												
	</div>
	<p></p>

</div>

	



					