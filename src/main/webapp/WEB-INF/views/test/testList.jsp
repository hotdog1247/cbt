<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	})
</script>
<%@ include file="../include/header.jsp" %>
<div class="content">
	<form action="${pageContext.request.contextPath}/exam/list" method="get">
		<div class="row">
			<div class="col-xs-3 col">
				<select name="tName" class="btn btn-primary btn-block btn-flat">
					<option>시험종류</option>
					<c:forEach var="test" items="${list }">
						<option value="${test}">${test}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-xs-3 col">
				<select name="tYear" class="btn btn-primary btn-block btn-flat">
					<option>년도</option>
				</select>
			</div>
			<div class="col-xs-3 col">
				<select name="tOrder" class="btn btn-primary btn-block btn-flat">
					<option>차수</option>
				</select>
			</div>
			<div class="col-xs-2 col">		
				<input type="submit" value="선택" class="btn btn-primary btn-block btn-flat">
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/footer.jsp" %>