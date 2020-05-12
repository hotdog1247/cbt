<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$("form input[type='button']").click(function() {
			
		})
	})
</script>
</head>
<body>
	<form action="login" method="post">
		<p>
			<label>회원아이디</label>
			<input type="text" name="mId">
		</p>
		<p>
			<label>회원비밀번호</label>
			<input type="password" name="mPassword">
		</p>
		<p>
			<input type="submit" value="로그인">
			<input type="button" value="회원가입">
		</p>
	</form>
</body>
</html>