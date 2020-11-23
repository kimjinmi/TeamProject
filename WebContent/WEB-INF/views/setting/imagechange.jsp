<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<h2 style="color: #2d2d2d; display:inline;">내 프로필 사진 설정</h2>


<hr style="margin-top:12px;">
	
<form action="#">
           
  	<div class="row">
	   	<div class="col-2">프로필 사진</div>
	   	<div class="col-5">
	              	<%-- <img src="<%=application.getContextPath()%>/resources/images/unnamed.jpg" alt="" width="200" height="200"> --%>
			<img width="200" height="200" src="photodownload?fileName=${member.mmyimage}"/>
		</div>
		<div class="col-5">
			<a class="genric-btn primary radius small" href="photoenroll">등록</a>
			<a class="genric-btn primary radius small" href="photodelete">삭제</a>
			<br/><br/>
			프로필 이미지는 ~~~~~
		</div>
    </div>
    <p></p>
    <div class="row">
     	<div class="col-12">
    		<center><a class="genric-btn success radius" href="#">수정 완료</a></center>
      	</div>
	</div>
</form>
					
					