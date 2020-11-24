<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<h2 style="color: #2d2d2d;">회원탈퇴</h2>
<hr/ style="margin-top:12px;">
<center>
	<img class="img-fluid" src="<%=application.getContextPath()%>/resources/images/risk_high.jpg" alt="">
	<blockquote class="generic-blockquote">
		탈퇴 후에는 아이디와 데이터는 복구 할 수 없습니다.<br/>
		작성하였던 모든 게시물과 댓글이 삭제됩니다.
	</blockquote>
	
	<p>
		<input type="checkbox" id="confirm-checkbox">
		<label for="confirm-checkbox"></label>
		안내 사항을 모두 확인하였으며, 이에 동의합니다.<br/>	
	</p>
	<a class="genric-btn danger-border radius" href="#">회원 탈퇴</a>
</center>
		                	