<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$(".signIn").click(function() {
			window.location.href="member/insert";
		}) 
		<c:if test="${error !=null}">
			alert("${error}");
		</c:if>
		$(".searchId").click(function() {
			var mName = $(".mNameForId").val();
			var mEmail = $(".mEmailForId").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/member/find",
				type:"get",
				data:{
					mName: mName,
					mEmail:mEmail
				},
				dataType:"json",
				success:function(res){
					console.log(res);
					alert("아이디 : "+res.mId);
				}
			})
		})
		$(".searchPw").click(function() {
			var mId = $(".mIdForPw").val();
			var mEmail = $(".mEmailForPw").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/member/find",
				type:"get",
				data:{
					mId: mId,
					mEmail:mEmail
				},
				dataType:"json",
				success:function(res){
					console.log(res);
					alert("비밀번호 : "+res.mPassword);
				}
			})
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
  			<a href="#"><b>HOTDOG</b></a>
  		</div>
  		<div class="login-box-body">
  			<form action="login" method="post">
  				<div class="form-group has-feedback">
  					<input type="text" name="mId" class="form-control" placeholder="회원 ID">
  					<span class="glyphicon glyphicon-heart form-control-feedback"></span>
  				</div>
  				<div class="form-group has-feedback">
  					<input type="password" name="mPassword" class="form-control" placeholder="회원  비밀번호">
  					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
  				</div>
  				<div class="row">
  					<div class="col-xs-12">
  						<input type="submit" class="btn btn-primary btn-block btn-flat" value="로그인">
  						<input type="button" class="btn btn-danger btn-block btn-flat signIn" value="회원가입">
  						<input type="button" class="btn btn-warning btn-block btn-flat signSerach" data-toggle="modal" data-target="#myModal" value="아이디 및 비밀번호 찾기">						
  					</div>
  				</div>
  			</form>
  		</div>
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		      <div class="modal-body">
  				<div class="row">
  					<div class="col-xs-6">
  						<button type="button" class="btn btn-success btn-block btn-flat" data-toggle="modal" data-target="#myModalId">아이디 찾기</button>
  					</div>
  					<div class="col-xs-6">
  						<button type="button" class="btn btn-info btn-block btn-flat" data-toggle="modal" data-target="#myModalPw">비밀번호 찾기</button>
  					</div>
		      	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="myModalId" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		      <div class="modal-body">
				<div class="form-group has-feedback">
  					<input type="text" name="mName" class="form-control mNameForId" placeholder="회원 이름">
  					<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
  				</div>
  				<div class="form-group has-feedback">
  					<input type="email" name="mEmail" class="form-control mEmailForId" placeholder="회원  이메일">
  					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
  				</div>
  				<div class="row">
  					<div class="col-xs-12">
  						<input type="button" class="btn btn-danger btn-block btn-flat searchId" value="찾기">
  					</div>
				</div>  				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="myModalPw" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		      <div class="modal-body">
				<div class="form-group has-feedback">
  					<input type="text" name="mId" class="form-control mIdForPw" placeholder="회원 ID">
  					<span class="glyphicon glyphicon-heart form-control-feedback"></span>
  				</div>
  				<div class="form-group has-feedback">
  					<input type="email" name="mEmail" class="form-control mEmailForPw" placeholder="회원  이메일">
  					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
  				</div>
  				<div class="row">
  					<div class="col-xs-12">
  						<input type="button" class="btn btn-danger btn-block btn-flat searchPw" value="찾기">
  					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
  	</div>
  </body>
    <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src='${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js'></script>
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js" type="text/javascript"></script>
</html>