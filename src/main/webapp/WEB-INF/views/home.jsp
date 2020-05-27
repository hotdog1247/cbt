<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<style>
	body{
		margin: 0;
		padding:0;
	}
	#container1{
		width: 1650px;
		margin:0 auto;
		height:800px;		
		background-color: #003b32;
		border: 15px outset #572313;
		color: white;
	}
	div.content{
		background: #b48464;
		min-height: 901px;
	}
</style>
	<div class="content">
		<div id="container1">
			<h1>${Auth }님 환영합니다.</h1>
			<br><br>
			<c:if test="${admin!=3 }">
				<h2>주의사항 및 메뉴를 설명드리겠습니다.</h2>
				<h2>첫 번째로 문제풀기를 통해 문제를 푸실 수 있고 제한시간 내 푸시지 않으시면 강제로 문제제출이 됩니다.</h2>	
				<h2>두 번째로  시험현황 및 오답노트는 푸셨던 시험현황과 합격유무 및 세부과목들의 점수, 그리고 오답을 보실 수 있습니다.</h2>	
				<h2>마지막으로 자유게시판은 자유 이용이나 욕설은 회원박탈입니다.</h2>	
				<h2>주의사항 조심해주시고 즐거운 하루되시길 바랍니다.</h2>
			</c:if>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
