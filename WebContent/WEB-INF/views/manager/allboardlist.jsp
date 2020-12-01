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
			$("#setting_result").html(data);
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
			$("#setting_result").html(data);
		}
	});
	
}

</script>
<h2 style="color: #2d2d2d; display:inline;">게시글 관리</h2>

<hr style="margin-top:12px;">
	<div class="container">
		<form method="post" id="searchboard" >
			<div class="row">
				<div class="col-md-2" style="padding: 10px;">
					<div class="form-select">
						<select name="value" id="value" style="padding: 8px;">
							<option value="btitle" selected>title</option>
							<option value="bcontent">content</option>
							<option value="memail">writer</option>
						</select>
					</div>
					
				</div>
				<div class="col-md-8" style="padding: 10px;">
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


	<table style="text-align:center; width: 90%">
		<colgroup>
			<col width="5%">
			<col width="15%">
			<col width="35%">
			<col width="20%">
			<col width="20%">
			<col width="5%">
		</colgroup>
		<thead>
			<tr style="background-color:#FBF9FF;">
				<th scope="col">no</th>
				<th scope="col">category</th>
				<th scope="col">title</th>
				<th scope="col">writer</th>
				<th scope="col">date</th>
				<th scope="col"><i class="fa fa-trash" aria-hidden="true"></i></th>
			</tr>
		</thead>
			<c:forEach var="board" items="${list}">
				<tr style="border-spacing: 5px;">
					<td>${board.bno}</td>
					<td>${board.ccontent}</td>
					<td><a href="<%=application.getContextPath()%>/blog/blog_details?bno=${board.bno}">${board.btitle}</a></td>
					<td>${board.memail}</td>
					<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
					<td><a href="javascript:boarddelete(${board.bno})"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
				</tr>	
			</c:forEach>
			
		
			<tr>
				<td colspan="5" style="text-align:center;">
					<a class="genric-btn primary-border small" href="javascript:allboardlist(1)">처음</a>
					
					<c:if test="${pager.groupNo >1}">
						<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.startPageNo-1})">이전</a>
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
						<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.endPageNo+1})">다음</a>
					</c:if>
					<a class="genric-btn primary-border small" href="javascript:allboardlist(${pager.totalPageNo})">맨끝</a>
					
				</td>
			</tr>
			<tr>
			</tr>
		
	</table>
		

	



					