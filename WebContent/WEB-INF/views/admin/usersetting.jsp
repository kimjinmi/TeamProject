<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d; display: inline;">회원 관리</h2>

<!-- <hr style="margin-top: 12px;"> -->

<div class="container">
<!-- 	<div class="row">
		<div class="col-4">Add Disabled Member</div>
		<div class="col-8">
			<input type="text" placeholder="Disabled Member Email"
				onblur="this.placeholder = 'Disabled Member Email'"
				class="single-input">
		</div>
	</div>
	<p></p> -->
<!-- 	<div class="row" style="height: 50px; padding-bottom: 10%;">
		<div class="col-4" style="padding-top: 0.5%;">Add to Disabled Member</div>
		<div class="col-8">
			<input type="text" id="reason" placeholder="해당 회원의 이메일을 작성하세요."
				onblur="this.placeholder = 'Please write down User's Email Address.'"
				class="single-input" style="font-weight: bold;">
			<input type="text" id="reason" placeholder="해당 회원을 비활성화 하려는 이유를 작성하세요."
				onblur="this.placeholder = 'Please write down the reason.'"
				class="single-input" style="font-weight: bold;">
		</div>
	</div> -->
	<div class="row">
		<div class="col-4"></div>
		<div class="col-8"></div>
		<span id="adaError"></span>
	</div>
	<p></p>
	<hr>
	<!-- 	<div class="row">
		<div class="col-12">
			<a style="width: 100%" class="button button-contactForm boxed-btn" href="javascript:adddisabledmember()">차단 회원 추가</a>
		</div>
	</div>
	<p></p> -->
	<p style="font-size: 20px; font-weight: bold; color: orange;"><i class="fas fa-info" style="padding-right: 2%; font-size: 20px;"></i>Abled User Information</p>
	<div class="row">
		<c:forEach var="mabled" items="${mabled}">
			<div class="col-3" style="padding-top: 10%;">
				<img src="photodownload?fileName=${mabled.mmyimage}" alt=""
					width="100" height="100" class="rounded-circle">
			</div>
			<div class="col-9"  style="padding-bottom: 5%;">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><i class="fa fa-user"
						aria-hidden="true"></i> Email : ${mabled.memail}</li>
					<li class="list-group-item"><i class="fa fa-user"
						aria-hidden="true"></i> Nickname : ${mabled.mnickname}</li>
					<li class="list-group-item"><i class="fa fa-bookmark"
						aria-hidden="true"></i> User Intro : ${mabled.mintro}</li>
					<li class="list-group-item"><i class="fa fa-phone"
						aria-hidden="true"></i> Phone Number : ${mabled.mphonenum}</li>
				</ul>
				<div>
					<input type="hidden" id="memail" value="${mabled.memail}">
					<input type="text" id="dreason" placeholder="해당 회원을 비활성화 하려는 이유를 작성하세요."
								onblur="this.placeholder = 'Please write down the reason.'"
								class="single-input" style="font-weight: bold;"><span id="dreasonError"></span>
				</div>
				<li style="padding-left: 10%;"><a href="javascript:disabledclick()" class="list-group-item"
					style="color: red; display: inline-block; padding-left: 10%; padding-right: 10%;"><i
					class="fa fa-minus" aria-hidden="true"> &nbsp;&nbsp;선택 회원 차단하기</i></a></li>
			</div>

			 <%-- <div class="col-3" style="padding-top: 30px;">
				<a style="width: 90%; height: 65%; font-size: large; font-weight: bold; padding-top: 5%;"
					class="genric-btn danger" href="javascript:adddisabledmember(${mabled.memail})">선택 회원 차단하기</a> --%>
					
					<script type="text/javascript">
						function disabledclick() {
							var memail = $("#memail").val().trim();
							var dreason = $("#dreason").val().trim();
                        	if(dreason == "") { 
                        		$("#dreasonError").text("필수");
                        		return;
                        		}	else {
                        		$("#dreasonError").text(""); }
							
							$.ajax({
								url:"adddisabledmember",
								data:{memail:memail, dreason:dreason},
								success: function(data) {
									if(data.result == "success") {
										usersetting();
									}
								}							
							});
						}				
					
					</script>
			</div>

		</c:forEach>
		<div class="row">
			<div class="col-12">
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
		</div>
	</div>
	<p></p>

</div>





