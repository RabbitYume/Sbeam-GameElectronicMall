<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int id = Integer.parseInt(request.getParameter("id"));//用request得到
	String suppliername = request.getParameter("suppliername");
	request.setAttribute("suppliername", suppliername);
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
<title>修改游戏厂商信息</title>
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
						action="${pageContext.request.contextPath }/findLikeSupplierName"
						method="post">
						<div class="form-group">
							<input type="text" name="suppliername" class="form-control"
								placeholder="搜索游戏厂商名称">
							<button type="submit" class="btn btn-search">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<!-- 退出 -->
						<li class="dropdown user-menu"><a
							href="${pageContext.request.contextPath}/logout"
							class="dropdown-toggle" > <span
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
					<!-- /li dropdown -->

					<!-- 游戏厂商 -->
					<li><a href="#" class="chevron active"><i class="fa fa-sitemap"
							aria-hidden="true"></i> <span class="link-hide"> 游戏厂商 </span></a>
						<ul class="nav nav-second-level">
							<ul class="nav nav-second-level">
								<li><a href="${pageContext.request.contextPath}/findAllSupplier" class="active">游戏厂商管理</a></li>
							</ul>
							<!-- /nav-second-level -->
						</ul> <!-- /nav-second-level --></li>
					<!-- /li 游戏厂商 -->

					<!-- 订单 -->
					<li><a href="#" class="chevron"><i class="fa fa-wpforms"
							aria-hidden="true"></i> <span class="link-hide"> 订单 </span></a>
						<ul class="nav nav-second-level">
							<li><a href="${pageContext.request.contextPath}/findAllOrder">订单管理</a></li>
						</ul> <!-- /nav-second-level --></li>
					<!-- /li dropdown -->

					<!-- 用户 -->
					<li><a href="#" class="chevron"><i
							class="fa fa-desktop" aria-hidden="true"></i> <span
							class="link-hide"> 用户 </span></a>
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
					<h1 class="dash-title">游戏厂商管理</h1>
					<!-- //////////////////////////////////////////////////// Breadcrumb -->
					<ol class="breadcrumb">
						<li><a href="admin.jsp"><i class="fa fa-home"
								aria-hidden="true"></i> 主页</a></li>
						<li><a
							href="${pageContext.request.contextPath}/findAllSupplier">游戏厂商管理</a></li>
						<li><a href="#" class="active">修改游戏厂商信息</a></li>
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
							<h3>修改游戏厂商信息</h3>
						</div>
						<!-- /panel-heading -->

						<div class="panel-body m-t-0">
							<form data-toggle="validator"
								action="${pageContext.request.contextPath }/updateSupplier"
								method="post">
								<div class="form-group m-t-0">
									<label class="control-label">编号</label> <input
										class="form-control" id="disabledInput" type="text"
										value="<%=id%>" name="id" readonly="true" required>
									<div class="help-block with-errors"></div>
								</div>
								<div class="form-group">
									<label for="Name" class="control-label">游戏厂商名称</label>
									<div class="input-group">
										<span class="input-group-addon bg-purple" id="basic-addon1"><i
											class="fa fa-user" aria-hidden="true"></i></span> <input type="text"
											class="form-control" id="Name" name="suppliername"
											placeholder="游戏厂商名称" value="<%=suppliername%>" data-error="Your name is invalid"
											required>
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