<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<form id="boardWriteForm" action="boardUpload" enctype="multipart/form-data">
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
			
			<!-- 실험 -->
			<div class="input-group mb-3" style="margin: 3px 0; height: 30px;">
				<div class="input-group-prepend" >
					<span class="input-group-text">메인 사진을 선택해주세요</span>
				</div>
				<input style="height: 30px;" type="file" id="attach" name="attach" class="form-control">
			</div>
			<!-- 실험 -->
			
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
					<c:if test="${sessionMemail==null}">value="세션 연결"</c:if> readonly>
			</div>
			<!-- 작성자 입력 끝 (board.mnickname) -->
			<hr />

			<!-- 내용 입력 시작 (board.bcontent) -->
			<h2 style="color: #2d2d2d;">내용</h2>
			<textarea id="bcontent" name="bcontent"
				style="width: 100%; height: 800px;"></textarea>
			<span id="bcontentError" class="error"></span>
			<!-- 내용 입력 끝 (board.bcontent) -->
		</div>
	</div>

	<div class="navigation-top">

		<div class="d-sm-flex justify-content-between text-center">
			<span class="align-middle"> <i class="fa fa-link  d-none d-sm-block"
				aria-hidden="true"></i>
			</span>
			<!-- 홍보링크 입력 시작 -->
			<div class="input-group mb-3">
				<input id="blinkcontent" name="blinkcontent" type="text"
					class="form-control" style="font-size: 12px; margin: 0px 8px;"
					placeholder='홍보할 링크를 입력하세요' onfocus="this.placeholder = ''"
					onblur="this.placeholder = '홍보할 링크를 입력하세요'">
			</div>
			<!-- 홍보링크 입력 끝 -->
		</div>

		<!-- 글쓰기 버튼 시작 (확인) -->
		<div style="margin: 3% 0px; width: 80%; margin-left: 10%; margin-right: 10%; ">
			<a href="javascript:boardWrite()"
				class="genric-btn primary small" style="margin-right: 5%;">확인</a>
			<script type="text/javascript">
				function boardWrite() {
					var cno = $("#cno").val();

					var btitle = $("#btitle").val().trim();
					if (btitle == "") {
						$("#btitleError").text("제목은 필수로 입력해주세요");
					} else if(btitle.length >= 40){
						$("#btitleError").text("제목은 40자 이하로 작성해주세요");
					} else {
						$("#btitleError").text("");
					}
				

					var bcontent = myEditor.getData();
					/* var bcontent = $("#bcontent").val(data).trim();  */
					if (bcontent == "") {
						$("#bcontentError").text("내용은 필수로 입력해주세요");
					} else {
						$("#bcontentError").text("");
					}

					if (btitle == "" || bcontent == "") {
						return;
					}

					var blinkcontent = $("#blinkcontent").val().trim();
					var memail = $("#memail").val().trim();
					
					
					var file = document.querySelector("#attach");
					var multipart = new FormData();
					
					multipart.append("btitle", btitle);
					multipart.append("bcontent", bcontent);
					multipart.append("cno", cno);
					multipart.append("blinkcontent", blinkcontent);
					multipart.append("memail", memail);
					
					if(file.files.length != 0) {
						// 사용자가 파일을 선택했을 경우
						multipart.append("attach", file.files[0]);
					}else {
						alert('메인 사진은 필수로 등록해주세요.');
					}

					$.ajax({
						url : "boardWrite",
						method : "post",
						data : multipart,
						cache: false, // 파일을 메모리에 저장하지 않도록 설정
						processData: false, // 파일을 가공하지 않도록 설정
						contentType: false, 
						success : function(data) {
							if (data.result == "success") {
								location.href = "blog?UserUrl=${SessionMurl}";
							}
						}
					});
				}
			</script>
			<a href="<%=application.getContextPath()%>/blog/blog?UserUrl=${SessionMurl}" class="genric-btn primary small">취소</a>
		</div>
		<!-- 글쓰기 버튼 끝 (확인) -->
	</div>
</form>
<script
	src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
