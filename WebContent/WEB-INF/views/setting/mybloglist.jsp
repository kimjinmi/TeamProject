<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>


			<h2 style="color: #2d2d2d;">게시글관리</h2>
			<hr/ style="margin-top:12px;">

		<div class="container">
			
		      <div class="row">
		      	<div class="col-md-9"></div>
		           <div class="col-md-3">
		           	<div class="allCheck">
		           		<label for="allCheck">전체 선택<input type="checkbox" name="allCheck" id="allCheck"></label>
		           		
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
		           		<button type="button" class="selectDelete_btn">선택 삭제</button>
		           	</div>
		           	  
		           		 <script>
							$(".selectDelete_btn").click(function() {
								var confirm_val = confirm("정말 삭제하시겠습니까?");

								if(confirm_val) {
									var checkArr = new Array();

									$("input[class='chBox']:checked").each(function() {
										checkArr.push($(this).attr("id"));
									});
									
									console.log(checkArr);

									$.ajax({
										url : "deleteBlog",
										type : "post",
										data : {chbox:checkArr},
										success : function(data) {
											if(data.result == "success") {
												mybloglist();
											}
										}
									});
								}
							}); 
		           		 </script>
		           	 
		           </div>
		      </div>
		    </div>

    	
        	<div class="blog_details">
	        	<div class="container" style="background-color: #fbf9ff; padding:30px;">
		         	<c:forEach var="blogList" items="${blogList}">  	
			         	<div class="row">
			              <div class="col-sm-1">
			              	<div class="checkBox">
			              		<label for="chBox"><input type="checkbox" id="${blogList.bno}" name="chBox" class="chBox"></label>
			              		
			              		<script>
		              			 $(".chBox").click(function(){
		              		 		 $("#allCheck").prop("checked", false)
		              		 	  });
			              		</script>
			              		
			              		
			              	</div>
			              </div>
			              <div class="col-sm-11">
				              <a class="d-inline-block" href="<%=application.getContextPath()%>/blog/blog_details?bno=${blogList.bno}"><!-- 여기다가 글 클릭시 연결되는 링크 작성하기 -->
				                <h2 class="blog-head" style="color: #2d2d2d;">${blogList.btitle}</h2>  
				              </a>
				              <ul class="blog-info-link">
				              	 <li><a href="#"><i class="fa fa-file"></i> 좋아요 ${blogList.blike}</a></li> 
				              	 <li><a href="#"><i class="fa fa-file"></i> ${blogList.ccontent}</a></li> 
				                 <li><a href="#"><i class="fa fa-calendar"></i>
				                 <fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd HH:mm:ss" /></a>
				                 </li>  
				              </ul>
				              
				              <%-- <div class="delete">
				              	<button type="button" class="delete_${blogList.bno}_btn" data-bno="${blogList.bno}">삭제</button>
				              	
				              	<script>
									 $(".delete_${blogList.bno}_btn").click(function() {
										var confirm_val = confirm("삭제하시겠습니까?");

										if(confirm_val) {
											var checkArr = new Array();
											checkArr.push($(this).attr("data-bno"));
											console.log(checkArr);
											$.ajax({
												url : "deleteBlog",
												type : "post",
												data : {chbox:checkArr},
												success : function(result) {

													if(result == 1) {
														mybloglist();
													} else {
														alert("삭제 실패");
													}
												}
											});
										}	
									});
				              	</script>
				              </div> --%>
			              </div>
			             </div>
			             <p></p>
		             </c:forEach>  
		             <div class="row">
			             <div class="col"><a class="genric-btn default" href="javascript:mybloglist(1)">처음</a> </div>
			             <c:if test="${pager.groupNo > 1}">
			             	<div class="col">
				             	<a class="genric-btn default" href="javascript:mybloglist(${pager.startPageNo - 1})">이전</a>
							</div>
						 </c:if>
						 <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				             <c:if test="${pager.pageNo == i}">
							 	<div class="col">
							 		<a class="genric-btn primary" href="javascript:mybloglist(${i})">${i}</a>
							 	</div>
							 </c:if>
							 <c:if test="${pager.pageNo != i}">
							 	<div class="col">
									<a class="genric-btn default" href="javascript:mybloglist(${i})">${i}</a>
								</div>
							 </c:if>
			             </c:forEach> 
			             <c:if test="${pager.groupNo < pager.totalGroupNo}">
				             <div class="col">
				             <a class="genric-btn default" href="javascript:mybloglist(${pager.endPageNo + 1})">다음</a>
				             </div>
				         </c:if>
				         <div class="col">
				         	<a class="genric-btn default" href="javascript:mybloglist(${pager.totalPageNo})">맨끝</a>
				         </div>
			         
		             </div>
	            </div>
	        </div>
	        
	        
	 
	 <%--  <%-- <div><a>${pager.murl}</a></div> 
	  <div class="blog_details">
	 	 <div class="container" style="background-color: #fbf9ff; padding:30px;">
		<a class="genric-btn default"
			href="javascript:mybloglist(1)">처음</a> 
			<c:if test="${pager.groupNo > 1}">
				<a class="genric-btn default"
					href="javascript:mybloglist(${pager.startPageNo - 1})">이전</a>
			</c:if> 
			<c:forEach var="i" begin="${pager.startPageNo}"	end="${pager.endPageNo}">
				<c:if test="${pager.pageNo == i}">
					<a class="genric-btn linkgenric-btn default"
						href="javascript:mybloglist(${i})">${i}</a>
				</c:if>
				<c:if test="${pager.pageNo != i}">
					<a class="genric-btn default"
						href="javascript:mybloglist(${i})">${i}</a>
				</c:if>
			</c:forEach> 
			<c:if test="${pager.groupNo < pager.totalGroupNo}">
				<a class="genric-btn default"
					href="javascript:mybloglist(${pager.endPageNo + 1})">다음</a>
			</c:if> <a class="genric-btn default" href="javascript:mybloglist(${pager.totalPageNo})">맨끝</a></td>
		</tr>  --%>
		
	
 