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

	<div class="mt-10">
		<input type="text" id="inputId" name="EMAIL" placeholder="이메일 확인"
			onfocus="this.placeholder = ''"
			onblur="this.placeholder = '이메일 확인'" required
			class="single-input">
			<span id="match1" style="color:red;display:none;">일치하지 않습니다.</span>
	</div>
	
	<div class="mt-10">
		<input type="password" id="inputPw" name="EMAIL" placeholder="비밀번호 확인"
			onfocus="this.placeholder = ''"
			onblur="this.placeholder = '비밀번호 확인'" required
			class="single-input">
			<span id="match" style="color:red; display:none;">아이디 또는 비밀번호가 일치하지 않습니다.</span>
	</div>
	<p><p>
	<a class="genric-btn primary-border radius" href="javascript:deleter()">계정 확인</a>
	
	<div id="deleteform" style="display:none;">
	<p>
		<input type="checkbox" id="confirm-checkbox">
		<label for="confirm-checkbox"></label>
		안내 사항을 모두 확인하였으며, 이에 동의합니다.<br/>	
	</p>
	<a class="genric-btn danger-border radius" href="javascript:userDelete('${SessionMemail}')">회원 탈퇴</a>
	</div>
	<script type="text/javascript">
	function deleter(){
		
		var inputId = $("#inputId").val().trim();
		var inputPw = $("#inputPw").val().trim();
		
		 $.ajax({
			url : "deleteform",
			method : "post",
			data : {inputId:inputId, inputPw:inputPw},
			success : function(data){
					if(data.result == "success"){
					$("#deleteform").toggle();
				}else{
					
					$("#match").toggle();
					
				}  
			}
					
		});
	}
	
	function userDelete(SessionMemail){
		$.ajax({
			url:"userDeleteAction",
			method: "post",
			data:{SessionMemail:SessionMemail},
			success : function(data){
				 if(data.result == "success"){
					location.href="<%=application.getContextPath()%>/signin/content";
				}	 
			}
		});
	}
	</script>
</center>
		                	