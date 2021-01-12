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

<!-- a标签悬停出现下划线 -->
<style>
.hover:hover{text-decoration:underline;}
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
		<form action="${pageContext.request.contextPath }/userFindLikeGameName"
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
				<a class="btn btn-base w-100" href="${pageContext.request.contextPath}/userFindOrder">查看订单</a>
				<br />
				<a class="btn btn-base w-100" href="user/updateUser.jsp">修改密码</a>
				<br />
				<a class="btn btn-base w-100" href="${pageContext.request.contextPath}/userLogout">退出</a>
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
						src="${pageContext.request.contextPath}/assets/img/logo2.png" alt="img"></a>
				</div>
				<div class="collapse navbar-collapse" id="dkt_main_menu">
					<ul class="navbar-nav menu-open">
						<li><a href="index.jsp">主页</a></li>
						<li><a href="${pageContext.request.contextPath}/shop">商店 </a></li>
					</ul>
				</div>
				<div class="nav-right-part nav-right-part-desktop">
					<ul>
						<li><a href="${pageContext.request.contextPath}/findAllShopcar"><img src="${pageContext.request.contextPath}/assets/img/icon/2.png"
								alt="icon"></a></li>
						<li><a class="search" href="#"><img
								src="${pageContext.request.contextPath}/assets/img/icon/1.png" alt="icon"></a></li>
						<li class="menu-bar dropdown-menu-btn"><a href="#"><i
								class="fa fa-bars"></i></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- navbar end -->

	<!-- banner start -->
	<div class="banner-area" style="background: url(img/banner.png);">
		<div class="container">
			<div class="banner-area-inner">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="banner-inner text-center">
							<h2>
								Best <br> <span>Games Marketplace</span>
							</h2>
							<p>拥有大部分热门游戏</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- banner end -->

	<!-- all-item area start -->
	<section class="all-item-area pd-top-90 pd-bottom-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="section-title">
						<h2>热门游戏</h2>
					</div>
				</div>
				<div class="col-lg-8 mt-2">
					<div class="isotope-filters item-isotope-btn text-lg-right">
						<button class="button active ml-0" data-filter="*">所有种类</button>
						<button class="button" data-filter=".cat-1">角色扮演</button>
						<button class="button" data-filter=".cat-2">恐怖</button>
						<button class="button" data-filter=".cat-3">合作</button>
					</div>
				</div>
			</div>
			<div class="all-item-section">
				<div class="item-isotope row">
					<div class="item-sizer col-1"></div>
					<!-- gallery item start here -->
					<div class="all-isotope-item col-lg-4 col-sm-6 cat-1">
						<div class="thumb">
							<a class="gallery-fancybox" href="#"> <img
								src="img/game/2077.png" alt="image" height="175" width="400">
							</a> <a class="btn btn-white" href="${pageContext.request.contextPath }/buyNow?gameid=1&gamename=赛博朋克2077&price=298">立即购买</a>
						</div>
						<div class="item-details">
							<span class="price">￥298.00</span> <span
								class="ratting float-right"> <a href="${pageContext.request.contextPath }/insertShopCar?gameid=1&price=298" class="hover"> <span>加入购物车</span>
							</a>
							</span>
							<h4> 赛博朋克2077 </h4>
							<p>CD PROJEKT RED</p>
						</div>
					</div>
					<div class="all-isotope-item col-lg-4 col-sm-6 cat-1">
						<div class="thumb">
							<a class="gallery-fancybox" href="#"> <img
								src="img/game/theWitcher3.png" alt="image" height="175" width="400">
							</a> <a class="btn btn-white" href="${pageContext.request.contextPath }/buyNow?gameid=2&gamename=巫师3：狂猎&price=127">立即购买</a>
						</div>
						<div class="item-details">
							<span class="price">￥127.00</span> <span
								class="ratting float-right"> <a href="${pageContext.request.contextPath }/insertShopCar?gameid=2&price=127" class="hover"> <span>加入购物车</span>
								</a>
							</span>
							<h4>巫师3：狂猎</h4>
							<p>CD PROJEKT RED</p>
						</div>
					</div>
					<div class="all-isotope-item col-lg-4 col-sm-6 cat-2">
						<div class="thumb">
							<a class="gallery-fancybox" href="#"> <img
								src="img/game/deadbydaylight.png" alt="image" height="175" width="400">
							</a> <a class="btn btn-white" href="${pageContext.request.contextPath }/buyNow?gameid=18&gamename=Dead by Daylight&price=82">立即购买</a>
						</div>
						<div class="item-details">
							<span class="price">￥82.00</span> <span
								class="ratting float-right"> 
								<a href="${pageContext.request.contextPath }/insertShopCar?gameid=18&price=82" class="hover"> <span>加入购物车</span></a>
							</span>
							<h4>Dead by Daylight</h4>
							<p>Behaviour Interactive Inc.</p>
						</div>
					</div>
					<div class="all-isotope-item col-lg-4 col-sm-6 cat-2">
						<div class="thumb">
							<a class="gallery-fancybox" href="#"> <img
								src="img/game/theforest.png" alt="image" height="175" width="400">
							</a> <a class="btn btn-white" href="${pageContext.request.contextPath }/buyNow?gameid=19&gamename=The Forest&price=70">立即购买</a>
						</div>
						<div class="item-details">
							<span class="price">￥70.00</span> <span
								class="ratting float-right">
								<a href="${pageContext.request.contextPath }/insertShopCar?gameid=19&price=70" class="hover"> <span>加入购物车</span></a>
							</span>
							<h4>The Forest</h4>
							<p>Endnight Games Ltd</p>
						</div>
					</div>
					<div class="all-isotope-item col-lg-4 col-sm-6 cat-3">
						<div class="thumb">
							<a class="gallery-fancybox" href="#"> <img
								src="img/game/battleblock.png" alt="image" height="175" width="400">
							</a> <a class="btn btn-white" href="${pageContext.request.contextPath }/buyNow?gameid=12&gamename=BattleBlock Theater&price=48">立即购买</a>
						</div>
						<div class="item-details">
							<span class="price">￥48.00</span> <span
								class="ratting float-right"><a href="${pageContext.request.contextPath }/insertShopCar?gameid=12&price=48" class="hover"> <span>加入购物车</span></a>
							</span>
							<h4>BattleBlock Theater</h4>
							<p>The Behemoth</p>
						</div>
					</div>
					<div class="all-isotope-item col-lg-4 col-sm-6 cat-3">
						<div class="thumb">
							<a class="gallery-fancybox" href="#"> <img
								src="img/game/lostcastle.png" alt="image" height="175" width="400">
							</a> <a class="btn btn-white" href="${pageContext.request.contextPath }/buyNow?gameid=17&gamename=失落城堡&price=33">立即购买</a>
						</div>
						<div class="item-details">
							<span class="price">￥33.00</span> <span
								class="ratting float-right"><a href="${pageContext.request.contextPath }/insertShopCar?gameid=17&price=33" class="hover"> <span>加入购物车</span></a>
							</span>
							<h4>失落城堡</h4>
							<p>Hunter Studio</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<a class="btn btn-base" href="${pageContext.request.contextPath}/shop">更多游戏</a>
				</div>
			</div>
		</div>
	</section>
	<!-- all-item area end -->

	<!-- footer area start -->
	<footer class="footer-area pd-top-100">
		<!--Footer bottom-->
		<div class="container">
			<div class="copyright-area">
				<div class="row">
					<div class="col-lg-6 align-self-center"><p>©2021 CopyRight RoastRabbit. All rights Reserved.</p></div>
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
