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
<title>Sbeam游戏商城</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/game_favicon.ico" type="image/x-icon" />
<!-- Stylesheet -->
<link rel="stylesheet" href="assets/css/vendor.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/fancybox.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
</head>
<body>

	<!-- navbar start -->
	<div class="navbar-area">
		<nav class="navbar navbar-expand-lg">
			<div class="container nav-container">
				<div class="logo">
					<a class="main-logo-h1" href="#"><img
						src="${pageContext.request.contextPath}/assets/img/logo2.png"
						alt="img"></a>
				</div>
			</div>
		</nav>
	</div>
	<!-- navbar end -->

	<!-- error-page area start -->
	<section class="error-page-area pd-top-100 pd-bottom-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-md-10">
					<div class="error-inner text-center">
						<img src="${pageContext.request.contextPath}/assets/img/404.png" alt="img">
						<h2>出错啦!</h2>
						<p>
							请您登陆账号
						</p>
						<a class="btn btn-base" href="javascript:history.go(-1)">返回上一页</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- error-page area end -->



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
</body>
</html>
