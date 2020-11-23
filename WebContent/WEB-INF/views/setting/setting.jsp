<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d; display:inline;">내 페이지 설정</h2>

<hr style="margin-top:12px;">
	
<form method="post" action="updatenickintro">
	<div class="row">
		<div class="col-2">닉네임</div>
		<div class="col-7">
	 		<input type="text" id="mnickname" name="mnickname" 
				class="single-input" value="${member.mnickname}">
		</div>

		<div class="col-3">
			<a class="genric-btn primary radius small" href="#">중복확인</a>
		</div>

    </div>
    <p></p>
     
	<div class="row">
       	<div class="col-2">소개글</div>
       	<div class="col-10">
       		<textarea id="mintro" name="mintro" class="single-textarea" >${member.mintro}</textarea>
		</div>
    </div>
        <p><input type="hidden" id="memail" name="memail" 
				class="single-input" value="${member.memail}"></p>
    <div class="row">
	    <div class="col-3"></div>
    	<div class="col-6">
    		<input class="genric-btn success radius" type="submit" value="수정 완료"/>
		</div>
		
	</div>
</form>


					