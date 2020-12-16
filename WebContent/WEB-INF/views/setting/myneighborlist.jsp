<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function nDelete(nno) {
		$.ajax({
			url:"nDelete",
			data:{nno:nno},
			method:"post",
			success:function(data) {
				if(data.result == "success") {
					myneighborlist();
				}
			}
		});
	}
</script>
<h2 style="color: #2d2d2d; ">My Neighborhood List</h2>
<hr/ style="margin-top:15px;">
	


                   <!-- 1 -->
<div class="blog_details" style="padding-top: 0;">
	<div class="container"
		style="background-color: #fbf9ff; padding: 30px;">
		<c:forEach var="list" items="${list}">
			<div class="row" style="padding-bottom: 20px;'">
				<div class="col-sm-3" style="padding-top: 25px; padding-left: 50px;">
					<img src="photodownload?fileName=${list.mmyimage}" alt=""
						width="100" height="100" class="rounded-circle">
				</div>
				<div class="col-sm-9">
					<a class="d-inline-block"
						href="<%=application.getContextPath()%>/blog/blog?UserUrl=${list.nemurl}">
						<h2 class="blog-head" style="color: #FF1493; font-weight: bolder;">${list.mnickname}</h2>
					</a>
					<p></p>
					<ul class="blog-info-link" style="padding-top: 0px; padding-bottom: 15px;">
						<li><a
							href="<%=application.getContextPath()%>/blog/blog?UserUrl=${list.nemurl}"
							style="color: #FF73BE;"><i class="fas fa-map-marker-alt"></i>
								내 이웃 주소 : ${list.nememail}</a></li>

					</ul>
					<ul class="blog-info-link" style="padding-top: 5px; padding-bottom: 15px;">
						<li><a href="#" style="color: #FF7DC8;"><i
								class="fa fa-calendar"></i> 우리가 이웃이 시작된 날 : <fmt:formatDate
									value="${list.ndate}" pattern="yyyy년 MM월 dd일, HH시" /></a></li>
					</ul>

					<ul class="blog-info-link" style="padding-top: 5px;">
						<li><a href="javascript:nDelete(${list.nno})"
							style="color: #EE0000; font-weight: bolder;"> <i
								class="fa fa-minus-square"></i>이웃 삭제
						</a></li>
					</ul>
				</div>
			</div>
			<hr style="border: 1px solid silver;"></hr>
		</c:forEach>
		<div style="text-align: center;"><a
				class="genric-btn primary-border radius btn-md" 
				href="javascript:myneighborlist(1)">처음</a> 
				<c:if test="${pager.groupNo > 1}">
					<a class="genric-btn primary-border radius btn-md"
						href="javascript:myneighborlist(${pager.startPageNo-1})">이전</a>
				</c:if> 
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo == i}">
						<a class="genric-btn primary radius btn-md"
							href="javascript:myneighborlist(${i})">${i}</a>
					</c:if>

					<c:if test="${pager.pageNo != i}">
						<a class="genric-btn primary-border radius btn-md"
							href="javascript:myneighborlist(${i})">${i}</a>
					</c:if>
				</c:forEach> 
				<c:if test="${pager.groupNo < pager.totalGroupNo}">
					<a class="genric-btn primary-border radius btn-md"
						href="javascript:myneighborlist(${pager.endPageNo+1})">다음</a>
				</c:if> <a class="genric-btn primary-border radius btn-md"
				href="javascript:myneighborlist(${pager.totalPageNo})">맨끝</a>
		</div>
	</div>
</div>

<!-- 2 -->
