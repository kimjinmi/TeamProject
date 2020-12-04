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
<script type="text/javascript">

function searchboardfirst(pageNo){
	if(!pageNo){
		pageNo = 1;
	}
	var value = $("#value").val();
	var search = $("#search").val();
	$.ajax({
		url:"searchboard",
		data:{value:value,search:search,pageNo:pageNo},
		success:function(data){
			$("#tableresult").html(data);
		}
	});
	
}
function searchboard(pageNo,value,search){
	if(!pageNo){
		pageNo = 1;
	}
	$.ajax({
		url:"searchboard",
		data:{value:value,search:search,pageNo:pageNo},
		success:function(data){
			$("#tableresult").html(data);
		}
	});
	
}
function allreplylist(pageNo){
	if(!pageNo){
		pageNo = 1;
	}
	$.ajax({
		url:"allreplylist",
		data:{pageNo:pageNo},
		success:function(data) {
			$("#tableresult").html(data);
		}
	});
	
}
</script>
<div id="tableresult">
	<u><h2 style="color: #2d2d2d; display:inline;"><a href="javascript:allboardlist()">게시글 관리</a></h2></u>/
	<h2 style="color: #2d2d2d; display:inline;"><a href="javascript:allreplylist()">댓글 관리</a></h2>
	
	<hr style="margin-top:12px;">
		
		<div class="container">
			<div style="background-color:#FBF9FF; height: 30px; text-align: center;" class="row">
					<div class="col col-md-2"><b>category</b></div>
					<div class="col col-md-4"><b>title</b></div>
					<div class="col col-md-3"><b>blogwriter</b></div>
					<div class="col col-md-2"><b>date</b></div>
					<div class="col col-md-1"><i class="fa fa-trash" aria-hidden="true"></i></div>
			</div>
			<hr>
			<c:forEach var="board" items="${list}">
				<div class="row">
					<div class="col-md-2">${board.ccontent}</div>
					<div class="col-md-4"><a href="<%=application.getContextPath()%>/blog/blog_details?bno=${board.bno}">${board.btitle}</a></div>
					<div class="col-md-3">${board.memail}</div>
					<div class="col-md-2"><fmt:formatDate value="${board.bdate}" pattern="yy.MM.dd" /></div>
					<div class="col-md-1"><a href="javascript:boarddelete(${board.bno})"><i class="fa fa-trash" aria-hidden="true"></i></a></div>
				</div>
				<hr>
			</c:forEach>
			
		
			<div style="text-align:center;" class="row">
				<div class="col">
					<a class="genric-btn primary-border small" href="javascript:allboardlist(1)"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
					
					<c:if test="${pager.groupNo >1}">
						<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.startPageNo-1})"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
					</c:if>
				
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo == i}">
							<a class="genric-btn primary small" href="javascript:allboardlist(${i})">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo != i}">
							<a class="genric-btn primary-border small" href="javascript:allboardlist(${i})">${i}</a>
						</c:if>
					</c:forEach>
				
					<c:if test="${pager.groupNo <pager.totalGroupNo}">
						<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.endPageNo+1})"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
					</c:if>
					<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.totalPageNo})"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
				</div>
			</div>	
	</div>
</div>
	<div style="height: 10px;"></div>
	<div class="container">
		<form method="post" id="searchboard" >
			<div class="row">
				<div class="col-md-3" style="padding: 10px;">
					<div class="form-select">
						<select name="value" id="value" style="padding: 8px;">
							<option value="ccontent">category</option>
							<option value="btitle">title</option>
							<option value="bcontent">content</option>
							<option value="b.memail">blogwriter</option>
						</select>
					</div>
					
				</div>
				<div class="col-md-7" style="padding: 10px;">
					<input type="text" id="search" name="search" placeholder="Search" onblur="this.placeholder = 'Search'"class="single-input" >
				</div>
				<div class="col-md-2" style="padding: 10px;">
					<a href="javascript:searchboardfirst()"><i class="fa fa-search" aria-hidden="true"></i></a>
				</div>
			</div>
		</form>
	</div>
		<script type="text/javascript">
		
		</script>
	
	<p></p>
		

	



					