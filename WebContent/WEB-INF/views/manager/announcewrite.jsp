<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<h2 style="color: #2d2d2d; display:inline;">공지사항 작성</h2>

<hr style="margin-top:12px;">


    <form class="form-contact">
        <div class="row">
	        <div class="col">
	        	<!-- <span>Main Setting</span> 
				<div class="primary-checkbox">
					<input type="checkbox" id="default-checkbox"  style="display: inline;">
					<label for="default-checkbox"></label>
				</div> -->

				<p>
					<input type="checkbox" id="confirm-checkbox">
					<label for="confirm-checkbox"></label>
					메인 공지 지정<br/>	
				</p>
	         </div>
	         <div class="col"></div>
	         
	    </div>
	    <p></p>
	    <div class="row">
	         <div class="col-12">
	             <div class="form-group">
	                 <input class="form-control" name="atitle" id="atitle" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter title'" placeholder="Enter title">
	             </div>
	             <span id="atitleError" style="color:#CC3300;"></span>
	         </div>
	         <div class="col-12">
	             <div class="form-group">
	                 <textarea name="acontent" id="acontent" style="width: 100%; height: 1000px;" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Content'" placeholder=" Enter Content"></textarea>
	             </div>
	             <span id="acontentError" style="color:#CC3300;"></span>
	         </div>
	            
	         <div class="col-sm-12">
	             <div class="form-group">
	                 <input class="form-control valid" name="memail" id="memail" type="email" value="${sessionMemail}" readonly>                                        
	             </div>
	         </div>
            
        </div>
	        <div class="col-sm-12">
	            <a style="width: 100%" href="javascript:contactform()" class="button button-contactForm boxed-btn">WRITE</a>
	        </div>
        <div class="col-sm-12">
        	 <span id="contact_result" style="text-align:center; color:#CC3300;"></span>
        </div>
    </form>
    <script type="text/javascript">
        function contactform(){
        if($("#confirm-checkbox").prop("checked")){
        	var aifmain = 'true';
        }else{
        	var aifmain = 'false';
        }
       	var atitle = $("#atitle").val().trim();
       	if(atitle == "") { $("#atitleError").text("제목필수"); }
		else { $("#atitleError").text(""); }
		        	
       /* 	var acontent = $("#acontent").val().trim(); */
       	var acontent = myEditor.getData();
       	if(acontent == "") { $("#acontentError").text("내용필수"); }
		else { $("#acontentError").text(""); }
		        	
       	var memail = $("#memail").val().trim();

		        	
       	if(atitle == "" || acontent == "") {
			return;	
		} 
		        	
	       	$.ajax({
	       		url:"announcewriteform",
	       		method:"post",
	       		data:{atitle:atitle, acontent:acontent, memail:memail, aifmain:aifmain},
	       		success:function(data){
	       			if(data.result == "success") {
	       				$("#contact_result").text("추가가 완료되었습니다.");
					}
	       		}
	       	});
	  	}
	</script>

<script
	src="${pageContext.request.contextPath}/resources/js/ckeditorAn.js"></script>
	



					