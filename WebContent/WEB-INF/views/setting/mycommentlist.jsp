<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>


			<h2 style="color: #2d2d2d;">댓글관리</h2>
			<hr/ style="margin-top:12px;">

		<div class="container">
			
		      <div class="row">
		      	<div class="col-md-6"></div>
		            <div class="col-md-3">
		            	<div class="allCheck">
		            		<label for="allCheck">댓글 전체 선택 <input type="checkbox" name="allCheck" id="allCheck" ></label>
		            		
		            		<script type="text/javascript">
							$("#allCheck").click(function() {
								var chk = $("#allCheck").prop("checked");
								if(chk) {
									$(".chBox").prop("checked", true);
								} else {
									$(".chBox").prop("checked", false);
								}
							});
		            		</script>
		            		
		            	</div> 	
		            </div>	          
		      	     <div class="col-md-3">
		            	<div class="delBtn">
		           			<button type="button" class="genric-btn primary radius selectDelete_btn">선택 삭제</button>
		           			
		           			<script>
							$(".selectDelete_btn").click(function() {
								var confirm_val = confirm("정말 삭제하시겠습니까?");

								if(confirm_val) {
									var checkArr = new Array();

									$("input[class='chBox']:checked").each(function() {
										checkArr.push($(this).attr("id"));
									});

									$.ajax({
										url : "deleteReply",
										type : "post",
										data : {chbox:checkArr},
										success : function(data) {
											if(data.result == "success") {
												mycommentlist();
											}
										}
									});
								}
							});
		           			</script>
		           		</div>
		            </div>
		 	   </div>
			</div>
    	
        	<div class="blog_details">
	        	<div class="container" style="background-color: #fbf9ff; padding:30px;">
		         	<c:forEach var="replyList" items="${replyList}">  	
			         	<div class="row">
			              <div class="col-sm-1">
			              	<div class="checkBox">
			              		<label for="chBox"><input type="checkbox" id="${replyList.rno}" name="chBox" class="chBox"></label>
			              		
			              		<script>
								$(".chBox").click(function() {
									$("#allCheck").prop("checked", false)
								});
			              		</script>
			             	</div>
			              </div>
			              <div class="col-sm-11">
				              <a class="d-inline-block" href="<%=application.getContextPath()%>/blog/blog_details?bno=${replyList.bno}">
				                <h2 class="blog-head" style="color: #2d2d2d;">${replyList.btitle}</h2>  
				              </a>
				              <ul class="blog-info-link">
				              	 <li><a href="#"><i class="fa fa-file"></i>${replyList.rcontent}</a></li>
				              	 <li><a href="#"><i class="fa fa-file"></i>${replyList.memail}</a></li>  
				                 <li><a href="#"><i class="fa fa-calendar"></i>
				                 <fmt:formatDate value="${replyList.rdate}" pattern="yyyy-MM-dd HH:mm:ss" /></a></li>  
				              </ul>
			              </div>
			             </div>
			             <p></p>
		             </c:forEach>  
		             <div class="row" style="text-align: center;">
			             <div class="col"><a class="genric-btn default" href="javascript:mycommentlist(1)">처음</a> </div>
			             <c:if test="${pager.groupNo > 1}">
			             	<div class="col">
				             	<a class="genric-btn default" href="javascript:mycommentlist(${pager.startPageNo - 1})">이전</a>
							</div>
						 </c:if>
						 <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				             <c:if test="${pager.pageNo == i}">
							 	<div class="col">
							 		<a class="genric-btn primary" href="javascript:mycommentlist(${i})">${i}</a>
							 	</div>
							 </c:if>
							 <c:if test="${pager.pageNo != i}">
							 	<div class="col">
									<a class="genric-btn default" href="javascript:mycommentlist(${i})">${i}</a>
								</div>
							 </c:if>
			             </c:forEach> 
			             <c:if test="${pager.groupNo < pager.totalGroupNo}">
				             <div class="col">
				             <a class="genric-btn default" href="javascript:mycommentlist(${pager.endPageNo + 1})">다음</a>
				             </div>
				         </c:if>
				         <div class="col">
				         	<a class="genric-btn default" href="javascript:mycommentlist(${pager.totalPageNo})">맨끝</a>
				         </div>
			         
		             </div>
	            </div>
	        </div>
	        
	        
	 
                               