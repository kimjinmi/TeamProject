<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<h2 style="color: #2d2d2d; display:inline;">매니저관리</h2>

<hr style="margin-top:12px;">

	<div class="container">	
		
		<div class="row"style="overflow:auto; height:800px;">
			<c:forEach var="manager" items="${manager}">
				<div class="col-3">
					<img src="photodownload?fileName=${manager.mmyimage}" alt="" width="100" height="100" class="rounded-circle">
				</div>
				<div class="col-9">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<a href="<%=application.getContextPath()%>/blog/blog?UserUrl=${manager.murl}"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;${manager.memail}</li></a>
						<li class="list-group-item"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;&nbsp;${manager.mphonenum}</li>
						<li class="list-group-item" style="color:red;">
							<a href="javascript:managerDelete('${manager.memail}')"><i class="fa fa-minus" aria-hidden="true"></i>&nbsp;&nbsp;매니저 삭제</a></li>
					</ul>
		
				</div>
			</c:forEach>
			<script>
				function managerDelete(memail){
					$.ajax({
						url:"managerDelete",
						data:{memail:memail},
						success:function(data){
							if(data.result == "success"){
								managersetting();
							}
						}
					});
				}
			</script>
		</div>
		<p></p>
	
	</div>


	



					