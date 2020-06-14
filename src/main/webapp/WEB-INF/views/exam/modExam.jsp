<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="exam/mod" method="post">
		<fieldset>
			<legend>${exam.tNo.tName } ${exam.tNo.tYear }년 ${exam.tNo.tOrder }차<%--  ${exam.sNo.sName } --%> ${exam.eNo }번 문제</legend>
			<%-- <p>
				<label>문제번호</label>
				<input type="text" value="${exam.eNo }">
			</p> --%>
			<p>
				<label>문제이름</label>
				<textarea rows="10" cols="50" name="eName">${exam.eName }</textarea>
				<input type="hidden" value="${exam.tNo.tNo}" name="tNo">
				<input type="hidden" value="${exam.sNo.sNo}" name="sNo">
			</p>
			<p>
				<label>지문1</label>
				<textarea rows="10" cols="50" name="eContent">${exam.eContent }</textarea>
			</p>
			<p>
				<label>지문2</label>
				<textarea rows="10" cols="50" name="eContent2">${exam.eContent2 }</textarea>
			</p>
			<p>
				<label>지문3</label>
				<textarea rows="10" cols="50" name="eContent3">${exam.eContent3 }</textarea>
			</p>
			<p>
				<label>지문4</label>
				<textarea rows="10" cols="50" name="eContent">${exam.eContent4 }</textarea>
			</p>
			<p>
				<label>답</label>
				<input type="number"  name="eAnswer" value="${exam.eAnswer }" min="1" max="4">
			</p>
			<p>
				<button>뒤로가기</button>
				<input type="submit" value="수정">
			</p>
		</fieldset>
	</form>
</body>
</html>