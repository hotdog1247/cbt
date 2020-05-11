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
	#container{
		width: 1200px;
		margin: 0 auto;	
	}
	.exWrap{
		margin: 10px;
		border: 1px solid steelblue;
		width: 650px;
		float: left;
		padding: 5px;
		background-color: green;
	}
	#container1{
		width: 1000px;
		overflow: hidden;
		float: left;
		background-color: steelblue;
	}
/* 	.left{
		background-color: red;
		color: white;
		float: left;
	}
	.right{
		background-color: blue;
		color: white;
		float: right;
	} */
	#container2{
		width: 160px;
		height:300px;
		/* overflow: hidden; */
		overflow:auto;
		float: right;
		background-color: seagreen;
	}
	.box-footer{
		clear: both;
		list-style: none;
	}
	.box-footer li{
		list-style: none;
		float: left;
		margin-right: 15px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	var examCnt = new Array();
	var examCnt2 = new Array();
	$(function() {
		$(document).on("click", ".contentChk", function() {/* 문제 체크시 */
			var chk = $(this).val();
			var eNo = $(this).parent().parent().find(".eNo").text();
			var flag = $(this).prop("checked");
			/* console.log(chk);
			console.log(eNo); */
			$(".omr").find("input[name='eNo"+eNo+"']").eq(chk-1).attr("checked", flag);
		})
		$(document).on("click", ".contentChk2", function() {
			var chk = $(this).val();
			var eNo = $(this).parent().find(".eNo2").text();
			var flag = $(this).prop("checked");
			$(".exWrap").find("input[name='"+eNo+"a']").eq(chk-1).attr("checked", flag);
		})
		$(document).on("click", ".idx", function() {
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
					/* console.log(res); */
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
								/* alert(1); */
								var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk' checked='checked'><span class='content'>"+exam.eContent+"</span>");	
								var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk'><span class='content'>"+exam.eContent2+"</span>");
	 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk'><span class='content'>"+exam.eContent3+"</span>");
	 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk'><span class='content'>"+exam.eContent4+"</span>");
							}
							else if(target == 2){
								/* alert(2); */
								var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk'><span class='content'>"+exam.eContent+"</span>");	
								var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk' checked='checked'><span class='content'>"+exam.eContent2+"</span>");
	 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk'><span class='content'>"+exam.eContent3+"</span>");
	 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk'><span class='content'>"+exam.eContent4+"</span>");
							}
							else if(target == 3){
								/* alert(3); */
								var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk'><span class='content'>"+exam.eContent+"</span>");	
								var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk'><span class='content'>"+exam.eContent2+"</span>");
	 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk' checked='checked'><span class='content'>"+exam.eContent3+"</span>");
	 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk'><span class='content'>"+exam.eContent4+"</span>");
							}
							else if(target == 4){
								/* alert(4); */
								var $p2 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='1' class='contentChk'><span class='content'>"+exam.eContent+"</span>");	
								var $p3 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='2' class='contentChk'><span class='content'>"+exam.eContent2+"</span>");
	 	 			            var $p4 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='3' class='contentChk'><span class='content'>"+exam.eContent3+"</span>");
	 	 			            var $p5 = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='4' class='contentChk' checked='checked'><span class='content'>"+exam.eContent4+"</span>");
							}
 	 			            
/*  							var j = 4;
 	 			            j.foreach(function (i, obj) {
 	 			            	if(target == obj){
 	 			            		var $p+obj = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='"+obj+"' class='contentChk' checked><span class='content'>"+exam.eContent+"</span>");	
 	 			            	}
 	 			            	else{
 	 			            		var $p+obj = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='"+obj+"' class='contentChk'><span class='content'>"+exam.eContent+"</span>");
 	 			            	}
							} */
 /* 	 			            for(var i=2; i<6; i++){
 								var fori = "$p"+i;
 								if(target == i){
 									var $pi = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='"+i-1+"' class='contentChk' checked><span class='content'>"+exam.eContent+"</span>");
 								}
 								else{
 									var $pi = $("<p>").html("<input type='radio' name='"+exam.eNo+"a' value='"+i-1+"' class='contentChk'><span class='content'>"+exam.eContent+"</span>");	
 								}
 							} */
						}
			        	/* switch (target) {
						case 1:
							 alert("$p2");
							break;
						case 2:
							 alert("$p3");
							 break;
						case 3:
							 alert("$p4");
							 break;
						case 4:
							 alert("$p5");
							 break;
						default:
							break;
						} */
 			            $div.append($p1);
			        	$div.append($p2);
			        	$div.append($p3);
			        	$div.append($p4);
			        	$div.append($p5);
			        	
 			            $('#exams').append($div);
 						/* if(typeof target == "undefined"){
 						}
 						else{
 							$("#exams").find("input[type='"+exam.eNo+"a']").eq(target-1).attr("checked", "true");
 							console.log(target);
 				        	console.log(target2);
 						} */
			        });
				}
			})
		})
		$(document).on("submit", "#examSubmit", function() {
			/* return false; */
		})
		$(document).on("click", "#resultSubmit", function() {
			var sizing = $(".contentChk2").size()/4;
			var map = new Map();
			for(var i=1; i<=sizing;i++){
				var i = $(".contentChk2[name='b"+i+"']").eq(1).attr("data-eno");
				var i2 = $(".contentChk2[name='b"+i+"']:checked").val();
				if(typeof i2 == "undefined"){
					i2 = 0;
				}
				examCnt.add(i);
				examCnt2.add(i2);
				console.log("문제번호 : "+i);
				console.log("체크값 : "+i2);
			}
		})
	})
/* 	$(document).on("change", "#exams", function() {
		var radio = $(this).find("input[type='radio']");
		radio.each(function(i, obj) {
			var sss = $(this).prop("name");
			var ss = sss.length;
			var s = sss.substring(0, ss-1);
			var eNo = "eNo"+s;
			if($(".omr").find("input[name='"+eNo+"']:checked")){
				var target = $(".omr").find("input[name='"+eNo+"']:checked").eq();	
				if(typeof target == "undefined"){
					
				}
				else{
					$(this).eq(target-1).attr("checked", "true");	
				}
				/* console.log("name : "+sss);
				console.log("length : "+ss);
				console.log("substring : "+s);
				console.log("eNo : "+eNo);
				console.log("target : "+target); 
			}
		})
	}) */
</script>
</head>
<body>
	<h1 id="titleExam">${tNo.tName}</h1>
	<div id="container">
		<div id="container1">
			<div id="exams">
				<c:forEach var="exam" items="${selectList}">
					<%-- <c:set var="ttt" value="${exam.eNo}"/>
					<c:set var="jspNo" value="${fn:length(ttt)}"/> --%>
						<c:set var="oddEven" value="${exam.eNo }"/>
						<%-- <c:set var="eNoLength" value="${fn:substring(exam.eNo,fn:length(exam.eNo)-1,fn:length(exam.eNo))}"/> --%>
							<%-- <div class="exWrap ${eNoLength>5&&eNoLength>1?'right':'left' }"> --%>
							<div class="exWrap ${exam.eNo%2==0?'right':'left' }">
								<p><span class="eNo">${exam.eNo }</span>. ${exam.eName }</p>
								<%-- <c:if test="${empty exam.eDescription}"> --%>
								<c:if test="${0 ne exam.eDescription}">
									<%-- <p>""+${exam.tNo.tYear}+"_"+${exam.tNo.tOrder}+"_"+${exam.tNo.tName}+"img/"+${exam.eNo}+".png"</p> --%>
									<%-- <p><img src="${exam.tNo.tYear}_${exam.tNo.tOrder}_${exam.tNo.tName}img/${exam.eNo}.png"></p> --%>
									<p><img src="${pageContext.request.contextPath}/displayFile?fileName=${exam.tNo.tYear}_${exam.tNo.tOrder}_${exam.tNo.tName}/img/${exam.eNo}.png" class="eDescription"></p>
								</c:if>
								<p><input type="radio" name="${exam.eNo}a" value="1" class="contentChk"><span class="content">${exam.eContent }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="2" class="contentChk"><span class="content">${exam.eContent2 }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="3" class="contentChk"><span class="content">${exam.eContent3 }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="4" class="contentChk"><span class="content">${exam.eContent4 }</span></p>
							</div>
				</c:forEach>
			</div>
			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination">
						<%-- <c:if test="${pageMaker.prev == true }">
							<li><a href="#">&laquo</a></li>
						</c:if> --%>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							<%-- <li class="${pageMaker.cri.page == idx?'active':'' }"><a href="listPage?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a></li> --%>
							<li class="${pageMaker.cri.page == idx?'active':'' }"><a href="#" class="idx">${idx }</a></li>
						</c:forEach>
 						<%-- <c:if test="${pageMaker.next == true }">
							<li><a href="#" class="after">&raquo</a></li>
						</c:if> --%>
					</ul>
				</div>
			</div>
		</div>
		<form action="listPage" method="post" id="examSubmit">
			<input type="hidden" name="tNo" value="${tNo.tNo}">
			<div id="container2">
				<p>답안지</p>
				<c:forEach var="exam" items="${list}">
					<p class="omr">
						<span class="eNo2">${exam.eNo }</span>.
						<input type="radio" name="eNo${exam.eNo}" value="1" class="contentChk2" data-eno="${exam.eNo}">
						<input type="radio" name="eNo${exam.eNo}" value="2" class="contentChk2" data-eno="${exam.eNo}">
						<input type="radio" name="eNo${exam.eNo}" value="3" class="contentChk2" data-eno="${exam.eNo}">
						<input type="radio" name="eNo${exam.eNo}" value="4" class="contentChk2" data-eno="${exam.eNo}">
					</p>
				</c:forEach>
				<p>
					<input type="submit" value="제출" id="resultSubmit">
				</p>
			</div>
		</form>
	</div>
</body>
</html>