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

function inquiryaftercomplete() {
	$("#afterresult").toggle();
	
	
}

/* function inquirybeforecomplete(pageNo) {
	if(!pageNo) {
		pageNO = 1;
	}
	$.ajax({
		url : "inquirybeforecomplete",
		data : {pageNo:pageNo},
		success : function(data) {
			$("#beforeview").html(data);
		}
	});
} */
</script> 



<h2 style="color: #2d2d2d; display:inline;">문의사항 관리</h2>

<hr style="margin-top:12px;">

<div class="container">	
	<div class="row">
		<div class="col">
			<ul class="list-group">
				<li class="list-group-item list-group-item-light">
					<a href="#" onclick="buttonbefore()"><i class="fa fa-list" aria-hidden="true"></i>&nbsp;&nbsp;처리대기중</a>
				</li>	
				<li class="list-group-item list-group-item-light"><!-- ajax사용해서 listresult에 결과값 받기 -->
					<a href="javascript:inquiryaftercomplete()"><i class="fa fa-list" aria-hidden="true"></i>&nbsp;&nbsp;처리완료</a></li>
					<div id="afterview"></div>	

			</ul>
			<div id="beforeview" style="display: none;"><jsp:include page="<%=application.getContextPath()%>/views/manager/inquirybeforecomplete.jsp"/></div>
		</div>
	</div>
	
	<p></p>

</div>

	



					