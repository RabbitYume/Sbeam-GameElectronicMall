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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="HTML, CSS, JavaScript">
<meta name="description" content="Admin Template">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/game_favicon.ico" type="image/x-icon" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>订单管理</title>
<!-- Custom Style-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/custom.css">
<!-- Theme Color Style-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/theme-purple.css">
<!-- Data Tables Default Style-->
<link rel="stylesheet" type="text/css"
	href="${path}/css/datatables/datatables.min.css">
<!-- Nano Scroller Default Style-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nanoscroller.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!--  标题栏 -->
	<div id="header-panel">
		<nav class="navbar navbar-fixed-top">
			<div class="container-fluid">
				<div id="navbar-header">
					<!-- 返回主页 -->
					<a class="navbar-brand" href="admin/admin.jsp"> <span
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
					<li><a href="#" class="chevron "><i class="fa fa-desktop"
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

	<div id="content-panel">
		<div class="container-fluid">

			<div class="row">
				<div class="col-xs-12 dashboard-header">
					<h1 class="dash-title">订单管理</h1>
					<!-- //////////////////////////////////////////////////// Breadcrumb -->
					<ol class="breadcrumb">
						<li><a href="admin/admin.jsp"><i class="fa fa-home"
								aria-hidden="true"></i> 主页</a></li>

						<li><a href="findAllOrder" class="active"> 订单管理</a></li>
					</ol>
					<!-- /breadcrumb -->
				</div>
				<!-- /dashboard -->
			</div>
			<!-- /row -->

			<div class="row">

				<!-- //////////////////////////////////////////////////// 列表 -->
				<div class="col-xs-12">
					<div class="panel">
						<div class="panel-heading">
							<h3>订单管理</h3>
						</div>
						<!-- /panel-heading -->
						<div class="panel-body m-t-0">
							<div align="right">
								<a href="getExcel"
									class="btn btn-outline btn-md bg-purple m-r-10"> <span>导出Excel</span>
								</a>
							</div>
							<table id="customer-list" class="table table-striped">
								<thead>
									<tr>
										<th>id</th>
										<th>订单编号</th>
										<th>游戏名</th>
										<th>价格</th>
										<th>下单时间</th>
										<th>是否支付</th>
										<th>用户名</th>
										<th>激活码</th>
										<th class="action-th">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.rows }" var="row">
										<tr>
											<td>${row.id }</td>
											<td>${row.orderid }</td>
											<td>${row.gamename }</td>
											<td>${row.price }</td>
											<td>${row.time }</td>
											<td>${row.pay }</td>
											<td>${row.username }</td>
											<td>${row.gamekey }</td>
											<td>
												<ul>
													<li style="list-style: none; display: inline;"><a
														href="admin/orderupdate.jsp?id=${row.id}&orderid=${row.orderid}
														&gamename=${row.gamename}&price=${row.price}&time=${row.time}&pay=${row.pay}
														&username=${row.username}&key=${row.gamekey}"
														class="btn btn-xs btn-edit bg-purple hidden-xs hidden-sm">
															编辑</a></li>
													<li style="list-style: none; display: inline;"><a
														href="${pageContext.request.contextPath}/deleteOneOrder?id=${row.id}"
														class="btn btn-delete btn-xs bg-red hidden-xs hidden-sm">
															删除</a></li>
												</ul>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div align="right">
								<page:page
									url="${pageContext.request.contextPath }/findLikeOrderid" />
							</div>
						</div>
						<!-- /table-responsive -->
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
	<!-- DataTables scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/datatables/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			"use strict";
			$('#product-list').DataTable({
				"columnDefs" : [ {
					"targets" : 6,
					"orderable" : false
				} ]
			});
		});
	</script>
	<!-- Custom scripts -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-functions.js"></script>

</body>
</html>
