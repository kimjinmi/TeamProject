<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<h2 style="color: #2d2d2d; display:inline;">카테고리 편집</h2>

<hr style="margin-top:12px;">
<script type="text/javascript">
	function buttonclick(cno, ccontent){
		document.getElementById("editid").value = cno;
		document.getElementById("deleteid").value = cno;
		document.getElementById("editCategory1").value = ccontent;
		document.getElementById("deleteCategory").value = ccontent;

		
	}
</script>
<div class="container">	
	<div class="row">
		<div class="col">
			<div style="overflow:auto; height:300px;">
			<%-- <img src="<%=application.getContextPath()%>/resources/images/ponyo.png"> --%>
			<c:forEach var="category" items="${category}">
			<ul class="list-group">
				<li class="list-group-item list-group-item-light">
					<a href="javascript:void(0);" onclick="buttonclick(${category.cno}, '${category.ccontent}'); return false;"><i class="fa fa-list" aria-hidden="true"></i></a>&nbsp;&nbsp;${category.ccontent}&nbsp;&nbsp;(${category.ccount})
				</li>
				
			</ul>
			</c:forEach>
			</div>
		</div>
	</div>
	<p></p>
	<form action="categoryadd" id="categoryadd"style="display: inline;">
		<div class="row" id="categoryadd">
			<div class="col-3">
				<b>카테고리 추가</b>
			</div>
			<div class="col-8">
				<input type="text" id="addCategory" name="addCategory" placeholder="Add Category" onblur="this.placeholder = 'Add Category'"class="single-input">
			</div>
			<div class="col-1">
				<a href="#"  onclick="document.getElementById('categoryadd').submit();"><i class="fa fa-plus" ></i></a>
			</div>
		</div>
	</form>
	<p></p>
	<form action="categoryedit" id="categoryedit" style="display: inline;">
		<div class="row">
			<div class="col-3">
				<b>카테고리 변경</b>
			</div>
				<input type="hidden" id="editid" name="editid">
			<div class="col-4">
				<input type="text" id="editCategory1" name="editCategory1" placeholder="Edit Category" onblur="this.placeholder = 'Edit Category'"class="single-input" readonly>
			</div>
			<div class="col-4">
				<input type="text" id="editCategory2" name="editCategory2" placeholder="Result Category" onblur="this.placeholder = 'Result Category'"class="single-input">
			</div>
			<div class="col-1">
				<a href="#" onclick="document.getElementById('categoryedit').submit();"><i class="fa fa-cogs"></i></a>
			</div>
			
		</div>
	</form>
	<p></p>
	<form action="categorydelete" id="categorydelete" style="display: inline;">
		<div class="row" >
			<div class="col-3">
				<b>카테고리 삭제</b>
			</div>
				<input type="hidden" id="deleteid" name="deleteid">
			<div class="col-8">
				<input type="text" id="deleteCategory" name="deleteCategory" placeholder="Delete Category" onblur="this.placeholder = 'Delete Category'"class="single-input" readonly>
			</div>
			<div class="col-1">
				<a href="#"  onclick="document.getElementById('categorydelete').submit();"><i class="fa fa-minus" ></i></a>
			</div>
			<p></p><div class="col" style="color: red;">
			<i class="fas fa-exclamation-triangle"></i>
			카테고리 삭제시 해당 카테고리 내 게시글도 모두 삭제됩니다.
			</div>
		</div>
	</form>
</div>

	



					