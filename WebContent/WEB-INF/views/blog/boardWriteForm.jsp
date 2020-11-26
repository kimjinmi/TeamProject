<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<form id="boardWriteForm">
	<div class="single-post">
		<div class="blog_write">
			<h3 style="color: #2d2d2d;">게시글 작성</h3>
			<hr style="margin-top: 12px;">
			<!-- 카테고리 선택 시작 (div) -->
			<div class="select box" id="default-select"
				style="display: inline-block; padding-bottom: 2%;">
				<select id="cno" name="cno">
					<c:forEach var="i" items="${category_list}">
						<option value="${i.cno}">${i.ccontent}</option>
					</c:forEach>
				</select>
			</div>
			<!-- 카테고리 선택 끝 (div) -->

			<!-- 제목 입력 시작 (board.btitle) -->
			<div class="input-group mb-3">
				<input id="btitle" type="text" name="btitle" class="form-control"
					placeholder='  제목' onfocus="this.placeholder = ''"
					onblur="this.placeholder = '  제목'"
					style="height: 45px; font-size: 16px;">
				<span id="btitleError" class="error"></span> 
			</div>
			<!-- 제목 입력 끝 (board.btitle) -->

			<!-- 작성자 입력 시작 (board.mnickname) -->
			<div class="input-group mb-3">
				<input id="memail" type="text" name="memail" class="form-control"
					style="height: 45px; font-size: 16px;"
					<c:if test="${sessionMemail!=null}">value="${sessionMemail}"</c:if>
					<c:if test="${sessionMemail==null}">value="세션 연결좀ㅋ"</c:if>
				readonly>
			</div>
			<!-- 작성자 입력 끝 (board.mnickname) -->
			<hr />

			<!-- 내용 입력 시작 (board.bcontent) -->
			<h2 style="color: #2d2d2d;">내용</h2>
			<textarea id="bcontent" name="bcontent" style="width: 100%; height: 800px;"></textarea>
			<span id="bcontentError" class="error"></span>
			<!-- 내용 입력 끝 (board.bcontent) -->
		</div>
	</div>

	<div class="navigation-top">

		<div class="d-sm-flex justify-content-between text-center">
			<span class="align-middle"> <i class="fa fa-link"
				aria-hidden="true"></i>
			</span>
			<!-- 홍보링크 입력 시작 -->
			<div class="input-group mb-3">
				<input id="blinkcontent" name="blinkcontent" type="text" class="form-control"
					style="font-size: 12px; margin: 0px 8px;"
					placeholder='홍보할 링크를 입력하세요' onfocus="this.placeholder = ''"
					onblur="this.placeholder = '홍보할 링크를 입력하세요'">
			</div>
			<!-- 홍보링크 입력 끝 -->

			<!-- 홍보링크 블록 추가 -->
			<span class="align-middle"> <a class="fa fa-plus"
				aria-hidden="true" href="https://www.naver.com" style="color: black">
			</a>
			</span>
		</div>

		<!-- 글쓰기 버튼 시작 (확인) -->
		<div style="margin-top: 12px; padding-left: 35%; margin: 20px 0px;">
			<a href="javascript:boardWrite()"
				class="genric-btn info-border radius" style="margin-right: 20px;">확인</a>
			<script type="text/javascript">
				function boardWrite() {
					var cno = $("#cno").val();
					
					var btitle = $("#btitle").val().trim();
					if(btitle==""){$("#btitleError").text("필수");}
					else { $("#btitleError").text("");} 

					var bcontent = $("#bcontent").val().trim();
					if(bcontent == "") { $("#bcontentError").text("필수"); }
					else { $("#bcontentError").text(""); }

					if (btitle == "" || bcontent == "") {
						return;
					} 
					
					var blinkcontent = $("#blinkcontent").val().trim();
					var memail = $("#memail").val().trim();

					$.ajax({
						url : "boardWrite",
						method : "post",
						data : {
							btitle : btitle,
							bcontent : bcontent,
							memail : memail,
							blinkcontent : blinkcontent,
							cno : cno
						},
						success : function(data) {
							if (data.result == "success") {
								location.href="blog?UserUrl=${SessionMurl}";
							}
						}
					});
				}
			</script>
			<a href="blog" class="genric-btn danger-border radius">취소</a>
		</div>
		<!-- 글쓰기 버튼 끝 (확인) -->
	</div>
</form>
