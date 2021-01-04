<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>

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
	<u><h2 style="color: #2d2d2d; display:inline;"><a href="javascript:allboardlist()">게시글 관리</a></h2></u>/
	<h2 style="color: #2d2d2d; display:inline;"><a href="javascript:allreplylist()">댓글 관리</a></h2>

<hr style="margin-top:12px;">
	<div class="container">
			<div style="background-color:#FBF9FF; height: 30px; text-align: center;"  class="row">
					<div class="col col-md-2"><b>category</b></div>
					<div class="col col-md-4"><b>title</b></div>
					<div class="col col-md-3"><b>blogwriter</b></div>
					<div class="col col-md-2"><b>date</b></div>
					<div class="col col-md-1"><i class="fa fa-trash" aria-hidden="true"></i></div>
			</div>
			<hr>
			<div class="row">
				<div class="col" style="text-align: center;">
					<b>"${searchvalue}"에서 "${searchdto.search}"검색 결과 :<br></b>
					<b>총 <u>${totalRows}</u>개의 게시물이 존재합니다.</b><br>
					<a href="javascript:allboardlist()">전체게시글보기<i class="fa fa-search" aria-hidden="true"></i></a>
				</div>
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
					<c:if test="${totalRows != 0}">
						<a class="genric-btn primary-border small" href="javascript:searchboard(1,'${searchdto.value}','${searchdto.search}')"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
						
						<c:if test="${pager.groupNo >1}">
							<a class="genric-btn primary-border small" href="javascript:searchboard(${pager.startPageNo-1},'${searchdto.value}','${searchdto.search}')"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
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
							<a class="genric-btn primary-border small" href="javascript:searchboard(${pager.endPageNo+1},'${searchdto.value}','${searchdto.search}')"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
						</c:if>
						<a class="genric-btn primary-border small" href="javascript:searchboard(${pager.totalPageNo},'${searchdto.value}','${searchdto.search}')"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
					</c:if>	
				</div>
			</div>
	</div>
		

	



					
