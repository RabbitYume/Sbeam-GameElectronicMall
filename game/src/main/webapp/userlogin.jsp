<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="http://game/common/"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>用户登录</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/game_favicon.ico" type="image/x-icon" />
<!-- Stylesheet -->
<link rel="stylesheet" href="assets/css/vendor.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fancybox.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
</head>
<body>


	<!-- preloader area start -->
	<div class="preloader" id="preloader">
		<div class="preloader-inner">
			<div class="spinner">
				<div class="dot1"></div>
				<div class="dot2"></div>
			</div>
		</div>
	</div>
	<!-- preloader area end -->
	<!-- search popup start-->
	<div class="body-overlay" id="body-overlay"></div>
	<div class="td-search-popup" id="td-search-popup">
		<form
			action="${pageContext.request.contextPath }/userFindLikeGameName"
			method="post" class="search-form">
			<div class="form-group">
				<input type="text" class="form-control" name="gamename"
					placeholder="搜索游戏...">
			</div>
			<button type="submit" class="submit-btn">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>
	<!-- dkt-sitebar-menu end-->

	<!-- dkt-sitebar-menu start-->
	<div class="dkt-sitebar-menu">
		<div class="dkt-sitebar-menu">
			<a class="dkt-sitebar-close" href="#"><i class="fa fa-times"></i></a>
			<div class="dkt-details-inner">
				<%
					if (session.getAttribute("username") == null) {
				%>
				<a href="userlogin.jsp" class="btn btn-base w-100">登录</a> <a
					href="registered.jsp" class="btn btn-base w-100">注册</a>
				<%
					} else {
				%>
				<a class="btn btn-base w-100"
					href="${pageContext.request.contextPath}/userFindOrder">查看订单</a> <br />
				<a class="btn btn-base w-100" href="user/updateUser.jsp">修改密码</a> <br />
				<a class="btn btn-base w-100"
					href="${pageContext.request.contextPath}/userLogout">退出</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<!-- dkt-sitebar-menu end-->

	<!-- navbar start -->
	<div class="navbar-area">
		<nav class="navbar navbar-expand-lg">
			<div class="container nav-container">
				<div class="logo">
					<a class="main-logo-h1" href="index.html"><img
						src="img/logo-min.png" alt="img"></a>
				</div>
				<div class="collapse navbar-collapse" id="dkt_main_menu">
					<ul class="navbar-nav menu-open">
						<li><a href="index.jsp">主页</a></li>
						<li><a href="${pageContext.request.contextPath}/shop">商店
						</a></li>
					</ul>
				</div>
				<div class="nav-right-part nav-right-part-desktop">
					<ul>
						<li><a href="${pageContext.request.contextPath}/shopcar"><img
								src="assets/img/icon/2.png" alt="icon"></a></li>
						<li><a class="search" href="#"><img
								src="assets/img/icon/1.png" alt="icon"></a></li>
						<li class="menu-bar dropdown-menu-btn"><a href="#"><i
								class="fa fa-bars"></i></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- navbar end -->

	<!-- breadcrumb start -->
	<div class="breadcrumb-area" style="background: #49009b">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-inner">
						<div class="section-title text-center">
							<h2 class="page-title">登录</h2>
							<ul class="page-list">
								<li><a href="index.jsp">主页</a></li>
								<li>登录</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumb end -->

	<!-- policy-page start -->
	<section class="pd-top-100 pd-bottom-100 bg-sky-blue">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 col-lg-10 text-center">
					<div class="sign-in-area">
						<h2>登录您的账户</h2>
						<form class="contact-form-wrap"
							action="${pageContext.request.contextPath }/userLogin"
							method="post">
							<div class="single-input-wrap input-group">
								<label for="inp-1">用户名</label> <input id="inp-1" name="username"
									type="text" class="form-control" placeholder="输入您的用户名">
							</div>
							<div class="single-input-wrap input-group">
								<label for="inp-2">密码</label> <input id="inp-2" name="userpwd"
									type="password" class="form-control" placeholder="输入您的密码">
							</div>
							<div class="single-input-wrap input-group">
								<div style="float: left;">
									<input id="inp-1" name="inputStr" type="text"
										class="form-control" placeholder="输入验证码">
								</div>
								<div style="float: left;">
									<img id="imgVerify" style="widtg:70px; height:35px;"
										src="${pageContext.request.contextPath }/getVerify"
										alt="点击更换验证码" /><a href="" rel="nofollow">&nbsp;看不清，换一张</a>
								</div>
							</div>
							<button class="btn btn-base w-100">登录</button>
							<p>
								您是否没有账户？ <a href="registered.jsp">注册</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- policy-page end -->

	<!-- footer area start -->
	<footer class="footer-area pd-top-100">
		<!--Footer bottom-->
		<div class="container">
			<div class="copyright-area">
				<div class="row">
					<div class="col-lg-6 align-self-center">
						<p>©2021 CopyRight RoastRabbit. All rights Reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer area end -->

	<!-- back to top area start -->
	<div class="back-to-top">
		<span class="back-top"><i class="fa fa-angle-up"></i></span>
	</div>
	<!-- back to top area end -->


	<!-- all plugins here -->
	<script src="assets/js/vendor.js"></script>
	<!-- main js  -->
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		$(document.body).ready(
				function() {
					//首次获取验证码
					$("#imgVerify").attr(
							"src",
							"${pageContext.request.contextPath}/getVerify?"
									+ Math.random());
				});
		//获取验证码
		function getVerify() {
			var src1 = document.getElementById('imgVerify')
			src1.src = "${pageContext.request.contextPath}/getVerify?"
					+ Math.random();
		}
	</script>
</body>
</html>

