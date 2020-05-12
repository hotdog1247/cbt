<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function () {
		$("form").submit(function() {
			if($("input[name='mId']").val() typeof null){
				alert("아이디 입력");
				return false;
			}
		})
	})
</script>
<body>
	<form action="insert" method="post">
		<fieldset>
			<legend>회원등록</legend>
			<p>
				<label>회원아이디</label>
				<input type="text" name="mId">
			</p>
			<p>
				<label>회원비밀번호</label>
				<input type="password" name="mPassword">
			</p>
			<p>
				<label>회원이름</label>
				<input type="text" name="mName">
			</p>
			<p>
				<label>회원닉네임</label>
				<input type="text" name="mNickname">
			</p>
			<p>
				<label>회원이메일</label>
				<input type="email" name="mEmail">
			</p>
			<p>
				<input type="submit" value="회원등록">
			</p>
		</fieldset>
	</form>
</body>
</html>