<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 선택</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).on("submit", "form", function() {
		var selectedVal = $("select[name='tNo']").val();
		if(selectedVal == "시험종류"){
			return false;	
		}
	})
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/exam/list" method="get">
		<select name="tNo">
			<option>시험종류</option>
			<c:forEach var="test" items="${list }">
				<option value="${test.tNo}">${test.tYear }_${test.tOrder }_${test.tName }</option>
			</c:forEach>
		</select>
		<input type="submit" value="선택">
	</form>
</body>
</html>