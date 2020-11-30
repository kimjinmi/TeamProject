<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>


			<h2 style="color: #2d2d2d;">댓글관리</h2>
			<hr/ style="margin-top:12px;">

		<div class="container">
			
		      <div class="row">
		      	<div class="col-md-9"></div>
		           <!-- <div class="col-md-3">게시글 전체 선택 <label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label></div> -->	          
		           <div class="col-md-3">
		              <c:if test="${SessionMurl == reply.murl}">
		           		<input type="button" value="댓글 삭제" class="genric-btn danger radius small"/>
		           		 <script>
						
		           		 </script>
		           	  </c:if>
		           </div>
		      </div>
		    </div>

    	
        	<div class="blog_details">
	        	<div class="container" style="background-color: #fbf9ff; padding:30px;">
		         	<c:forEach var="replylist" items="${list}">  	
			         	<div class="row">
			              <div class="col-sm-1">
			              	<label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox" name="rowcheck"  value="${reply.rno}"></label>
			              </div>
			              <div class="col-sm-11">
				              <a class="d-inline-block" href="#">
				                <h2 class="blog-head" style="color: #2d2d2d;">${replylist.btitle}</h2>  
				              </a>
				              <ul class="blog-info-link">
				              	 <li><a href="#"><i class="fa fa-file"></i>${replylist.rcontent}</a></li>
				              	 <li><a href="#"><i class="fa fa-file"></i>${replylist.memail}</a></li>  
				                 <li><a href="#"><i class="fa fa-calendar"></i>
				                 <fmt:formatDate value="${replylist.rdate}" pattern="yyyy-MM-dd HH:mm:ss" /></a></li>  
				              </ul>
			              </div>
			             </div>
			             <p></p>
		             </c:forEach>  
		             <div class="row">
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
	        
	        
	 
                               