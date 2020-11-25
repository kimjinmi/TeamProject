<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<script>
	var loadFile = function(event){
		var output = document.getElementById('id_view');
		output.src = URL.createObjectURL(event.target.files[0]);
	};
</script>
<h2 style="color: #2d2d2d; display:inline;">프로필 사진 설정</h2>


<hr style="margin-top:12px;">
	

           
  	<div class="row">
	   	<div class="col-2">프로필 사진</div>
	   	
	   	<div class="col-5">
	              	<%-- <img src="<%=application.getContextPath()%>/resources/images/unnamed.jpg" alt="" width="200" height="200"> --%>
			<img id="id_view" width="200" height="200" src="photodownload?fileName=${member.mmyimage}"/>
		</div>
		<div class="col-5">

			<br/><br/>
			프로필 이미지는 ~~~~~
		</div>
    </div>
    <p></p>
    <div class="row">
    
     	<div class="col-2"></div>
     	<div class="col">
     		<form method="post" action="photoenroll" enctype="multipart/form-data" style="display: inline;">
	     		<input type="file" name="mphotoAttach" id="mphotoAttach" onchange="loadFile(event)"/><br><p></p>
	    		<input class="genric-btn success radius" type="submit" value="등록"/>
    		</form>
    		<a class="genric-btn success radius" href="photodelete">삭제</a>
    	</div>
     </div>
      		
      	
	

					
					