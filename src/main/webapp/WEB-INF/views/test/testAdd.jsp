<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	body{
		margin: 0;
		padding:0;
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
	#container1{
		width: 1644px;
		margin:0 auto;
		height:771px;		
		background-color: #003b32;
		border: 15px outset #572313;
		color: white;
		overflow: auto;
	}
	#btnAdd{
		width: 300px;
		display:block;
		margin:15px auto;
		border: 5px outset #572313 !important;
		background-color: #003b32;
		color: white;
		padding: 10px 0;
		font-weight: bold;
		font-size: 1.5em;
	}
	.btn-ex{
		border: 5px outset #572313 !important;
		background-color: #003b32 !important;
		color: white !important;
	}
	.btn-ex:hover, .btn-ex:focus{
		background-color: #003b32;
		color: white;
	}
	.modal-dialog{
		border: 5px outset #572313 !important;
		background-color: #003b32;
	}
	.modal-body, .modal-footer{
		background-color: #b48464;
	}
	.marginTop{
		margin-top: 10px;
	}
	.marginBot{
		margin-bottom: 10px;
	}
	.formEx{
		background-color: #b48464;
		float: right;
		width: 900px;
	}
	.formEx p{
		margin: 10px;
	}
	.formEx label{
		width: 150px;
		float: left;
	}
	.formEx input{
		width: 450px;
	}
	.chkEx{
		float: left;
		background-color: #b48464;
		height: 100%;
		font-size: 2.5em;
		width: 200px;
	}
	.chkEx input{
		width: 50px;
		height: 50px;
	}
	.exEdit{
		overflow: hidden;
		width: 1200px;
		margin: 10px auto;
		background: red;
		height: 550px;
	}
	.exEdit input, .exEdit textarea{
		color: white;
		background-color: #003b32; 
	}
	input{
		color: white;
		background-color: #003b32;
	}
	.examEx{
		width: 1100px;
		margin: 20px auto;
		padding: 15px auto;
		font-size: 1.5em;
	}
	.examWrap{
		width: 1000px;
	}
	.btnWrap{
		width: 100px;
	}
	.btnWrap button{
		width: 100px;
		height:50px;
	}
	.mod{
		background-color:red;
	}
	.del{
		background-color:blue;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).on("click", "input[name='subAdd']", function() {
		var tName = $("input[name='newTName']").val();
		var tYear = $("input[name='newTYear']").val();
		var tOrder = $("input[name='newTOrder']").val();
		var tTime = $("input[name='newTTime']").val();
		var sName = $("input[name='newSName']").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/test/subAdd",
			type:"get",
			headers:{"Content-Type":"application/json"},
			data:{
				tName : tName,
				tYear : tYear,
				tOrder : tOrder,
				tTime : tTime,
				sName : sName
			},
			dataType:"json",
			success:function(res){
				console.log(res);
				$("select[name='sName']").empty();
				$.each(res, function(i, obj) {
					var $option = $("<option>").html(obj).val(obj);
					$("select[name='sName']").append($option);
				})
			}
		})
	})
	$(document).on("click", "input[name='testAdd']", function() {
		var tName = $("input[name='newTName']").val();
		var tYear = $("input[name='newTYear']").val();
		var tOrder = $("input[name='newTOrder']").val();
		var tTime = $("input[name='newTTime']").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/test/testAdd",
			type:"get",
			headers:{"Content-Type":"application/json"},
			data:{
				tName : tName,
				tYear : tYear,
				tOrder : tOrder,
				tTime : tTime
			},
			dataType:"json",
			success:function(res){
				console.log(res);
				$("select[name='tName']").empty();
				$.each(res, function(i, obj) {
					var $option = $("<option>").html(obj).val(obj);
					$("select[name='tName']").append($option);
				})
			}
		})
	})
	$(document).on("change", "select[name='tName']", function() {
		$("select[name='tYear']").empty();
		var $soption = $("<option>").text("년도");
		$("select[name='tYear']").append($soption);
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
				$.each(res, function(i, obj) {
					var $option = $("<option>").text(obj);
					$option.attr("value", obj);
					$("select[name='tYear']").append($option);
				})
			}
		})
		var $h1 = $("<h1>");
		var tName = $("<span>").html(selectedVal);
		$h1.append(tName);
	})
	$(document).on("change", "select[name='tYear']", function() {
		$("select[name='tOrder']").empty();
		var $soption = $("<option>").text("차수");
		$("select[name='tOrder']").append($soption);
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
				})
			}
		})
		var $h1 = $("<h1>");
		var tName = $("<span>").html(selectedName+" ");
		var tYear = $("<span>").html(selectedYear+"년");
		$h1.append(tName);
		$h1.append(tYear);
	})
	$(document).on("change", "select[name='tOrder']", function() {
		var selectedName = $("select[name='tName']").val();
		var selectedYear = $("select[name='tYear']").val();
		var selectedOrder = $("select[name='tOrder']").val();
		/* $("select[name='sName']").empty(); */
/* 		var $soption = $("<option>").text("과목");
		$("select[name='sName']").append($soption); */
		$.ajax({
			url:"${pageContext.request.contextPath}/subject/listSubject",
			type:"get",
			headers:{"Content-Type":"application/json"},
			data: {
				tName : selectedName,
				tYear : selectedYear,
				tOrder : selectedOrder
			},
			dataType:"json",
			success:function(res){
				console.log(res);
				$.each(res, function(i, obj) {
					/* var $option = $("<option>").text(obj.sName);
					$option.attr("value", obj);
					$("select[name='sName']").append($option); */
					$conDiv = $("<div>").addClass("examEx").css("overflow", "hidden");
					$div = $("<div>").addClass("examWrap").css("float","left");
					$div2 = $("<div>").addClass("btnWrap").css("float","right");
					$p = $("<p>");
					$eNo = $("<span class='eNo'>").text(obj.eNo+". ");
					$eName = $("<span class='eName'>").text(obj.eName);
					/* $eNo = $("<input name='eNo'>").val(obj.eNo);
					$eName = $("<input name='eName'>").val(obj.eName); */
					if(obj.eDescription!=0){
						$eDescription = $("<img>").attr("src", "${pageContext.request.contextPath}/displayFile?fileName="+obj.tNo.tYear+"_"+obj.tNo.tOrder+"_"+obj.tNo.tName+"/img/"+obj.eNo+".png");
					}
					$eAnswer = $("<span class='eAnswer'>").text(" 답 : "+obj.eAnswer);
					$eContent = $("<p class='eContent'>").text("1. "+obj.eContent);
					$eContent2 = $("<p class='eContent2'>").text("2. "+obj.eContent2);
					$eContent3 = $("<p class='eContent3'>").text("3. "+obj.eContent3);
					$eContent4 = $("<p class='eContent4'>").text("4. "+obj.eContent4);
					$modBtn = $("<button class='mod'>").text("수정").css("display", "block").attr("eNo", obj.eNo).attr("sNo", obj.sNo.sNo);
					$delBtn = $("<button class='del'>").text("삭제").css("display", "block").attr("eNo", obj.eNo).attr("sNo", obj.sNo.sNo);
					/* $eAnswer = $("<input name='eAnswer'>").val(obj.eAnswer);
					$eContent = $("<input name='eContent'>").val(obj.eContent);
					$eContent2 = $("<input name='eContent2'>").val(obj.eContent2);
					$eContent3 = $("<input name='eContent3'>").val(obj.eContent3);
					$eContent4 = $("<input name='eContent4'>").val(obj.eContent4); */
					$p.append($eNo);
					$p.append($eName);
					$p.append($eAnswer);
					$div.append($p);
					if(obj.eDescription!=0){
						$div.append($eDescription);
					}
					$div.append($eContent);
					$div.append($eContent2);
					$div.append($eContent3);
					$div.append($eContent4);
					$div2.append($modBtn);
					$div2.append($delBtn);
					$conDiv.append($div);
					$conDiv.append($div2);
					$("#container1").append($conDiv);
				})
			}
		})
	})
	
	$(document).on("click", ".mod", function() {
		var eNo = $(this).attr("eNo");
		var sNo = $(this).attr("sNo");
		var tName = $("select[name='tName']").val();
		var tYear = $("select[name='tYear']").val();
		var tOrder = $("select[name='tOrder']").val();
		console.log(eNo);
		console.log(sNo);
		console.log(tName);
		console.log(tYear);
		console.log(tOrder);
		window.location.herf="${pageContext.request.contextPath}/exam/mod?eNo="+eNo+"&tName="+tName+"&tYear="+tYear+"&tOrder="+tOrder+"&sNo="+sNo;
	})
</script>
<%@ include file="../include/header.jsp" %>
<div class="content">
	<div class="row">
		<div class="col-xs-4 col-xs-offset-4">
			<button type="button" id="btnAdd" data-toggle="collapse" data-target="#testForm">문제추가</button>
		</div>
	</div>
<%-- 	<form action="${pageContext.request.contextPath}/test/add" method="post" id="exSubmit"> --%>
		<div id="testForm" class="collapse">
			<div class="row marginBot">
				<div class="col-xs-2 col">
					<select name="tName" class="btn btn-block btn-flat btn-ex">
						<option>시험종류</option>
						<c:forEach var="test" items="${list }">
							<option value="${test}">${test}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-xs-2 col">
					<select name="tYear" class="btn btn-block btn-flat btn-ex">
						<option>년도</option>
					</select>
				</div>
				<div class="col-xs-2 col">
					<select name="tOrder" class="btn btn-block btn-flat btn-ex">
						<option>차수</option>
					</select>
				</div>
<!-- 				<div class="col-xs-2 col">
					<select name="sName" class="btn btn-block btn-flat btn-ex">
						<option>과목</option>
					</select>
				</div> -->
				<div class="col-xs-3 col">		
					<input type="button" value="새로 생성" class="btn btn-block btn-flat btn-ex" data-toggle="modal" data-target="#testModal">
				</div>
				<div class="col-xs-3 col">		
					<input type="submit" value="문제 추가" class="btn btn-block btn-flat btn-ex" id="addExamSub">
				</div>
			</div>
		</div>
		<div id="container1">
<%-- 			<c:forEach begin="1" end="100" step="1" var="i">
				<div class="exEdit">
					<div class="chkEx">
						<label>${i }.
						<input type="checkbox" name="examChk" value="${i }"><i class="fas fa-check"></i></label>
					</div>
					<div class="formEx">
						<p>
							<label>시험설명(지문)</label>
							<textarea rows="5" cols="110" name="eName" placeholder="시험설명" class="eName"></textarea>
						</p>
						<p>
							<label>부가설명(이미지)</label>
							<input type="file" name="eDescription" placeholder="문제번호로 저장해주세요.(선택사항)">
						</p>
						<p>
							<label>보기1</label>
							<input type="text" name="eContent" placeholder="보기1" class="eContent"><br>
						</p>
						<p>
							<label>보기2</label>
							<input type="text" name="eContent2" placeholder="보기2" class="eContent2"><br>
						</p>
						<p>
							<label>보기3</label>
							<input type="text" name="eContent3" placeholder="보기3" class="eContent3"><br>
						</p>
						<p>
							<label>보기4</label>
							<input type="text" name="eContent4" placeholder="보기4" class="eContent4">
						</p>
						<p>
							<label>정답</label>
							<input type="number" name="eAnswer" placeholder="정답" min="1" max="4" class="eAnswer">
						</p>
						<p>			
							<label>해설</label>			
							<textarea rows="8" cols="110" name="eSolving" placeholder="문제해설(선택사항)"></textarea>
						</p>
					</div>
				</div>
			</c:forEach> --%>
		</div>
	<!-- </form> -->
	<div id="testModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-body">
	        		<div class="row">
						<div class="col-xs-12">
	        				<input type="text" name="newTName" placeholder="시험명" class="btn btn-block btn-flat btn-ex">
	        			</div>
	        			<div class="col-xs-3 marginTop">
	        				<input type="number" name="newTYear" placeholder="년도" min="1970" max="2020" class="btn btn-block btn-flat btn-ex">
	        			</div>
	        			<div class="col-xs-3 marginTop">
	        				<input type="number" name="newTOrder" placeholder="차수" min="1" max="9" class="btn btn-block btn-flat btn-ex">
	        			</div>
	        			<div class="col-xs-3 marginTop">
	        				<input type="number" name="newTTime" placeholder="시간(초)" min="1800" max="18000" step="60" class="btn btn-block btn-flat btn-ex">
	        			</div>
	        			<div class="col-xs-3 marginTop">
	        				<input type="button" value="시험추가"  name="testAdd" class="btn btn-block btn-flat btn-ex"  data-toggle="collapse" data-target="#subForm">
	        			</div>
	        		</div>
	        		<div id="subForm" class="collapse marginTop">
	        			<div class="row">
							<div class="col-xs-4">
	        					<input type="text" name="newSName" placeholder="시험명" class="btn btn-block btn-flat btn-ex">
	        				</div>        					
							<div class="col-xs-4">
	        					<input type="hidden" class="btn btn-block btn-flat btn-ex">
	        				</div>        					
							<div class="col-xs-4">
	        					<input type="button" value="과목추가" name="subAdd" class="btn btn-block btn-flat btn-ex">
	        				</div>        					
	        			</div>	
	        		</div>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default btn-ex" data-dismiss="modal">Close</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>