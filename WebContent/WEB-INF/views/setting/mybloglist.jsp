<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>


			<h2 style="color: #2d2d2d;">게시글관리</h2>
			<hr/ style="margin-top:12px;">

		<div class="container">
			
		      <div class="row">
		      		<div class="col-md-9"></div>
		           <!-- <div class="col-md-3">게시글 전체 선택 <label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label></div> -->
		           <div class="col-md-3"><a href="#" class="genric-btn danger radius small">게시글 삭제</a></div>
		      </div>
		    </div>

    	
        	<div class="blog_details">
	        	<div class="container" style="background-color: #fbf9ff; padding:30px;">
		         	<c:forEach var="board" items="${list}">  	
			         	<div class="row">
			              <div class="col-sm-1">
			              	<label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label>
			              </div>
			              <div class="col-sm-11">
				              <a class="d-inline-block" href="#"><!-- 여기다가 글 클릭시 연결되는 링크 작성하기 -->
				                <h2 class="blog-head" style="color: #2d2d2d;">${board.btitle}</h2>  
				              </a>
				              <ul class="blog-info-link">
				              	 <li><a href="#"><i class="fa fa-file"></i> 좋아요수 ${board.blike}</a></li> 
				              	 <li><a href="#"><i class="fa fa-file"></i> ${board.ccontent}</a></li> 
				                 <li><a href="#"><i class="fa fa-calendar"></i>
				                 <fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd HH:mm:ss" /></a></li>  
				              </ul>
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
		
	<script type="text/javascript">
			/* function boardList(pageNo) {
				if(!pageNo) {
					pageNo = 1;
				}
				$.ajax({
					url:"boardList",
					data:{pageNo:pageNo},
					success:function(data) {
						$("#setting_result").html(data);
						
						}
					});
				} */
		</script>
 