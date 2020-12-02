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
function searchboarddelete(bno,value,search){
	$.ajax({
		url:"boarddelete",
		data:{bno:bno,value:value,search:search},
		success:function(data){
			if(data.result == "success"){
				searchboard(1,value,search);
			}
		}
	});
}


</script>
<h2 style="color: #2d2d2d; display:inline;">게시글 관리</h2>

<hr style="margin-top:12px;">
	<div class="container">
		<form method="post" id="searchboard">
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
			<tr>
				<td colspan="5" style="text-align:center;">
					<b>"${searchvalue}"에서 "${searchdto.search}"검색 결과 :<br></b>
					<b>총 <u>${totalRows}</u>개의 게시물이 존재합니다.</b><br>
					<a href="javascript:allboardlist()">전체보기<i class="fa fa-search" aria-hidden="true"></i></a>
				</td>
			</tr>
			<c:forEach var="board" items="${list}">
				<tr style="border-spacing: 5px;">
					<td>${board.bno}</td>
					<td>${board.ccontent}</td>
					<td><a href="<%=application.getContextPath()%>/blog/blog_details?bno=${board.bno}">${board.btitle}</a></td>
					<td>${board.memail}</td>
					<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
					<td><a href="javascript:searchboarddelete(${board.bno},'${searchdto.value}','${searchdto.search}')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
				</tr>	
			</c:forEach>
			
		
			<tr>
				<td colspan="5" style="text-align:center;">
					<c:if test="${totalRows != 0}">
						<a class="genric-btn primary-border small" href="javascript:searchboard(1,'${searchdto.value}','${searchdto.search}')">처음</a>
						
						<c:if test="${pager.groupNo >1}">
							<a class="genric-btn primary-border small" href="javascript:searchboard(${pager.startPageNo-1},'${searchdto.value}','${searchdto.search}')">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo == i}">
								<a class="genric-btn primary small" href="javascript:searchboard(${i},'${searchdto.value}','${searchdto.search}')">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo != i}">
								<a class="genric-btn primary-border small" href="javascript:searchboard(${i},'${searchdto.value}','${searchdto.search}')">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pager.groupNo <pager.totalGroupNo}">
							<a class="genric-btn primary-border small" href="javascript:searchboard(${pager.endPageNo+1},'${searchdto.value}','${searchdto.search}')">다음</a>
						</c:if>
						<a class="genric-btn primary-border small" href="javascript:searchboard(${pager.totalPageNo},'${searchdto.value}','${searchdto.search}')">맨끝</a>
					</c:if>	
				</td>
			</tr>
			<tr>
			</tr>
		
	</table>
		

	



					