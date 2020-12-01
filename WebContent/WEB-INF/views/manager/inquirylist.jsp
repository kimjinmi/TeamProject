<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d; display:inline;">문의사항 관리</h2>

<hr style="margin-top:12px;">

<div class="container">	
	<div class="row">
		<div class="col">
			<ul class="list-group">
				<li class="list-group-item list-group-item-light">
					<a href="javascript:listwaiting()"><i class="fa fa-list" aria-hidden="true"></i>&nbsp;&nbsp;처리대기중</a>
				</li>	
				<li class="list-group-item list-group-item-light"><!-- ajax사용해서 listresult에 결과값 받기 -->
					<a href="javascript:listcomplete()"><i class="fa fa-list" aria-hidden="true"></i>&nbsp;&nbsp;처리완료</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col" id="listresult">
		</div>
	</div>
	<p></p>

</div>

	



					