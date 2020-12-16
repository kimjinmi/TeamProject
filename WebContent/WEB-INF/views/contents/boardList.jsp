<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="now" class="java.util.Date" scope="request" />
<fmt:parseNumber var="time" value="${now.time /(1000*60*60*24)}" integerOnly="true" />

<c:forEach var="board" items="${list}">
	<fmt:parseNumber var="bdate" value="${board.bdate.time /(1000*60*60*24)}" integerOnly="true" />
		<c:set value="${time - bdate}" var="Diff" />
		<div class="col-lg-12 col-md-12 d-none d-sm-block"
			style="border-bottom: 1px solid #E7E7E7; padding-bottom: 2%;">
			<a href="javascript:boardDetails(${board.bno})"
				class="box_desc box_desc_type"> <!-- 게시물 이미지 --> <script
					type="text/javascript">
						function boardDetails(bno) {
							location.href = "<%=application.getContextPath()%>/blog/blog_details?bno="+ bno;
						}
					</script>
				<div class="img_thumb">
					<img class="thumb_g"
						src="photodownload_board?fileName=${board.bimage}" />
				</div> <!-- 게시물 타이틀, 내용 -->
				<div class="wrap_cont">
					<div class="wrap_data">
						<dl class="list_data">
							<dt class="screen_out">카테고리</dt>
							<dd class="ddcss ddcss1" style="margin-bottom: 3%">${board.ccontent}</dd>
						</dl>
						<dl class="list_data" style="margin-bottom: 0px">
							<dt class="screen_out">게시된 시간</dt>
							<time>
								<c:choose>								    							
	   								<c:when test="${(time*24)-(bdate*24)<1}">
	       								<fmt:parseNumber var="start" value="${now.time}" integerOnly="true" />
	       								<fmt:parseNumber var="end" value="${board.bdate.time}" integerOnly="true"/>
											<c:if test="${((start/(1000*60))-(end/(1000*60)))<60}">
												<c:if test="${((start/(1000*60))-(end/(1000*60)))<1}">
													방금전
												</c:if>
												<c:if test="${((start/(1000*60))-(end/(1000*60)))>=1}">
													<dd class="ddcss"><fmt:formatNumber type="dateDiff"  pattern="0" value="${(start/(1000*60))-(end/(1000*60))}"/>분전</dd>
												</c:if>
											</c:if>								
										<c:if test="${((start/(1000*60))-(end/(1000*60)))>60}">
											<dd class="ddcss"><fmt:formatNumber type="dateDiff"  pattern="0" value="${(start/(1000*60*60))-(end/(1000*60*60))}"/>시간전</dd>   
										</c:if>								 						    				      						    						          						       						       					   							    							   							    							   							    													    							 							    							    							    							
	   								</c:when>    							   							    							   							
	   								<c:when test="${(time)-(bdate)<7}">
	       								 <dd class="ddcss">${(time)-(bdate)}일전</dd>
	  								 	</c:when>
									<c:when test="${30 > Diff}">
									     <dd class="ddcss"><fmt:formatNumber type="Diff" pattern="0" value="${(Diff/7)}"/>주전</dd>
									 </c:when>
									 <c:when test="${Diff >= 30 && Diff < 340 }">
									     <dd class="ddcss"><fmt:formatNumber type="Diff" pattern="0" value="${(Diff/7)/4}"/>달전</dd>
									 </c:when>
									 <c:when test="${Diff >= 340 }">
									     <dd class="ddcss"><fmt:formatNumber type="Diff" pattern="0" value="${((Diff/7)/4)/12}"/>년전</dd>
									 </c:when>
								</c:choose>								
							</time>
							
							<%-- <c:choose>
								<c:when test="${dateDiff == 0}">
							        <dd class="ddcss">오늘</dd>
							    </c:when>
								<c:when test="${dateDiff > 0}">
							        <dd class="ddcss">${dateDiff}일전</dd>
							    </c:when>
							</c:choose> --%>
						</dl>
						<dl class="list_data">
							<dt
								style="color: #909090; font-size: 13px; display: inline;">좋아요</dt>
							<dd class="ddcss" style="display: inline;">${board.blike}</dd>
						</dl>
					</div>
				</div>
				<div>
					<strong class="desc_tit"> ${board.btitle } </strong>
					<p class="desc_g">${board.bcontent}</p>
				</div> 
				<a style="margin: 0; padding: 0;" href="<%=application.getContextPath()%>/blog/blog?UserUrl=${board.murl}">
					<div class="info_g">
						<!-- 사용자 이미지 -->
						<span class="wrap_thumb"> <img class="thumb_profile"
							src="photodownload_member?fileName=${board.mmyimage}">
	
						</span> <span class="txt_id">${board.mintro}</span> <span
							class="txt_date">by ${board.mnickname}</span>
					</div>
				</a>
			</a>
		</div>
		<!-- ---------------------------------------------------------------- -->
		<div class="col-sm-12 d-block d-sm-none"
			style="border-bottom: 1px solid #E7E7E7; padding-bottom: 2%;">
			<a href="javascript:boardDetails(${board.bno})"
				class="box_desc box_desc_type"> <!-- 게시물 이미지 --> <script
					type="text/javascript">
						function boardDetails(bno) {
							location.href = "<%=application.getContextPath()%>/blog/blog_details?bno="+ bno;
						}
					</script>
				<div class="img_thumb_sm">
					<img class="thumb_g_sm"
						src="photodownload_board?fileName=${board.bimage}" />
				</div> <!-- 게시물 타이틀, 내용 -->
				<div>
					<strong class="desc_tit_sm"> ${board.btitle } </strong>
					<p class="desc_sm" style="margin-bottom: 0;">${board.bcontent}</p>
				</div>
				<div class="info_g_sm">
					<!-- 사용자 이미지 -->
					<a href="<%=application.getContextPath()%>/blog/blog?UserUrl=${board.murl }"> <span
						class="wrap_thumb"> <img class="thumb_profile_sm"
							src="photodownload_member?fileName=${board.mmyimage}">
					</span> <span class="txt_id_sm">by ${board.mnickname}</span>
					</a>
				</div>
			</a>
		</div>
</c:forEach>
