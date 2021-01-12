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
<title>Sbeam游戏商城</title>

<!-- a标签悬停出现下划线 -->
<style>
.hover:hover {
	text-decoration: underline;
}
</style>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/game_favicon.ico" type="image/x-icon" />
<!-- Stylesheet -->
<link rel="stylesheet" href="assets/css/vendor.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
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
						<li><a href="${pageContext.request.contextPath}/findAllShopcar"><img src="assets/img/icon/2.png"
								alt="icon"></a></li>
						<li><a class="search" href="${pageContext.request.contextPath }/buyNow?gameid=${row.id }&gamename=${row.gamename }&price=${row.price}"><img
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

	<!-- banner start -->
	<div class="breadcrumb-area" style="background: url(img/banner.png);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-inner">
						<div class="section-title text-center">
							<h2 class="page-title">游戏</h2>
							<ul class="page-list">
								<li><a href="index.jsp">主页</a></li>
								<li>游戏</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- banner end -->

	<!-- blog-page area start -->
	<section class="blog-page-area pd-top-100 pd-bottom-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 order-lg-last">
					<div class="all-item-section all-item-area-2">
						<div class="row">
							<!-- gallery item start here -->
							<c:forEach items="${page.rows }" var="row">
								<div class="all-isotope-item col-lg-6 col-sm-6">
									<div class="thumb">
										<a class="btn btn-white" href="#">立即购买</a> <img
											src="${row.imgurl}" height="159" width="360">
									</div>
									<div class="item-details">
										<h4>${row.gamename }</h4>
										<p>${row.suppliername}</p>
										<a href="${pageContext.request.contextPath }/insertShopCar?gameid=${row.id }&price=${row.price}" class="author-details align-item-center"> <span>加入购物车</span>
										</a> <span class="price bg-white float-right">￥${row.price}</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- gallery item end here -->
					<div class="pagination-wrap text-center mt-2">
						<page:page
							url="${pageContext.request.contextPath }/findGamePriceBetween" />
					</div>
				</div>
				<div class="col-lg-4 order-lg-first">
					<div class="sidebar-area">
						<div class="widget widget-category widget-border">
							<h5 class="widget-title">排序</h5>
							<ul>
								<li><a href="${pageContext.request.contextPath}/shop">默认<i
										class="la la-angle-right"></i></a></li>
								<li><a
									href="${pageContext.request.contextPath}/findGamePriceH2L">价格由高至低<i
										class="la la-angle-right"></i></a></li>
								<li><a
									href="${pageContext.request.contextPath}/findGamePriceL2H">价格由低至高<i
										class="la la-angle-right"></i></a></li>
							</ul>
						</div>
						<div class="widget widget-tags widget-border">
							<h5 class="widget-title">类别</h5>
							<div class="tagcloud">
								<c:forEach items="${typelist}" var="type">
									<a
										href="${pageContext.request.contextPath}/userFindByGameType?typeid=${type.id}">${type.type}</a>
								</c:forEach>
							</div>
						</div>
						<div class="widget widget-product-sorting widget-border">
							<h5 class="widget-title">依价格缩小范围</h5>
							<form
								action="${pageContext.request.contextPath }/findGamePriceBetween"
								method="post" class="search-form">
								<label>价格：</label> <input type="range" id="range1" min="0"
									max="300" name="max" step="10" onchange="b.value=this.value" />
								<output id="b" for="range1"></output>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button style="height: 35px;" type="submit">搜索</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- blog-page area end -->


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
