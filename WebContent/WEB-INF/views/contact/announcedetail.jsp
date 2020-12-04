<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<style>
tr, th, td{
padding: 10px;

}
</style>

<table style="text-align:center; width: 100%">
	<colgroup>
		<col width="10%">
		<col width="60%">
		<col width="20%">
		<col width="10%">
	</colgroup>
	<thead>
		<tr style="background-color:#FBF9FF;">
			<th scope="col">No</th>
			<th scope="col">title</th>
			<th scope="col">date</th>
			<th scope="col">views</th>
		</tr>
	</thead>
	<tr style="border-spacing: 5px;">
		<td><b>${announce.ano}</b></td>
		<td><b>${announce.atitle}</b></td>
		<td><b><fmt:formatDate value="${announce.adate}" pattern="yyyy-MM-dd" /></b></td>
		<td><b>${announce.ahitnum}</b></td>
	</tr>
	<tr>
		<td colspan="4">
			<------텍스트에디터로 변경예정임------><br>
			${announce.acontent}
		</td>
	</tr>
	<tr>
		<td colspan="4" style="text-align:center;">
			<a class="genric-btn primary-border small" href="javascript:allannouncelist(${pageNo})">목록</a>
			
		</td>
	</tr>
</table>
		
				