<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


			<h2 style="color: #2d2d2d;">게시글관리</h2>
			<hr/ style="margin-top:12px;">

		<div class="container">
			
		      <div class="row">
		      		<div class="col-md-6">
		             	
				</div>
		           <div class="col-md-3">게시글 전체 선택 <label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label></div>
		           <div class="col-md-3"><a href="#" class="genric-btn danger radius small">게시글 삭제</a></div>
		      </div>
		    </div>

    	
        	<div class="blog_details">
	        	<div class="container" style="background-color: #fbf9ff; padding:30px;">
		         	<div class="row">
		              <div class="col-sm-1">
		              	<label for="confirm-checkbox"><input type="checkbox" id="confirm-checkbox"></label>
		              </div>
		              <div class="col-sm-11">
		              <!-- 포이치 -->
		              	<c:forEach var="board" items="${list}"}>
			              <a class="d-inline-block" href="blog_details.html">
			                <h2 class="blog-head" style="color: #2d2d2d;">${board.btitle}</h2>  
			              </a>
			              <ul class="blog-info-link">
			              	<li><a href="#"><i class="fa fa-file"></i> ${board.blike}</a></li>
			                  <!--<li><a href="#"><i class="fa fa-comments"></i>${board.댓글수}</a></li>-->
			                  <li><a href="#"><i class="fa fa-calendar"></i>${board.bdate}</a></li>
			            </c:forEach>      
			              </ul>
		              </div>
		             </div>
	            </div>
	        </div>
