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
	<div class="row">
		<div class="col-12">
			<a style="width: 100%" class="button button-contactForm boxed-btn" href="javascript:adddisabledmember()">차단 회원 추가</a>
		</div>
	</div>
	<p></p>
	<div class="row">
		<div class="col-3">
					<img src="photodownload?fileName=" alt="" width="100" height="100" class="rounded-circle">
				</div>
				<div class="col-9">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<a href="<%=application.getContextPath()%>/blog/blog?UserUrl=${manager.murl}"><i class="fa fa-user" aria-hidden="true"></i> 이메일(닉네임)</li></a>
						<li class="list-group-item"><i class="fa fa-bookmark" aria-hidden="true"></i> 회원인트로</li>
						<li class="list-group-item"><i class="fa fa-phone" aria-hidden="true"></i> 전화번호</li>
					</ul>
		
				</div>
	</div>
	<p></p>

</div>

	



					