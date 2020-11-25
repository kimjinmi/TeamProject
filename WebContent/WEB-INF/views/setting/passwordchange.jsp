<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d; display:inline;">비밀번호 변경</h2>

<hr style="margin-top:12px;">
	
<form method="post" action="updatenickintro">
	<div class="row">
		<div class="col-2">비밀번호변경</div>
		<div class="col-7">
	 		<input type="text" id="mnickname" name="mnickname" 
				class="single-input" >
		</div>
    </div>
    <p></p>
    <div class="row">
		<div class="col-2">비밀번호확인</div>
		<div class="col-7">
	 		<input type="text" id="mnickname" name="mnickname" 
				class="single-input" >
		</div>
    </div> 
    <p></p>
    <div class="row">
    	<span id="passwordresult"></span>
    </div>
    <div class="row">
	    <div class="col-3"></div>
    	<div class="col-6">
    		<input class="genric-btn success radius" type="submit" value="비밀번호 변경"/>
		</div>
		
	</div>
</form>


					