<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
		border: 1px solid steelblue;
	}
	th, td{
		border: 1px solid steelblue;
	}
</style>
</head>
<body>
	<h1>시험결과</h1>
	<table>
		<tr>
			<th>과목명</th>
			<th>정답갯수</th>
			<th>점수</th>
		</tr>
		<%-- <c:set var="answerCnt" value="0" />
		<c:forEach begin="0" end="${fn:length(sNo)}" var="sub">
			<tr>
				<td>${sNo[sub].sName }</td>
				<td>
					<c:forEach var="cnt" items="${exam }">
						<c:if test="${subject[sub].sNo==exam.sNo.sNo }" var="cnt2">
							<p>${answer+1}</p>	
						</c:if>
					</c:forEach>
				</td>
			</tr>
		</c:forEach> --%>
		<%-- <c:forEach begin="1" end="${fn:length(subject)}" var="sub"> --%>
		<c:forEach items="${subject}" var="sub">
			<tr>
				<td>${sub.value[0].sName}</td>
				<td>${sub.value[1]}개</td>
<%-- 				<c:set var="eNoCnt" value="0"/>
				<c:forEach var="ex" items="${exam}">
						<c:set var="sNoCnt" value="${ex.value[0].eNo}"/>
						<c:if test="${ex.value[0].sNo.sNo==sub.value[0].sNo}" var="ss">
 							<c:if test="${sNoCnt<ex.value[0].eNo }">
								<c:set var="sNoCnt" value="${ex.value[0].eNo}"/>
							</c:if>
							<c:set var="eNoCnt" value="${eNoCnt+1 }"/>
							<td>${sNoCnt }/${eNoCnt}</td>
							<c:if test="${sNoCnt==ex.value[0].eNo}">
								<td>${sNoCnt}/ddddd</td>
								<td>${eNoCnt}</td>
							</c:if>
							<c:set var="cnt22" value="${eNoCnt }"/>
							<td>${cnt22 }</td>
						</c:if>
						<td>${eNoCnt }</td>
				</c:forEach> --%>
				<td>${sub.value[1]/sub.value[2]*100 }점</td>
			</tr>
		</c:forEach>
	</table>
	<button id="">틀린문제보기</button>
</body>
</html>