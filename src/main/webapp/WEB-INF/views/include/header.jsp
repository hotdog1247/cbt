<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>CBT TEST</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
  </head>
    <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <body class="skin-blue sidebar-mini">
    <div class="wrapper">
      <header class="main-header">
        <a href="${pageContext.request.contextPath }/" class="logo">
          <span class="logo-mini">TEST</span>
          <span class="logo-lg"><b>CBT</b> TEST</span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="${pageContext.request.contextPath }/resources/dist/img/sponge.jpg" class="user-image" alt="User Image"/>
                  <span class="hidden-xs">${Auth }</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="user-header">
                    <img src="${pageContext.request.contextPath }/resources/dist/img/sponge.jpg" class="img-circle" alt="User Image" />
                    <p>
                      ${Auth }
                    </p>
                  </li>
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="${pageContext.request.contextPath}/member/logout" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <aside class="main-sidebar">
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="${pageContext.request.contextPath }/resources/dist/img/sponge.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>${Auth }</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <ul class="sidebar-menu">
            <li><a href="${pageContext.request.contextPath }/test/list"><i class="fa fa-book"></i> <span>문제풀기</span></a></li>
           	<li><a href="${pageContext.request.contextPath }/member/testResult"><i class="fa fa-edit"></i>시험현황 및 오답노트</a></li>
            <li><a href="${pageContext.request.contextPath }/board/list"><i class="fa fa-book"></i> <span>자유게시판</span></a></li>
          </ul>
        </section>
      </aside>
      <div class="content-wrapper">
        <!-- <section class="content-header">
        </section> -->
	
	