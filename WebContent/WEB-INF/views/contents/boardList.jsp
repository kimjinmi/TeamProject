<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<c:forEach var="board" items="${list}">
	<div class="col-lg-12 col-md-12 col-sm-12"
		style="border-bottom: 1px solid #E7E7E7; padding-bottom: 2%;">
		<a href="javascript:boardDetails(${board.bno})" class="box_desc box_desc_type"> <!-- 게시물 이미지 -->
			<script type="text/javascript">
				function boardDetails(bno) {
					location.href = "<%=application.getContextPath()%>/blog/blog_details?bno=" + bno;
				}
			</script>
			<div class="img_thumb">
				<img class="thumb_g" src="photodownload_board?fileName=${board.bimage}" />
			</div> <!-- 게시물 타이틀, 내용 -->
			<div class="wrap_cont">
				<div class="wrap_data">
					<dl class="list_data">
						<dt class="screen_out">카테고리</dt>
						<dd class="ddcss ddcss1" style="margin-bottom: 3%">${board.ccontent}</dd>
					</dl>
					<dl class="list_data" style="margin-bottom: 0px">
						<dt class="screen_out">게시된 시간</dt>
						<dd class="ddcss">2시간전</dd>
					</dl> 
					<dl class="list_data">
						<dt style="color: #909090; font-size: 13px; display: inline;">좋아요</dt>
						<dd class="ddcss" style="display: inline;">${board.blike}</dd>
					</dl>
				</div>
			</div>
			<div>
				<strong class="desc_tit"> ${board.btitle } </strong>
				<p class="desc_g">${board.bcontent}</p>
			</div>
			<div class="info_g">
				<!-- 사용자 이미지 -->
				<span class="wrap_thumb"> <img class="thumb_profile"
						src="photodownload_member?fileName=${board.mmyimage}">
				</span> <span class="txt_id">${board.mintro}</span> <span class="txt_date">by
					${board.mnickname}</span>
			</div>
		</a>
	</div>
</c:forEach>
