<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<style>
tr, th, td{
padding: 10px;
overflow:hidden;
text-overflow:ellipsis;

}
</style>
<script>
function buttonbefore() {
	$("#beforeview").toggle();
}

function buttonafter() {
	$("#afterview").toggle();	
}	

function buttondetail() {
	$("#detailview").toggle();
}
</script>

<h2 style="color: #2d2d2d; display:inline;">문의사항 관리</h2>

<hr style="margin-top:12px;">


<div id="detailview"></div>
<table style="text-align:center; width: 90%">
	
	 <div id="inquiryBoard" class="col-lg-8 posts-list">
		<div class="single-post">
			<div class="feature-img">
				<img class="img-fluid" src="assets/img/blog/single_blog_1.png"
					alt="">
			</div>
			<div class="inquiry_details">
				<h2 style="color: #2d2d2d;">${inquiryList.isubject}</h2>
				<ul class="blog-info-link mt-3 mb-4" >
					<li><a href="#"><i class="fa fa-user"></i>${inquiryList.iemail}</a></li>
				<!-- 	<li><a href="#"><i class="fa fa-comments"></i> 댓글 3개 </a></li> -->
					<li><i class="fa fa-calendar" style="color: #999999"></i>
						<fmt:formatDate value="${inquiryList.idate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></li>
							</br></br></br>
				</ul>
				<p class="excert">${inquiryList.imessage}</p>
			
			</div>
		</div>
	</div>
	
</table>
<a class="genric-btn primary small" href="javascript:inquirylist()" style="margin-left:60%">문의 목록</a>