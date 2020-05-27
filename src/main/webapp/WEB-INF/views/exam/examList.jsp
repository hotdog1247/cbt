<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	body{
		margin: 0;
		padding:0;
	}
	.exWrap{
		width: 1200px;
		margin: 20px;
		float: left;
		padding: 15px auto;
		font-size: 1.5em;
	}
	#container1{
		width: 1300px;
		height:600px;		
		float: left;
		background-color: #003b32;
		border: 15px outset #572313;
		color: white;
	}
	#exams{
		height:570px;
		overflow: auto;
	}
	#container2{
		width: 300px;
		height:600px;
		color:white;
		float: right;
		border: 15px outset #572313;
		background-color: #003b32;
		font-size: 1.5em;
	}
	#container2 input[type='radio']{
		margin: 10px;
	}
	#container2>form>p>input{
		width: 100px;
		display:block;
		margin: 0 auto;
		color: white;
		background-color: #b48464;
		padding: 10px 10px;
		font-size: 1.5rem;
		border: 5px outset #572313;
	}
	.box-footer{
		clear: both;
		list-style: none;
	}
	.box-footer li{
		list-style: none;
		float: left;
		margin: 15px;
		border: 5px outset #572313;
		background-color:#b48464; 
	}
	.box-footer li a{
		text-decoration: none;
		color: #003b32;
		font-size: 1.5rem;
		background-color:#b48464;
	}
	#titleExam{
		text-align: center;
	}
	.omr{
		text-align: center;
	}
	#container2_exam{
		height:570px;
		overflow:auto;
	}
	#titleExam{
		padding: 10px;
		font-weight: bold;
	}
	#examTime{
		text-align: right;
		padding-right: 100px;
		font-weight: bold; 
	}
	div.content{
		background: #b48464;
	}
	div.box-footer{
		background: #003b32;
		border: 15px outset #572313; 
	}
	#exBtn{
		position: absolute;
		top: 815px;
		right: 100px;
	}
	a.idx{
		background-color: #b48464 !important;
		display: block;
		color: white !important;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	var setTime = ${tNo.tTime};
	function ex_time() {
		var hourEx = Math.floor(setTime/3600);
		var minEx = Math.floor((setTime%3600)/60);
		var m = hourEx+":"+minEx+":"+(setTime%60);
		$("#examTime").html(m);
		setTime--;
		if (setTime < 0) {		
			clearInterval(tid);
			alert("종료");
			$("#examSubmit").submit();
		}
	}
	var examCnt = new Array();
	var examCnt2 = new Array();
	$(function() {
		window.onload = function TimerStart(){ tid=setInterval('ex_time()',1000) };
		
		$(document).on("click", ".contentChk", function() {/* 문제 체크시 */
			var chk = $(this).val();
			var eNo = $(this).parent().parent().find(".eNo").text();
			var flag = $(this).prop("checked");
			$(".omr").find("input[name='eNo"+eNo+"']").eq(chk-1).attr("checked", flag);
		})
		$(document).on("click", ".contentChk2", function() {
			var chk = $(this).val();
			var eNo = $(this).parent().find(".eNo2").text();
			var flag = $(this).prop("checked");
			$(".exWrap").find("input[name='"+eNo+"a']").eq(chk-1).attr("checked", flag);
		})
		$(document).on("click", ".idx", function() {
 			$(".pagination li").removeClass();
 			$(this).parent().addClass("active");
			var page = $(this).text();
			var tNo = ${selectList[1].tNo.tNo};
 			var tName = $("titleExam").text();
			var tYear = ${selectList[1].tNo.tYear};
			var tOrder = ${selectList[1].tNo.tOrder}; 
 			$.ajax({
				url:"${pageContext.request.contextPath}/exam/listPage",
				type:"get",
				data: {
					page : page,
					tNo : tNo,
					tName : tName,
					tYear : tYear,
					tOrder : tOrder
				},
				dataType:"json",
				success:function(res){
					$("#exams").empty();
			        $.each(res.selectList, function(i, exam) {
			        	var target = $(".omr").find("input[name='eNo"+exam.eNo+"']:checked").val();
			        	var target2 = $(".omr").find("input[name='eNo"+exam.eNo+"']:checked").eq();
 			            var $div = $("<div>").addClass("exWrap").addClass(exam.eNo%2==0?"right":"left");
 			            var $p1 = $("<p>").html("<span class='eNo'>"+exam.eNo+"</span>."+exam.eName+"");
 			           	console.log(exam.eDescription);
 			            if (exam.eDescription!=0){
 			           		var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/displayFile?fileName="+exam.tNo.tYear+"_"+exam.tNo.tOrder+"_"+exam.tNo.tName+"/img/"+exam.eNo+".png");
 			           	}
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
 			            $div.append($img);
			        	$div.append($p2);
			        	$div.append($p3);
			        	$div.append($p4);
			        	$div.append($p5);			        	
 			            $('#exams').append($div);
			        });
			        $("#exams").find(".exWrap").eq(0).find("input").focus();
				}
			})
		})
		$(document).on("click", "#resultSubmit", function() {
			var sizing = $(".contentChk2").size()/4;
			var map = new Map();
			var tTime = ${tNo.tTime};
			$("input[name='rTime']").val(tTime-setTime);
			for(var i=1; i<=sizing;i++){
				var i = $(".contentChk2[name='b"+i+"']").eq(1).attr("data-eno");
				var i2 = $(".contentChk2[name='b"+i+"']:checked").val();
				if(typeof i2 == "undefined"){
					i2 = 0;
				}
				examCnt.add(i);
				examCnt2.add(i2);
			}
		})
	})
</script>
<%@ include file="../include/header.jsp" %>
	<div class="content">
		<div class="row">	
			<div class="col-xs-8">
				<h1 id="titleExam">${tNo.tYear}년도 ${tNo.tOrder}차 ${tNo.tName}</h1>
			</div>
			<div class="col-xs-4">
				<h1 id="examTime"></h1>
			</div>
		</div>
		<div id="container1" class="style-1">
			<div id="exams">
				<c:forEach var="exam" items="${selectList}">
					<div class="exWrap ${exam.eNo%2==0?'right':'left' }">
						<p><span class="eNo">${exam.eNo }</span>. ${exam.eName }</p>
								<c:if test="${0 ne exam.eDescription}">
									<p><img src="${pageContext.request.contextPath}/displayFile?fileName=${exam.tNo.tYear}_${exam.tNo.tOrder}_${exam.tNo.tName}/img/${exam.eNo}.png" class="eDescription"></p>
								</c:if>
								<p><input type="radio" name="${exam.eNo}a" value="1" class="contentChk"><span class="content">${exam.eContent }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="2" class="contentChk"><span class="content">${exam.eContent2 }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="3" class="contentChk"><span class="content">${exam.eContent3 }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="4" class="contentChk"><span class="content">${exam.eContent4 }</span></p>
							</div>
				</c:forEach>
			</div>
		</div>
		<div id="container2">
			<form action="listPage" method="post" id="examSubmit">
				<input type="hidden" name="tNo" value="${tNo.tNo}">
				<input type="hidden" name="rTime" value="">
				<div id="container2_exam">
					<c:forEach var="exam" items="${list}">
						<p class="omr">
							<span class="eNo2">${exam.eNo }</span>.
							<input type="radio" name="eNo${exam.eNo}" value="1" class="contentChk2" data-eno="${exam.eNo}">
							<input type="radio" name="eNo${exam.eNo}" value="2" class="contentChk2" data-eno="${exam.eNo}">
							<input type="radio" name="eNo${exam.eNo}" value="3" class="contentChk2" data-eno="${exam.eNo}">
							<input type="radio" name="eNo${exam.eNo}" value="4" class="contentChk2" data-eno="${exam.eNo}">
							<c:if test="${exam.eNo%10==0}">
								<hr>
							</c:if>
						</p>
					</c:forEach>
				</div>
				<p id="exBtn">
					<input type="submit" value="제출" id="resultSubmit">
				</p>
			</form>
		</div>
		<div class="box-footer">
			<div class="text-center">
				<ul class="pagination">
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						<li><a href="#" class="idx">${idx }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>