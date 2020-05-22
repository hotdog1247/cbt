<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
  <head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
  </head>
  <body class="login-page">
  	<div class="login-box">
  		<div class="login-logo">
  			<a href="#"><b>돌아가기</b></a>
  		</div>
  		<div class="login-box-body">
  			<form action="${pageContext.request.contextPath }/member/insert" method="post">
  				<div class="form-group has-feedback">
  					<input type="text" name="mId" class="form-control" placeholder="회원 ID">
  					<span class="glyphicon glyphicon-heart form-control-feedback"></span>
  				</div>
  				<div class="form-group has-feedback">
  					<input type="password" name="mPassword" class="form-control" placeholder="회원 비밀번호">
  					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
  				</div>
  				<div class="form-group has-feedback">
  					<input type="text" name="mName" class="form-control" placeholder="회원이름">
  					<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
  				</div>
  				<div class="form-group has-feedback">
  					<input type="email" name="mEmail" class="form-control" placeholder="회원 Email">
  					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
  				</div>
  				<div class="row">
  					<div class="col-xs-12 col">
  						<input type="submit" class="btn btn-primary btn-block btn-flat" value="회원가입">
  					</div>
  				</div>
  			</form>
  		</div>
  	</div>
  </body>
    <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src='${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js'></script>
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js" type="text/javascript"></script>
</html>