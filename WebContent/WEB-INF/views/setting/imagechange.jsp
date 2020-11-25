<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<h2 style="color: #2d2d2d; display:inline;">프로필 사진 설정</h2>


<hr style="margin-top:12px;">
	
<form action="#">
           
  	<div class="row">
	   	<div class="col-2">프로필 사진</div>
	   	
	   	<div class="col-5">
	              	<%-- <img src="<%=application.getContextPath()%>/resources/images/unnamed.jpg" alt="" width="200" height="200"> --%>
			<img width="200" height="200" src="photodownload?fileName=${member.mmyimage}"/>
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
     		<input type="file" id="attach" name="attach">
    		<a class="genric-btn success radius" href="javascript:photoenroll()">등록</a>
    	<a class="genric-btn success radius" href="javascript:photodelete()">삭제</a></div>
     </div>
      		<!-- <script type="text/javascript">
				function photodelete(){
					$.ajax({
						url:"photodelete",
						success:function(data) {
							$("#setting_result").html(data);
						}
					});
					
				}
				
				function photoenroll(){
					var file = $("#attach")[0];
					var multipart = new FormData();
					if(file.files.length != 0){
						//사용자가 파일을 선택했을 경우(여러개의 파일을 선택할 수 있기때문에 첫번째 것만 선택)
						//여러개의 파일을 선택했으면 배열로 받아야함
						multipart.append("attach", file.files[0]);
					}
					
					$.ajax({
						url:"photoenroll",
						method : "post",
						cache : false, //파일을 메모리에 저장하지 않기
						processData : false, //파일을 가공하지 않도록 설정
						contentType : false, //요청 헤더에 content-Type을 추가하지 않도록 설정
						success:function(data) {
							$("#setting_result").html(data);
						}
					});
					
				}
			
			</script> -->
      	
	
</form>
					
					