<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).on("click", ".subject", function() {
		var tNo = $(this).attr("data-tNo");
		alert(tNo);
			$.ajax({
				url:"${pageContext.request.contextPath}/meber/subject",
				type:"get",
				data: {
					tNo : tNo
				},
				dataType:"json",
				success:function(res){
					$("#exams").empty();
			        $.each(res.selectList, function(i, exam) {
			        	var target = $(".omr").find("input[name='eNo"+exam.eNo+"']:checked").val();
			        	var target2 = $(".omr").find("input[name='eNo"+exam.eNo+"']:checked").eq();
 			            var $div = $("<div>").addClass("exWrap").addClass(exam.eNo%2==0?"right":"left");
 			            var $p1 = $("<p>").html("<span class='eNo'>"+exam.eNo+"</span>."+exam.eName+"");
						if(typeof target == "undefined"){
							var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk'><span class='content'>"+exam.eContent+"</span>");
 	 			            var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk'><span class='content'>"+exam.eContent2+"</span>");
 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk'><span class='content'>"+exam.eContent3+"</span>");
 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk'><span class='content'>"+exam.eContent4+"</span>");   
						}
						else{
							if(target == 1){
								var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk' checked='checked'><span class='content'>"+exam.eContent+"</span>");	
								var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk'><span class='content'>"+exam.eContent2+"</span>");
	 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk'><span class='content'>"+exam.eContent3+"</span>");
	 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk'><span class='content'>"+exam.eContent4+"</span>");
							}
							else if(target == 2){
								var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk'><span class='content'>"+exam.eContent+"</span>");	
								var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk' checked='checked'><span class='content'>"+exam.eContent2+"</span>");
	 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk'><span class='content'>"+exam.eContent3+"</span>");
	 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk'><span class='content'>"+exam.eContent4+"</span>");
							}
							else if(target == 3){
								var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk'><span class='content'>"+exam.eContent+"</span>");	
								var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk'><span class='content'>"+exam.eContent2+"</span>");
	 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk' checked='checked'><span class='content'>"+exam.eContent3+"</span>");
	 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk'><span class='content'>"+exam.eContent4+"</span>");
							}
							else if(target == 4){
								var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk'><span class='content'>"+exam.eContent+"</span>");	
								var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk'><span class='content'>"+exam.eContent2+"</span>");
	 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk'><span class='content'>"+exam.eContent3+"</span>");
	 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk' checked='checked'><span class='content'>"+exam.eContent4+"</span>");
							}
						}
 			            $div.append($p1);
			        	$div.append($p2);
			        	$div.append($p3);
			        	$div.append($p4);
			        	$div.append($p5);			        	
 			            $('#exams').append($div);
			        });
				}
			})
	})
	$(document).on("click", ".incorrect", function() {
		alert("incorrect");
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
				<td><button class="subject" data-tNo="${list.tNo.tNo}">보기</button></td>
				<td><button class="incorrect">보기</button></td>
			</tr>
		</c:forEach>
	</table>
	<div id="exams"></div>
</div>
<%@ include file="../include/footer.jsp" %>