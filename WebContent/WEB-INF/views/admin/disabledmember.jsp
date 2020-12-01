<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d; display:inline;">차단 회원 관리</h2>

<hr style="margin-top:12px;">

<div class="container">	
	<div class="row">
		<div class="col-3">
			<img src="photodownload?fileName=" alt="" width="100" height="100" class="rounded-circle">
		</div>
		<div class="col-9">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<a href="<%=application.getContextPath()%>/blog/blog?UserUrl="><i class="fa fa-user" aria-hidden="true"></i> 회원이름</li></a>
				<li class="list-group-item"><i class="fa fa-bookmark" aria-hidden="true"></i> 차단이유</li>
				<li class="list-group-item"><i class="fa fa-calendar" aria-hidden="true"></i> 차단날짜</li>
				<li class="list-group-item" style="color:red;">
					<a href="javascript:"><i class="fa fa-minus" aria-hidden="true"></i>&nbsp;&nbsp;차단 해제</a></li>
			</ul>

		</div>
	</div>
	<p></p>

</div>

	



					