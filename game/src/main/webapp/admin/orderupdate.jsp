<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int id = Integer.parseInt(request.getParameter("id"));//用request得到
	String pay = request.getParameter("pay");
	String gamename = request.getParameter("gamename");
	String price = request.getParameter("price");
	String time = request.getParameter("time");
	int orderid = Integer.parseInt(request.getParameter("orderid"));
	String username = request.getParameter("username");
	String gamekey = request.getParameter("gamekey");
	request.setAttribute("pay", pay);
	request.setAttribute("gamekey", gamekey);
	request.setAttribute("time", time);
	request.setAttribute("username", username);
	request.setAttribute("orderid", orderid);
	request.setAttribute("price", price);
	request.setAttribute("gamename", gamename);
	request.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="HTML, CSS, JavaScript">
<meta name="description" content="Admin Template">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/game_favicon.ico" type="image/x-icon" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- Custom Style-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/custom.css">
<!-- Theme Style-->
<link rel="stylesheet" id="jssDefault" type="text/css"
	href="${pageContext.request.contextPath}/css/theme-purple.css">
<!-- Morris Chart Default Style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/morris/morris.css">
<!-- Nano Scroller Default Style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nanoscroller.css">
<!-- Data Tables Default Style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/datatables/datatables.min.css">
<!-- VMap Script Default Style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/vmap/jqvmap.css">
<!-- Date Range Picker Default Style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/daterangepicker/daterangepicker.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>修改游戏信息</title>
</head>
<body>
	<!--  标题栏 -->
	<div id="header-panel">
		<nav class="navbar navbar-fixed-top">
			<div class="container-fluid">
				<div id="navbar-header">
					<!-- 返回主页 -->
					<a class="navbar-brand" href="admin.jsp"> <span
						class="logo-text hidden-xs hidden-sm">后台管理</span>
					</a>
					<!-- 搜索 -->
					<form class="navbar-form navbar-left hidden-xs"
						action="${pageContext.request.contextPath }/findLikeOrderid"
						method="post">
						<div class="form-group">
							<input type="text" name="orderid" class="form-control"
								placeholder="搜索订单编号">
							<button type="submit" class="btn btn-search">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<!-- 退出 -->
						<li class="dropdown user-menu"><a
							href="${pageContext.request.contextPath}/logout"
							class="dropdown-toggle"> <span
								class="hidden-xs"> 退出登录 </span></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- /标题栏 -->

	<!-- 左侧菜单栏 -->
	<div id="navigation-panel" class="">
		<nav class="sidebar nano">

			<div class="clearfix"></div>

			<div id="#sidebar-navbar"
				class="sidebar-nav nano-content navbar-collapse ">
				<ul class="nav" id="side-menu">
					<!-- 主页Link -->
					<li><a href="admin/admin.jsp"><i class="fa fa-home"
							aria-hidden="true"></i> <span class="link-hide">主页</span></a></li>
					<!-- 游戏 -->
					<li><a href="#" class="chevron"><i
							class="fa fa-table fa-fw" aria-hidden="true"></i> <span
							class="link-hide"> 游戏 </span></a>
						<ul class="nav nav-second-level">
							<li><a href="${pageContext.request.contextPath}/findAllGame">游戏管理</a></li>
							<li><a href="${pageContext.request.contextPath}/findAllType">游戏类型管理</a></li>
							<li><a href="${pageContext.request.contextPath}/findAllGameImg">游戏图片管理</a></li>
						</ul> <!-- /nav-second-level --></li>
					<!-- /li 游戏 -->

					<!-- 游戏厂商 -->
					<li><a href="#" class="chevron"><i class="fa fa-sitemap"
							aria-hidden="true"></i> <span class="link-hide"> 游戏厂商 </span></a>
						<ul class="nav nav-second-level">
							<ul class="nav nav-second-level">
								<li><a
									href="${pageContext.request.contextPath}/findAllSupplier">游戏厂商管理</a></li>
							</ul>
							<!-- /nav-second-level -->
						</ul> <!-- /nav-second-level --></li>
					<!-- /li 游戏厂商 -->

					<!-- 订单 -->
					<li><a href="#" class="chevron active"><i
							class="fa fa-wpforms" aria-hidden="true"></i> <span
							class="link-hide"> 订单 </span></a>
						<ul class="nav nav-second-level">
							<li><a
								href="${pageContext.request.contextPath}/findAllOrder"
								class="active">订单管理</a></li>
						</ul> <!-- /nav-second-level --></li>
					<!-- /li 订单 -->

					<!-- 用户 -->
					<li><a href="#" class="chevron"><i class="fa fa-desktop"
							aria-hidden="true"></i> <span class="link-hide"> 用户 </span></a>
						<ul class="nav nav-second-level">
							<li><a href="${pageContext.request.contextPath}/findAll">用户管理</a></li>
						</ul> <!-- /nav-second-level --></li>
					<!-- /li 用户 -->
				</ul>
				<!-- /side-menu -->
			</div>
			<!-- /sidebar-nav -->

		</nav>
		<!-- /sidebar-->
	</div>
	<!-- /左侧菜单栏 -->

	<!-- //////////////////////////////////////////////////// Content-Panel div -->

	<div id="content-panel">
		<div class="container-fluid">

			<div class="row">
				<div class="col-xs-12 dashboard-header">
					<h1 class="dash-title">订单管理</h1>
					<!-- //////////////////////////////////////////////////// Breadcrumb -->
					<ol class="breadcrumb">
						<li><a href="admin.jsp"><i class="fa fa-home"
								aria-hidden="true"></i> 主页</a></li>
						<li><a href="${pageContext.request.contextPath}/findAllOrder">订单管理</a></li>
						<li><a href="#" class="active">修改订单信息</a></li>
					</ol>
					<!-- /breadcrumb -->

				</div>
				<!-- /dashboard -->
			</div>
			<!-- /row -->

			<div class="row">

				<!-- //////////////////////////////////////////////////// Register Validation  -->
				<div class=" col-xs-12">
					<div class="panel">

						<div class="panel-heading">
							<h3>修改订单信息</h3>
						</div>
						<!-- /panel-heading -->

						<div class="panel-body m-t-0">
							<form data-toggle="validator"
								action="${pageContext.request.contextPath }/updateOrder"
								method="post">
								<div class="form-group m-t-0">
									<label class="control-label">编号</label> <input
										class="form-control" id="disabledInput" type="text"
										value="<%=id%>" name="id" readonly="true" required>
									<div class="help-block with-errors"></div>
								</div>
								<div class="form-group">
									<label for="Name" class="control-label">游戏名称</label>
									<div class="input-group">
										<span class="input-group-addon bg-purple" id="basic-addon1"><i
											class="fa fa-user" aria-hidden="true"></i></span> <input type="text"
											class="form-control" value="<%=gamename%>" id="Name"
											name="gamename" placeholder="游戏名称"
											data-error="Your name is invalid" required>
									</div>
									<!-- /input-group -->
								</div>
								<!-- /form-group -->

								<div class="input-group m-t-20">
									<span class="input-group-addon bg-purple">￥</span> <input
										type="text" class="form-control" name="price"
										value="<%=price%>" aria-label="Amount (to the nearest dollar)"
										placeholder="价格" data-error="Your name is invalid" required>
								</div>
								<!-- /input-group -->

								<br>
								<div class="form-group">
									<label for="Name" class="control-label">下单时间</label>
									<div class="input-group">
										<span class="input-group-addon bg-purple" id="basic-addon1"><i
											class="fa fa-user" aria-hidden="true"></i></span> <input type="text"
											class="form-control" value="<%=time%>" id="Name" name="time"
											placeholder="下单时间" readonly="true" required>
									</div>
									<!-- /input-group -->
								</div>
								<!-- /form-group -->
								<div class="form-group">
									<label for="Name" class="control-label">是否支付</label>
									<div class="panel-body m-t-0">
										<div class="radio inline radio-purple">
											<input id="male02" type="radio" name="pay" value="是">
											<label for="male02"><span>是</span></label>
										</div>
										<!-- /radio -->
										<div class="m-l-10 radio inline radio-purple">
											<input id="female02" type="radio" name="pay" value="否">
											<label for="female02"><span>否</span></label>
										</div>
									</div>
									<!-- /radio -->
								</div>
								<!-- /panel-body -->

								<div class="form-group">
									<label for="Name" class="control-label">用户名</label>
									<div class="input-group">
										<span class="input-group-addon bg-purple" id="basic-addon1"><i
											class="fa fa-user" aria-hidden="true"></i></span> <input type="text"
											class="form-control" value="<%=username%>" id="Name"
											name="username" placeholder="用户名" readonly="true" required>
									</div>
									<!-- /input-group -->
								</div>
								<!-- /form-group -->

								<div class="form-group">
									<label for="Name" class="control-label">激活码</label>
									<div class="input-group">
										<span class="input-group-addon bg-purple" id="basic-addon1"><i
											class="fa fa-user" aria-hidden="true"></i></span> <input type="text"
											class="form-control" value="<%=gamekey%>" id="Name" name="gamekey"
											placeholder="激活码" readonly="true" required>
									</div>
									<!-- /input-group -->
								</div>
								<!-- /form-group -->


								<div class="form-group">
									<input type="submit" value="提交" class="btn btn-md bg-purple"></input>
								</div>
								<!-- /form-group -->
							</form>
							<!-- /form -->
						</div>
						<!-- /panel-body -->
					</div>
					<!-- /panel-->
				</div>
				<!-- /col -->

			</div>
			<!-- /row -->
			<!-- //////////////////////////////////////////////////// Footer -->
			<div class="row">
				<footer>
					<div id="credits">
						<div class="col-xs-12">
							<p> Copyright© 2021 Develop by RoastRabbit. All Rights Reserved.</p>
						</div>
						<!-- /col-sm-12 -->
					</div>
					<!-- /credits -->
				</footer>
				<!-- /footer-->
			</div>
			<!-- /row -->

		</div>
		<!-- /container-fluid -->
	</div>
	<!-- /content-panel -->


	<!-- /////////////////////////////// Scripts /////////////////////////////// -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
	<!-- Offline jQuery script -->
	<!-- <script  type="text/javascript" src="jquery.min"></script>  -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<!-- Menu Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/menu/metisMenu.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/menu/nanoscroller.js"></script>

	<!-- Data Range Picker Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/moment.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/daterangepicker/daterangepicker.js"></script>

	<!-- CountTo Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/countTo/jquery.countTo.js"></script>

	<!-- Morris Chart Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/morris-js/raphael.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/morris-js/morris.min.js"></script>

	<!-- Chart.js Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/chart-js/Chart.js"></script>

	<!-- Flot.js Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/flot-js/excanvas.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/flot-js/jquery.flot.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/flot-js/jquery.flot.resize.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/flot-js/jquery.flot.time.js"></script>

	<!-- Data Tables Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/datatables/datatables.min.js"></script>

	<!-- VMap Script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/vmap/jquery.vmap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/vmap/maps/jquery.vmap.usa.js"></script>

	<!-- Dashboard script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/dashboard.js"></script>

	<!-- Theme Configurator script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jQuery.style.switcher.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			"use strict";
			$('#theme-settings').styleSwitcher();
		});
	</script>
	<!-- Custom scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-functions.js"></script>
</body>
</html>