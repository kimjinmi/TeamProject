<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<span class="align-middle">
		<a id="heart" href="javascript:heartbreaker(${likecount.bno })" class="fa fa-heart" style="color: black;"></a>
	</span>
	<script type="text/javascript">
	
				// LIKE에서 SessionEmail로 해당 BNO로 select 값 조사했을때 값이 0인경우 블랙 아닌 경우 레드
				if( ${heartCheck} > 0){ // 필요한 값 bno, sessionEmail 로 LIKED 테이블 조회
				$("#heart").css("color", "red"); 
				}else{
					$("#heart").css("color", "black");	
				}
			
				// 까지 로그인 유저의 해당 게시글 좋아요 상태확인
				
				function heartbreaker(bno){
						
					$.ajax({
						url: "heartClick",
						method:"post",
						data:{bno:bno, heartCheck:${heartCheck}},
						success:function(data){
							onload();			
							
						}
					});
				}
	</script>
	<!-- board.blike갯수 조사 -->
	좋아요 ${likecount.blike} 개