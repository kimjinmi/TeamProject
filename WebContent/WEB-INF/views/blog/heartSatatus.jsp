<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<span class="align-middle"><a id="heart" href="javascript:heartbreaker()" class="fa fa-heart" style="color: black;"></a></span>
	<script type="text/javascript">
			function heartbreaker(){
				// LIKE에서 SessionEmail로 해당 BNO로 select 값 조사했을때 값이 0인경우 블랙 아닌 경우 레드
				if(heart__status == true){ // 필요한 값 bno, sessionEmail 로 LIKED 테이블 조회
				$("#heart").css("color", "red"); 
				}else{
					$("#heart").css("color", "black");	
				}
			}
	</script>
	<!-- board.blike갯수 조사 -->
	좋아요 ${likecount.blike}개 