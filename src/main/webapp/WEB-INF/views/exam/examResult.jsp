<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험결과</title>
<style>
	table{
		border-collapse: collapse;
		border: 1px solid steelblue;
	}
	th, td{
		border: 1px solid steelblue;
		padding: 10px;
	}
	.examResult{
		width: 900px;
		height: 300px;
		border: 1px solid steelblue;
		padding: 30px;
		margin: 10px;
	}
	.examResult:nth-child(2n){
		background-color: green;
	}
	.examResult:nth-child(2n-1){
		background-color: steelblue;
	}
	#exContainer{
		height:400px;
		overflow: auto;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		var flag = false;
		$("#exContainer").hide();
		$("#exRes").click(function() {
			if(flag == false){
				$("#exContainer").show();
				flag = true;
			}
			else {
				$("#exContainer").hide();
				flag = false;
			}
		})
	})
</script>
<%@ include file="../include/header.jsp" %>
<div class="content">
	<h1>시험결과</h1>
	<table>
		<tr>
			<th>과목명</th>
			<th>정답갯수</th>
			<th>점수</th>
		</tr>
		<c:forEach items="${subject}" var="sub">
			<tr>
				<td>${sub[0].sName}</td>
				<td>${sub[1]}개</td>
				<td>${sub[1]/sub[2]*100}점</td>
			</tr>
		</c:forEach>
	</table>
	<button id="exRes">틀린문제보기</button>
	<div id="exContainer">
		<c:forEach var="ex" items="${exam}">
			<div class="examResult">
				<c:if test="${ex[0].eAnswer!=ex[1]}">
					<p>${ex[0].eNo}번 문제 : ${ex[0].eName } => 답:  ${ex[0].eAnswer}, 오답 : ${ex[1]}</p>
					<c:if test="${0 ne ex[0].eDescription}">
						<p><img src="${pageContext.request.contextPath}/displayFile?fileName=${ex[0].tNo.tYear}_${ex[0].tNo.tOrder}_${ex[0].tNo.tName}/img/${ex[0].eNo}.png" class="eDescription"></p>
					</c:if>
					<p>- ${ex[0].eContent}</p>
					<p>- ${ex[0].eContent2}</p>
					<p>- ${ex[0].eContent3}</p>
					<p>- ${ex[0].eContent4}</p>
				</c:if>
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>