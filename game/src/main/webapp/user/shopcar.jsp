<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="http://game/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>购物车</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/game_favicon.ico" type="image/x-icon" />
<!-- Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/vendor.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/fancybox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/responsive.css">
<!-- a标签悬停出现下划线 -->
<style>
.hover:hover {
	text-decoration: underline;
}
</style>
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
					<a class="main-logo-h1" href="index.jsp"><img
						src="${pageContext.request.contextPath}/assets/img/logo2.png"
						alt="img"></a>
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
						<li><a href="${pageContext.request.contextPath}/findAllShopcar"><img
								src="${pageContext.request.contextPath}/assets/img/icon/2.png"
								alt="icon"></a></li>
						<li><a class="search" href="#"><img
								src="${pageContext.request.contextPath}/assets/img/icon/1.png"
								alt="icon"></a></li>
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
							<h2 class="page-title">购物车</h2>
							<ul class="page-list">
								<li><a href="index.jsp">主页</a></li>
								<li>购物车</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumb end -->

	<section class="blog-page-area pd-top-100 pd-bottom-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="sidebar-area">
						<div class="widget widget-category widget-border">
							<h5 class="widget-title">购物车</h5>
							<form class="contact-form-wrap"
								action="${pageContext.request.contextPath }/sureOrder"
								method="post">
								<table id="customer-list" class="table table-striped">
									<thead>
										<tr>
											<th>游戏名称</th>
											<th>价格</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${shopcars }" var="shopcars">
											<tr>
												<td>${shopcars.gamename }</td>
												<td>${shopcars.gameprice }</td>
												<td><a href="${pageContext.request.contextPath }/deleteShopcar?id=${shopcars.id}">移除</a></td>
												<td>
										</c:forEach>
									</tbody>
								</table>
							</form>
							<br>
							<div>
								<span>预计总额：${sumprice }</span>
								<div align="right">
									<a class="btn btn-base" href="${pageContext.request.contextPath }/sureOrder">购买</a>
								</div>
							</div>
							<div>
								<a href="${pageContext.request.contextPath }/deleteShopcarAll" class="hover">移除所有</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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
	<script src="${pageContext.request.contextPath}/assets/js/vendor.js"></script>
	<!-- main js  -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
