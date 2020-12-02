<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d;">좋아요 게시글 보기</h2>
<hr/ style="margin-top:12px;">

<div class="container">
	
      <div class="row">
      	<div class="col-md-9"></div>
           <div class="col-md-3">
           	
           </div> 	          
           <div class="col-md-3">
          	
           	
           </div>
      </div>
    </div>

  	
<div class="blog_details">
<div class="container" style="background-color: #fbf9ff; padding:30px;">
<c:forEach var="blogList" items="${blogList}">  	
<div class="row">
    <div class="col-sm-1">
    <i class="fa fa-heart" aria-hidden="true"></i>	
    </div>
<div class="col-sm-11">
     <a class="d-inline-block" href="<%=application.getContextPath()%>/blog/blog_details?bno=${blogList.bno}"><!-- 여기다가 글 클릭시 연결되는 링크 작성하기 -->
  <h3>게시글 이름</h3>  
</a>
<ul class="blog-info-link">
	 <li><a href="#"><i class="fa fa-file"></i> 작성자</a></li>
	 <li><a href="#"><i class="fa fa-user"></i> 글쓴이</a></li>
   <li><a href="#"><i class="fa fa-calendar"></i>시간
   <fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd HH:mm:ss" /></a>
     </li>  
  </ul>
</div>
</div>
<p></p>
<hr>
</c:forEach>  
</div>
<div style="text-align: center;">
	<a class="genric-btn default" href="javascript:mybloglist(1)"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a> 
	
	<c:if test="${pager.groupNo > 1}">
		<a class="genric-btn default" href="javascript:mybloglist(${pager.startPageNo - 1})"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
	</c:if>
	
	<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		<c:if test="${pager.pageNo == i}">
			<a class="genric-btn primary" href="javascript:mybloglist(${i})">${i}</a>
		</c:if>
		
		<c:if test="${pager.pageNo != i}">
			<a class="genric-btn default" href="javascript:mybloglist(${i})">${i}</a>
		</c:if>
		
	</c:forEach> 
	
	<c:if test="${pager.groupNo < pager.totalGroupNo}">
		<a class="genric-btn default" href="javascript:mybloglist(${pager.endPageNo + 1})"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
	</c:if>
	
	<a class="genric-btn default" href="javascript:mybloglist(${pager.totalPageNo})"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
</div>
	        
	        
	 
	 
		
	
 