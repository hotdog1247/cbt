<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
	.incorrectEx:nth-child(2n){
		border: 1px solid steelblue;
		padding: 10px;
		border: 5px;
		width: 350px;
		background-color: red;
	}
	.incorrectEx:nth-child(2n-1){
		border: 1px solid steelblue;
		padding: 10px;
		border: 5px;
		width: 350px;
		background-color: green;
	}
	#exams{
		height: 500px;
		width: 400px;
		overflow: auto;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).on("click", ".incorrect", function() {
		var tNo = $(this).attr("data-tNo");
		var rNo = $(this).attr("data-rNo");
			$.ajax({
				url:"${pageContext.request.contextPath}/member/incorrect",
				type:"get",
				data: {
					tNo : tNo,
					rNo : rNo
				},
				dataType:"json",
				success:function(res){
					$.each(res[1], function(i, exam) {
						$.each(res[0], function(i, incorrect) {
							if(exam.eNo==incorrect.eNo){
								if(exam.eAnswer!=incorrect.eIncorrect){
									if(exam.eDescription != 0){
 										var $img = $("<img>").attr("src","${pageContext.request.contextPath}/displayFile?fileName="+exam.tNo.tYear+"_"+exam.tNo.tOrder+"_"+exam.tNo.tName+"/img/"+exam.eNo+".png");
									}
									var $exSub = $("<p>").text(" => "+exam.sNo.sName+" <= ");
						        	var $exName = $("<p>").text(exam.eNo+". "+exam.eName);
						        	var $exContent = $("<p>").text(" - "+exam.eContent);
						        	var $exContent2 = $("<p>").text(" - "+exam.eContent2);
						        	var $exContent3 = $("<p>").text(" - "+exam.eContent3);
						        	var $exContent4 = $("<p>").text(" - "+exam.eContent4);
						        	var $exAns = $("<p>").text("( 정답 : "+exam.eAnswer+" / 오답 : "+incorrect.eIncorrect+" )");
						        	var $div = $("<div>").addClass("incorrectEx");
						        	$div.append($exSub);
						        	$div.append($exName);
						        	$div.append($exAns);
						        	if(exam.eDescription != 0){
						        		$div.append($img);
						        	}
						        	$div.append($exContent);
						        	$div.append($exContent2);
						        	$div.append($exContent3);
						        	$div.append($exContent4);
						        	$("#exams").append($div);
								}	
							}
						})
					})
				}
			})
	})
	$(document).on("click", ".subject", function() {
		$("#exams2").empty();
		var tNo = $(this).attr("data-tNo");
		var rNo = $(this).attr("data-rNo");
			$.ajax({
				url:"${pageContext.request.contextPath}/member/subject",
				type:"get",
				data: {
					tNo : tNo,
					rNo : rNo
				},
				dataType:"json",
				success:function(res){
					console.log(res);
					$.each(res[2], function(i, sub) {
						var cnt = 0;
						var cnt2 = 0;
						$.each(res[1], function(i, exam) {
							if(sub.sNo==exam.sNo.sNo){
								cnt++;
								$.each(res[0], function(i, incorrect) {
									if(exam.eNo==incorrect.eNo){
										cnt2++;
									}
								})
							}
						})
						var exCnt = cnt-cnt2;
						var exScore = Math.round(exCnt/cnt*100);
						var sPass = true;
						if(exScore<40){
							sPass = false;
						}
						var $subName = $("<p>").text(sub.sName);
						var $score = $("<p>").text(exScore+"점");
						var $sPass = $("<p>").text(sPass);
						var $div = $("<div>").addClass("sub");
						$div.append($subName);
						$div.append($score);
						$div.append($sPass);
						$("#exams2").append($div);
					})
				}
			})
	})
</script>
<style>
	.examTable{
		border-collapse: collapse;
		border: 1px solid steelblue;
		text-align: center;
	}
	.examTable td, .examTable th{
		border: 1px solid steelblue;
		padding: 5px;
	}	
</style>
<div class="content">
	<table class="examTable">
		<tr>
			<th>년도</th>
			<th>차수</th>
			<th>시험명</th>
			<th>응시날짜</th>
			<th>합격여부</th>
			<th>점수</th>
			<th>과목별점수</th>
			<th>오답보기</th>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.tNo.tYear }</td>
				<td>${list.tNo.tOrder }</td>
				<td>${list.tNo.tName }</td>
				<td><fmt:formatDate value="${list.rDate }" pattern="yyyy-MM-dd"/></td>
				<td>${list.rPass }</td>
				<td>${list.rScore }</td>
				<td><button class="subject" data-tNo="${list.tNo.tNo}" data-rNo="${list.rNo}">보기</button></td>
				<td><button class="incorrect" data-tNo="${list.tNo.tNo}" data-rNo="${list.rNo}">보기</button></td>				
				<%-- <td>${list.rNo }</button></td> --%>				
			</tr>
		</c:forEach>
	</table>
	<div id="exams"></div>
	<div id="exams2">
<%-- 		<c:forEach var="incorrect" items="${incorrectList}">
			<c:forEach items="${incorrect }" var="i">
				<p>${i}</p>
			</c:forEach>
		</c:forEach> --%>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>