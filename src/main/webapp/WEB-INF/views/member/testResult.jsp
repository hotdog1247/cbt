<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
	#exams{
		height: 500px;
		width: 400px;
		overflow: auto;
	}
	hr{
		clear: both;
	}
	.sub p{
		float: left;
		text-align: center;
		font-size: 1.1em;
	}
	.sub p:first-child{
		width: 140px;
	}
	.sub p:nth-child(2){
		width: 100px;
	}
	.sub p:nth-child(3){
		width: 100px;
	}	
	::-webkit-scrollbar {
		width: 14px;
	}
	::-webkit-scrollbar-track {
		background-color: #b46868;
		border-radius: 9px;
	}
	::-webkit-scrollbar-thumb {
		background-color: #6c8927;
		border-radius: 9px;
	}
	div.content{
		background: #b48464;
		min-height: 901px;
	}
	.examTable{
		width:1260px;
		background-color: #003b32;
		border: 15px outset #572313;
		color: white;
		height: 450px;
		overflow: auto;
		float: left;
	}
	.examTable div{
		overflow: hidden;
	}
	.examTable p{
		text-align: center;
		height:50px;
		line-height : 50px;
		float: left;
		font-size: 1.5em;
	}
	.examTable div:first-child p{
		font-size: 2em;
		padding-top: 15px;
	}	
	.examTable div p:first-child {
		width: 90px;
	}	
	.examTable div p:nth-child(2) {
		width: 100px;
	}	
	.examTable div p:nth-child(3) {
		width: 200px;
	}	
	.examTable div p:nth-child(4) {
		width: 140px;
	}	
	.examTable div p:nth-child(5) {
		width: 140px;
	}	
	.examTable div p:nth-child(6) {
		width: 90px;
	}	
	.examTable div p:nth-child(7) {
		width: 150px;
	}	
	.examTable div p:nth-child(8) {
		width: 150px;
	}	
	.examTable div p:last-child{
		width: 150px;
	}
	.examTable div p button{
		border: 5px outset #572313;
		background: #b48464;
		color: white;
	}
	#subScore{
		float: right;
		width: 370px;
		height: 450px;
		background-color: #003b32;
		border: 15px outset #572313;
		color: white;
	}
	#exams{
		background-color: #003b32;
		border: 15px outset #572313;
		color: white;
		width: 1646px;
		height: 400px;
		overflow: auto;
	}
	.incorrectEx{
		margin: 10px;
		padding: 10px;
		font-size: 1.5em;	
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
					$("#exams").empty();
					$.each(res[1], function(i, exam) {
						$.each(res[0], function(i, incorrect) {
							if(exam.eNo==incorrect.eNo){
								if(exam.eAnswer!=incorrect.eIncorrect){
									if(exam.eDescription != 0){
 										var $img = $("<img>").attr("src","${pageContext.request.contextPath}/displayFile?fileName="+exam.tNo.tYear+"_"+exam.tNo.tOrder+"_"+exam.tNo.tName+"/img/"+exam.eNo+".png");
									}
									var $exSub = $("<p>").text(" 과목 : "+exam.sNo.sName);
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
		$("#subScore").empty();
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
					var $subName2 = $("<p>").text("과목이름");
					var $score2 = $("<p>").text("점수");
					var $sPass2 = $("<p>").text("과락여부");
					var $hr = $("<hr>");
					var $div2 = $("<div>").addClass("sub");
					$div2.append($subName2);
					$div2.append($score2);
					$div2.append($sPass2);
					$div2.append($hr);
					$("#subScore").append($div2);
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
						$("#subScore").append($div);
					})
				}
			})
	})
</script>
<div class="content">
	<div id="resWrap">
		<div class="examTable">
			<c:if test="${not empty list}">
				<div>
					<p>년도</p>
					<p>차수</p>
					<p>시험명</p>
					<p>응시날짜</p>
					<p>합격여부</p>
					<p>점수</p>
					<p>시간</p>
					<p>과목별점수</p>
					<p>오답보기</p>
				</div>
				<hr>
			</c:if>
			<c:forEach var="list" items="${list }">
				<div>
					<p>${list.tNo.tYear }</p>
					<p>${list.tNo.tOrder }</p>
					<p>${list.tNo.tName }</p>
					<p><fmt:formatDate value="${list.rDate }" pattern="yyyy-MM-dd"/></span>
					<c:if test="${list.rPass }">
						<p>합격</p>
					</c:if>
					<c:if test="${!list.rPass }">
						<p>불합격</p>
					</c:if>
					<p>${list.rScore }</p>
					<p><fmt:formatNumber value="${list.rTime/3600 }" pattern="0"/> : <fmt:formatNumber value="${(list.rTime%3600)/60 }" pattern="0"/> : <fmt:formatNumber value="${list.rTime%60 }" pattern="0"/></p>
					<p><button class="subject" data-tNo="${list.tNo.tNo}" data-rNo="${list.rNo}">보기</button></p>
					<p><button class="incorrect" data-tNo="${list.tNo.tNo}" data-rNo="${list.rNo}">보기</button></p>								
				</div>
			</c:forEach>
		</div>
		<div id="subScore"></div>
	</div>
	<div id="exams"></div>
	
</div>
<%@ include file="../include/footer.jsp" %>