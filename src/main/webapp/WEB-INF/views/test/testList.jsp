<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.btn-ex{
		background-color: #572313;
		color: white;
	}
	.btn-ex:hover{
		color: white !important;
	}
	h1{
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).on("submit", "form", function() {
		var selectName = $("select[name='tName']").val();
		var selectYear = $("select[name='tYear']").val();
		var selectOrder = $("select[name='tOrder']").val();
		if(selectName =="시험종류"){
			alert("시험명을 선택해주세요");
			return false;
		}
		if(selectYear =="년도"){
			alert("년도를 선택해주세요");
			return false;
		}
		if(selectOrder =="차수"){
			alert("차수를 선택해주세요");
			return false;
		}
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
		$("#container1").empty();
		var $h1 = $("<h1>");
		var tName = $("<span>").html(selectedVal);
		$h1.append(tName);
		$("#container1").append($h1);
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
		$("#container1").empty();
		var $h1 = $("<h1>");
		var tName = $("<span>").html(selectedName+" ");
		var tYear = $("<span>").html(selectedYear+"년");
		$h1.append(tName);
		$h1.append(tYear);
		$("#container1").append($h1);
	})
	$(document).on("change", "select[name='tOrder']", function() {
		var selectedName = $("select[name='tName']").val();
		var selectedYear = $("select[name='tYear']").val();
		var selectedOrder = $("select[name='tOrder']").val();
		$("#container1").empty();
		var $h1 = $("<h1>");
		var tName = $("<span>").html(selectedName+" ");
		var tYear = $("<span>").html(selectedYear+"년 ");
		var tOrder = $("<span>").html(selectedOrder+"차");
		$h1.append(tName);
		$h1.append(tYear);
		$h1.append(tOrder);
		$("#container1").append($h1);
	})
</script>
<%@ include file="../include/header.jsp" %>
<div class="content">
	<form action="${pageContext.request.contextPath}/exam/list" method="get">
		<div class="row">
			<div class="col-xs-3 col">
				<select name="tName" class="btn btn-block btn-flat btn-ex">
					<option>시험종류</option>
					<c:forEach var="test" items="${list }">
						<option value="${test}">${test}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-xs-3 col">
				<select name="tYear" class="btn btn-block btn-flat btn-ex">
					<option>년도</option>
				</select>
			</div>
			<div class="col-xs-3 col">
				<select name="tOrder" class="btn btn-block btn-flat btn-ex">
					<option>차수</option>
				</select>
			</div>
			<div class="col-xs-3 col">		
				<input type="submit" value="선택" class="btn btn-block btn-flat btn-ex">
			</div>
		</div>
	</form>
	<div id="container1">
	
	</div>
</div>
<%@ include file="../include/footer.jsp" %>