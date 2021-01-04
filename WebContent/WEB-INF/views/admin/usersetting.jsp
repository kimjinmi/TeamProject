<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<h2 style="color: #2d2d2d; display: inline;">회원 관리</h2>
<div class="container">
	<div class="row">
		<div class="col-4"></div>
		<div class="col-8"></div>
		<span id="adaError"></span>
	</div>
	<p></p>
	<hr>
	<p style="font-size: 20px; font-weight: bold; color: orange;"><i class="fas fa-info" style="padding-right: 2%; font-size: 20px;"></i>Abled User Information</p>
	<div class="row">
		<c:forEach var="mabled" items="${mabled}" varStatus="status">
			<div class="col-3" style="padding-top: 10%;">
				<img src="photodownload?fileName=${mabled.mmyimage}" 
				alt="" width="100" height="100" class="rounded-circle">
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
					<input type="hidden" id="memail${status.index}"  name="memail" value="${mabled.memail}">
					<input type="text" id="dreason${status.index}" name="dreason" placeholder="해당 회원을 비활성화 하려는 이유를 작성하세요."
								onblur="this.placeholder = 'Please write down the reason.'"
								class="single-input" style="font-weight: bold;"><span id="dreasonError${status.index}" style="color: red; font-weight: bold;"></span>
				</div>
				<li style="padding-left: 10%;"><a href="javascript:disabledclick(${status.index})" class="list-group-item"
					style="color: red; display: inline-block; padding-left: 10%; padding-right: 10%;">
					<i class="fa fa-minus" aria-hidden="true"> &nbsp;&nbsp;선택 회원 차단하기</i></a></li>
			</div>
		</c:forEach>
			<script type="text/javascript">
				function disabledclick(index) {
					var memail = $("#memail"+index).val().trim();
					var dreason = $("#dreason"+index).val().trim();
                      	if(dreason == "") { 
                      		$("#dreasonError"+index).text("필수");
                      	}else {
                      		$("#dreasonError"+index).text(""); 
                      	}
                
                      	if(memail == "" || dreason==""){
                      		return;
                      	}
                  	
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
	<div class="row">
		<div style="text-align: center;" class="col-12">
			
			<a class="genric-btn primary-border radius btn-md"
					href="javascript:usersetting(1)">처음</a> <c:if
						test="${pager.groupNo>1}">
						<a class="genric-btn primary-border radius btn-md"
							href="javascript:usersetting(${pager.startPageNo-1})">이전</a>
					</c:if> <c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}">
						<c:if test="${pager.pageNo==i}">
							<a class="genric-btn primary radius btn-md"
								href="javascript:usersetting(${i})">${i}</a>
						</c:if>

						<c:if test="${pager.pageNo != i}">
							<a class="genric-btn primary-border radius btn-md"
								href="javascript:usersetting(${i})">${i}</a>
						</c:if>
					</c:forEach> <c:if test="${pager.groupNo<pager.totalGroupNo}">
						<a class="genric-btn primary-border radius btn-md"
							href="javascript:usersetting(${pager.endPageNo+1})">다음</a>
					</c:if> <a class="genric-btn primary-border radius btn-md"
					href="javascript:usersetting(${pager.totalPageNo})">맨끝</a>
				
			</div>
		</div>
	</div>
	<p></p>

</div>





