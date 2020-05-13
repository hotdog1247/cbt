<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$(".test").click(function() {
			alert("시험?");
		})
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">좋은 결과를 바라며</h3>
				</div>
				<div class="box-body">
					<img src="${pageContext.request.contextPath }/resources/dist/img/엉클샘.jpg" class="img-circle"/>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp" %>
