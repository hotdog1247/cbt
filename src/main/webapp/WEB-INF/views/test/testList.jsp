<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 선택</title>
<style>
	/* input[name="tYear"]{
		
	} */
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		/* $("input[name='tYear']").hide();
		$("input[name='tOrder']").hide(); */
	})
	$(document).on("submit", "form", function() {
		var selectName = $("select[name='tName']").val();
		var selectYear = $("select[name='tYear']").val();
		var selectOrder = $("select[name='tOrder']").val();
		if(selectName =="시험종류"){
			return false;
		}
		if(selectYear =="년도"){
			return false;
		}
		if(selectOrder =="차수"){
			return false;
		}
	})
	$(document).on("change", "select[name='tName']", function() {
		var selectedVal = $("select[name='tName']").val();
		if(selectedVal == "시험종류"){
			alert("시험을 선택해주세요");
			return;	
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/test/listtName",
			type:"get",
			headers:{"Content-Type":"application/json"},
			data: {
				tName : selectedVal
			},
			dataType:"json",
			success:function(res){
				console.log(res);
				$.each(res, function(i, obj) {
					var $option = $("<option>").text(obj);
					$option.attr("value", obj);
					$("select[name='tYear']").append($option);
					/* $("input[name='tYear']").show(); */
				})
			}
		})
	})
	$(document).on("change", "select[name='tYear']", function() {
		var selectedName = $("select[name='tName']").val();
		var selectedYear = $("select[name='tYear']").val();
		if(selectedYear == "년도"){
			alert("년도를 선택해주세요");
			return;	
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/test/listtYear",
			type:"get",
			headers:{"Content-Type":"application/json"},
			data:{
				tName : selectedName,
				tYear : selectedYear
			},
			dataType:"json",
			success:function(res){
				console.log(res);
				$.each(res, function(i, obj) {
					var $option = $("<option>").html(obj).val(obj);
					$("select[name='tOrder']").append($option);
					/* $("input[name='tOrder']").show(); */
				})
			}
		})
	})
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/exam/list" method="get">
		<select name="tName">
			<option>시험종류</option>
			<c:forEach var="test" items="${list }">
				<option value="${test}">${test}</option>
			</c:forEach>
		</select>
		<select name="tYear">
			<option>년도</option>
			<%-- <c:forEach var="test" items="${list }">
				<option value="${test.tNo}">${test.tYear }_${test.tOrder }_${test.tName }</option>
			</c:forEach> --%>
		</select>
		<select name="tOrder">
			<option>차수</option>
			<%-- <c:forEach var="test" items="${list }">
				<option value="${test.tNo}">${test.tYear }_${test.tOrder }_${test.tName }</option>
			</c:forEach> --%>
		</select>		
		<input type="submit" value="선택">
	</form>
</body>
</html>