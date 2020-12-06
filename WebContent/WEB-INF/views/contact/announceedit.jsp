<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<hr style="margin-top:12px;">


    <form class="form-contact">
        <div class="row">
	        <div class="col">
	        	<!-- <span>Main Setting</span> 
				<div class="primary-checkbox">
					<input type="checkbox" id="default-checkbox"  style="display: inline;">
					<label for="default-checkbox"></label>
				</div> -->

				 <c:if test="${announcedto.aifmain == 'true'}">
					<p>
						<input type="checkbox" id="confirm-checkbox" checked>
						<label for="confirm-checkbox"></label>
						메인 공지 지정<br/>	
					</p>
				</c:if>
				<c:if test="${announcedto.aifmain == 'false'}">
					<p>
						<input type="checkbox" id="confirm-checkbox">
						<label for="confirm-checkbox"></label>
						메인 공지 지정<br/>	
					</p>
				</c:if> 
	         </div>
	         <div class="col"></div>
	         <input class="form-control" name="ano" id="ano" type="hidden" value="${announcedto.ano}">
	    </div>
	    <p></p>
	    <div class="row">
	         <div class="col-12">
	             <div class="form-group">
	                 <input class="form-control" name="atitle" id="atitle" type="text" value="${announcedto.atitle}">
	             </div>
	             <span id="atitleError" style="color:#CC3300;"></span>
	         </div>
	         <div class="col-12">
	             <div class="form-group">
	                 <textarea name="acontent" id="acontent" style="width: 100%;">
	                 	${announcedto.acontent}
	                 </textarea>
	             </div>
	             <span id="acontentError" style="color:#CC3300;"></span>
	         </div>
	            
	         <div class="col-sm-12">
	             <div class="form-group">
	                 <input class="form-control valid" name="memail" id="memail" type="email" value="${announcedto.memail}" readonly>                                        
	             </div>
	         </div>
            
        </div>
	        <div class="col-sm-12">
	            <a style="width: 100%" href="javascript:editform()" class="button button-contactForm boxed-btn">COMPLETED</a>
	        </div>
	        <div class="col-sm-12">
	            <a style="width: 100%" href="javascript:back(${announcedto.ano})" class="button button-contactForm boxed-btn">BACK</a>
	        </div>
        <div class="col-sm-12">
        	 <span id="contact_result" style="text-align:center; color:#CC3300;"></span>
        </div>
    </form>
    <script type="text/javascript">
    	function back(ano){
    		$("#inquiry").show();
    		$("#write").show();
    		announcedetail(ano);
    	}
        function editform(){
        	
        if($("#confirm-checkbox").prop("checked")){
        	var aifmain = 'true';
        }else{
        	var aifmain = 'false';
        }
        var ano = $("#ano").val().trim();
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
	       		url:"announceeditform",
	       		method:"post",
	       		data:{ano:ano, atitle:atitle, acontent:acontent, aifmain:aifmain},
	       		success:function(data){
	       			if(data.result == "success") {
	       				location.href = "<%=application.getContextPath()%>/contact/contact";
	       				
					}
	       		}
	       	});
	  	}
	</script>

<script
	src="${pageContext.request.contextPath}/resources/js/ckeditorAn.js"></script>
	



					