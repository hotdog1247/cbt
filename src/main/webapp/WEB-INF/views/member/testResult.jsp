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
/* 			$.ajax({
				url:"${pageContext.request.contextPath}/member/incorrect",
				type:"get",
				data: {
					tNo : tNo,
					rNo : rNo
				},
				dataType:"json",
				success:function(res){
					console.log(res);
					$.each(res, function(i, exam) {
						var $exSub = $("<p>").text(" => "+exam[0].sNo.sName+" <= ");
			        	var $exName = $("<p>").text(exam[0].eNo+". "+exam[0].eName);
			        	var $exContent = $("<p>").text(" - "+exam[0].eContent);
			        	var $exContent2 = $("<p>").text(" - "+exam[0].eContent2);
			        	var $exContent3 = $("<p>").text(" - "+exam[0].eContent3);
			        	var $exContent4 = $("<p>").text(" - "+exam[0].eContent4);
			        	var $exAns = $("<p>").text("( 정답 : "+exam[0].eAnswer+" / 오답 : "+exam[1]+" )");
			        	var $div = $("<div>").addClass("incorrectEx");
			        	$div.append($exSub);
			        	$div.append($exName);
			        	$div.append($exAns);
			        	$div.append($exContent);
			        	$div.append($exContent2);
			        	$div.append($exContent3);
			        	$div.append($exContent4);
			        	$("#exams").append($div);
			        });
				}
			}) */
	})
	$(document).on("click", ".subject", function() {
		alert("incorrect");
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
					/* $.each(res[2], function(i, sub) {
						var cnt = 0;
						var nonIncorrect = 0;
						$.each(res[1], function(i, exam) {
							$.each(res[0], function(i, incorrect) {
								if(exam.eNo==incorrect.eNo){
									if(exam.eAnswer==incorrect.eIncorrect){
										console.log("확인");
										if(sub.sNo==exam.sNo.sNo){
											nonIncorrect = nonIncorrect+1;
											console.log("증가1");
										}
										cnt=cnt+1;
										console.log("증가2");
									}
								}
							})
						})
						console.log(nonIncorrect);
						console.log(cnt);
						var $subScore = $("<p>").text(((nonIncorrect/cnt)*100));
						var subPass = true;
						if(((nonIncorrect/cnt)*100)<40){
							subPass = false;
						}
						var $subPass = $("<p>").text(subPass);
						var $subName = $("<p>").text(sub.sName);
						var $div = $("<div>").addClass("subject");
						$div.append($subName);
						$div.append($subScore);
						$div.append($subPass);
						$("exam2").append($div);
					}) */
					$.each(res[2], function(i, sub) {

						$.each(res[1], function(i, exam) {
							var cnt = 0;
							var cnt2 = 0;
							$.each(res[0], function(i, incorrect) {
								if(sub.sNo==exam.sNo.sNo){
									cnt2++;
									if(exam.eNo==incorrect.eNo){
										cnt++;
										if(exam.eAnswer!=incorrect.eIncorrect){
												
										}
										else{
											
										}
									}
									else{
										
									}
								}
							})
							console.log(sub.sName);
							console.log("cnt : "+cnt);
							console.log("cnt2 : "+cnt2);
						})

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