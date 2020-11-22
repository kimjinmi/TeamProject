<%@ page contentType="text/html; charset=UTF-8"%>

<div>
	<a href="javascript:blogLife()" class="d-flex">
	<p>라이프</p>
	<p>(37)</p>
	</a>
	
	<script type="text/javascript">
		function blogLife() {
			$.ajax({
				url:"blogLife",
				success:function(data) {
					$("#blog_category").html(data);
				}
			});
		}
	</script>
	
	
	
	
</div>