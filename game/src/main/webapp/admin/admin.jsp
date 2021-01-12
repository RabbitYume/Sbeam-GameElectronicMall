<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="../css/custom.css">
<!-- Theme Style-->
<link rel="stylesheet" id="jssDefault" type="text/css"
	href="../css/theme-purple.css">
<!-- Morris Chart Default Style -->
<link rel="stylesheet" type="text/css" href="../css/morris/morris.css">
<!-- Nano Scroller Default Style -->
<link rel="stylesheet" type="text/css" href="../css/nanoscroller.css">
<!-- Data Tables Default Style -->
<link rel="stylesheet" type="text/css"
	href="../css/datatables/datatables.min.css">
<!-- VMap Script Default Style -->
<link rel="stylesheet" type="text/css" href="../css/vmap/jqvmap.css">
<!-- Date Range Picker Default Style -->
<link rel="stylesheet" type="text/css"
	href="../css/daterangepicker/daterangepicker.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>后台管理</title>
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
					<ul class="nav navbar-nav navbar-right">
						<!-- 退出 -->
						<li class="dropdown user-menu"><a
							href="${pageContext.request.contextPath}/logout"
							class="dropdown-toggle"> <span class="hidden-xs"> 退出登录
							</span></a></li>
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
					<li><a href="#" class="active"><i
							class="fa fa-home" aria-hidden="true"></i> <span
							class="link-hide">主页</span></a></li>
					<!-- 游戏 -->
					<li><a href="#" class="chevron"><i
							class="fa fa-table fa-fw" aria-hidden="true"></i> <span
							class="link-hide"> 游戏 </span></a>
						<ul class="nav nav-second-level">
							<li><a href="${pageContext.request.contextPath}/findAllGame">游戏管理</a></li>
							<li><a href="${pageContext.request.contextPath}/findAllType">游戏类型管理</a></li>
							<li><a
								href="${pageContext.request.contextPath}/findAllGameImg">游戏图片管理</a></li>
						</ul> <!-- /nav-second-level --></li>
					<!-- /li dropdown -->

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
					<!-- /li dropdown -->

					<!-- 订单 -->
					<li><a href="#" class="chevron"><i class="fa fa-wpforms"
							aria-hidden="true"></i> <span class="link-hide"> 订单 </span></a>
						<ul class="nav nav-second-level">
							<li><a
								href="${pageContext.request.contextPath}/findAllOrder">订单管理</a></li>
						</ul> <!-- /nav-second-level --></li>
					<!-- /li dropdown -->

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



			<!-- //////////////////////////////////////////////////// Theme setting for live preview -->
			<div id="theme-settings" class="hidden-xs hidden-sm">
				<div class="header">
					<h3>Select Theme Color</h3>
				</div>
				<!-- /header -->
				<div class="content">
					<div class="theme-color">

						<a href="javascript: void(0)" class="bg m-r-10"
							data-theme="theme-blue" data-toggle="tooltip"
							data-placement="top" title="Blue"> <span class="item bg-blue"></span>
						</a>
						<!--  /bg -->

						<a href="javascript: void(0)" class="bg m-r-10"
							data-toggle="tooltip" data-theme="theme-green"
							data-placement="top" title="Green"> <span
							class="item bg-green"></span>
						</a>
						<!--  /bg -->

						<a href="javascript: void(0)" class="bg m-r-10"
							data-theme="theme-orange" data-toggle="tooltip"
							data-placement="top" title="Orange"> <span
							class="item bg-orange"></span>
						</a>
						<!--  /bg -->

						<a href="javascript: void(0)" class="bg" data-theme="theme-purple"
							data-toggle="tooltip" data-placement="top" title="Purple"> <span
							class="item bg-purple"></span>
						</a>
						<!--  /bg -->

						<a href="javascript: void(0)" class="bg m-r-10"
							data-theme="theme-red" data-toggle="tooltip" data-placement="top"
							title="Red"> <span class="item bg-red"></span>
						</a>
						<!--  /bg -->

						<a href="javascript: void(0)" class="bg m-r-10"
							data-theme="theme-yellow" data-toggle="tooltip"
							data-placement="top" title="Yellow"> <span
							class="item bg-yellow"></span>
						</a>
						<!--  /bg -->

						<a href="javascript: void(0)" class="bg m-r-10"
							data-theme="theme-cyan" data-toggle="tooltip"
							data-placement="top" title="Cyan"> <span class="item bg-cyan"></span>
						</a>
						<!--  /bg -->

						<a href="javascript: void(0)" class="bg" data-theme="theme-pink"
							data-toggle="tooltip" data-placement="top" title="Pink"> <span
							class="item bg-pink"></span>
						</a>
						<!--  /bg -->

					</div>
					<!-- /theme-color -->
					<div class="buttons m-t-10">
						<a href="javascript: void(0)" data-theme="theme-purple"
							class="btn-block btn btn-reset btn-sm bg-red"><span>reset</span></a>
					</div>
					<!-- /buttons -->
				</div>
				<!-- /content -->
			</div>
			<!-- /theme-settings -->

			<div class="row">
				<div class="col-xs-12 dashboard-header">
					<h1 class="dash-title">主页</h1>
					<!-- //////////////////////////////////////////////////// Breadcrumb -->
					<ol class="breadcrumb">
						<li><a href="admin.jsp"><i class="fa fa-home"
								aria-hidden="true"></i> 主页</a></li>
					</ol>
					<!-- /breadcrumb -->
				</div>
				<!-- /dashboard -->
			</div>
			<!-- /row -->

			<div class="row">

				<!-- //////////////////////////////////////////////////// Bar Chart -->
				<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 sale-bar">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="pull-left">Sale</h3>

							<div id="date" class="options pull-right">
								<span> <i class="fa fa-clock-o" aria-hidden="true"></i>
									09.09.2016 - 03.10.2016
								</span> <span class="caret"></span>
							</div>
							<!-- /date -->

						</div>
						<!-- /panel-heading -->

						<div class="panel-body dashboard-panel m-t-10">
							<div class="canvas-holder">
								<canvas id="barChart"></canvas>
							</div>
							<!-- /canvas-holder -->
						</div>
						<!-- /panel-body -->
					</div>
					<!-- /panel-->
				</div>
				<!-- /col -->

				<!-- //////////////////////////////////////////////////// Statistics -->

				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 stat-item">
					<div class="panel">
						<div class="panel-body">
							<div class="col-xs-9 left-content no-padding pull-left">
								<h2>New orders</h2>
								<div class="statistics" data-from="0" data-to="238"
									data-speed="2500" data-refresh-interval="50"></div>
							</div>
							<div class="col-xs-3 right-content no-padding pull-right">
								<span><i class="fa fa-cart-plus" aria-hidden="true"></i></span>
							</div>
						</div>
						<!-- /panel-body -->
						<div class="panel-footer">
							<div class="date">
								<h5>
									<i class="fa fa-clock-o" aria-hidden="true"></i> before
									01-10-2016
								</h5>
							</div>
							<div class="label label-success percent pull-right">
								<i class="fa fa-caret-up" aria-hidden="true"></i> 2.2%
							</div>
						</div>
						<!-- /panel-footer -->
					</div>
					<!-- /panel -->
				</div>
				<!-- /col-lg-3 -->

				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 stat-item">
					<div class="panel">
						<div class="panel-body">
							<div class="col-xs-9 left-content no-padding pull-left">
								<h2>Comments</h2>
								<div class="statistics" data-from="0" data-to="68"
									data-speed="2500" data-refresh-interval="50"></div>
							</div>
							<div class="col-xs-3 right-content no-padding pull-right">
								<span><i class="fa fa-comment" aria-hidden="true"></i></span>
							</div>
						</div>
						<!-- /panel-body -->
						<div class="panel-footer">
							<div class="date">
								<h5>
									<i class="fa fa-clock-o" aria-hidden="true"></i> Today:
									05-09-2016
								</h5>
							</div>
							<div class="label label-success percent pull-right">
								<i class="fa fa-caret-up" aria-hidden="true"></i> 5%
							</div>
						</div>
						<!-- /panel-footer -->
					</div>
					<!-- /panel -->
				</div>
				<!-- /col-lg-3 -->

				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 stat-item">
					<div class="panel">
						<div class="panel-body">
							<div class="col-xs-9 left-content no-padding pull-left">
								<h2>New Users</h2>
								<div class="statistics" data-from="0" data-to="30"
									data-speed="2500" data-refresh-interval="50"></div>
							</div>
							<div class="col-xs-3 right-content no-padding pull-right">
								<span> <i class="fa fa-user" aria-hidden="true"></i></span>
							</div>
						</div>
						<!-- /panel-body -->
						<div class="panel-footer">
							<div class="date">
								<h5>
									<i class="fa fa-clock-o" aria-hidden="true"></i> After:
									01-09-2016
								</h5>
							</div>
							<div class="label label-danger percent pull-right">
								<i class="fa fa-caret-down" aria-hidden="true"></i> 3.5%
							</div>
						</div>
						<!-- /panel-footer -->
					</div>
					<!-- /panel -->
				</div>
				<!-- /col-lg-3 -->

			</div>
			<!-- /row -->


			<div class="row">
				<footer>
					<div id="credits">
						<div class="col-xs-12">
							<p>Copyright© 2021 Develop by RoastRabbit. All Rights
								Reserved.</p>
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
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>

	<!-- Menu Script -->
	<script type="text/javascript" src="../js/menu/metisMenu.min.js"></script>
	<script type="text/javascript" src="../js/menu/nanoscroller.js"></script>

	<!-- Data Range Picker Script -->
	<script type="text/javascript" src="../js/moment.js"></script>
	<script type="text/javascript"
		src="../js/daterangepicker/daterangepicker.js"></script>

	<!-- CountTo Script -->
	<script type="text/javascript" src="../js/countTo/jquery.countTo.js"></script>

	<!-- Morris Chart Script -->
	<script type="text/javascript" src="../js/morris-js/raphael.min.js"></script>
	<script type="text/javascript" src="../js/morris-js/morris.min.js"></script>

	<!-- Chart.js Script -->
	<script type="text/javascript" src="../js/chart-js/Chart.js"></script>

	<!-- Flot.js Script -->
	<script type="text/javascript" src="../js/flot-js/excanvas.min.js"></script>
	<script type="text/javascript" src="../js/flot-js/jquery.flot.js"></script>
	<script type="text/javascript"
		src="../js/flot-js/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="../js/flot-js/jquery.flot.time.js"></script>

	<!-- Data Tables Script -->
	<script type="text/javascript" src="../js/datatables/datatables.min.js"></script>

	<!-- VMap Script -->
	<script type="text/javascript" src="../js/vmap/jquery.vmap.js"></script>
	<script type="text/javascript" src="../js/vmap/maps/jquery.vmap.usa.js"></script>

	<!-- Dashboard script -->
	<script type="text/javascript" src="../js/dashboard.js"></script>

	<!-- Theme Configurator script -->
	<script type="text/javascript" src="../js/jQuery.style.switcher.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			"use strict";
			$('#theme-settings').styleSwitcher();
		});
	</script>
	<!-- Custom scripts -->
	<script type="text/javascript" src="../js/jquery-functions.js"></script>

</body>

</html>