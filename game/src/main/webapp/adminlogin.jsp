<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="HTML, CSS, JavaScript">
<meta name="description" content="HTML5 Template">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/game_favicon.ico" type="image/x-icon" />

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- Custom Style-->
<link rel="stylesheet" type="text/css" href="css/custom.css">
<!-- Theme Color Style-->
<link rel="stylesheet" type="text/css" href="css/theme-purple.css">
<!-- Nano Scroller Default Style-->
<link rel="stylesheet" href="css/nanoscroller.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Sbeam游戏商城后台管理登录</title>
</head>
<body>

	<!-- //////////////////////////////////////////////////// Login div -->
	<div id="login" class="image-bg">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 content">
					<div class="panel login-form">
						<div class="panel-heading">
							<h2>后台管理登录</h2>
						</div>
						<!-- /panel-heading -->
						<div class="panel-body m-t-0">

							<form data-toggle="validator"
								action="${pageContext.request.contextPath }/login" method="post">

								<div class="form-group">
									<label for="inputEmail" class="control-label">账号</label>
									<div class="input-group">
										<span class="input-group-addon bg-purple" id="basic-addon1"><i
											class="fa fa-envelope" aria-hidden="true"></i></span> <input
											type="text" class="form-control" id="admin" name="admin"
											placeholder="账号" required>
									</div>
									<!-- /input-group -->
									<div class="help-block with-errors"></div>
								</div>
								<!-- /form-group -->

								<div class="form-group">
									<label for="inputPassword" class="control-label">密码</label>
									<div class="input-group">
										<span class="input-group-addon bg-purple" id="basic-addon2"><i
											class="fa fa-key" aria-hidden="true"></i> </span> <input
											type="password" class="form-control"
											id="pwd" name="pwd" placeholder="密码" required>
									</div>
									<!-- /input-group -->
								</div>
								<!-- /form-group -->
								
								<br />
								<div class="form-group">
									<div style="float: left;">
										<div class="input-group">
											<input id="checks" name="inputStr" class="form-control"
												type="text" style="width: 150px;" placeholder="请输入验证码" />
										</div>
									</div>
									<div style="float: left;"><span>&nbsp;&nbsp;&nbsp;</span></div>
									<div style="float: left;">
										<img id="imgVerify"
											src="${pageContext.request.contextPath }/getVerify"
											alt="点击更换验证码" /><a href="" rel="nofollow">&nbsp;看不清，换一张</a>
									</div>
								</div>
								<br /><br />
								<div class="form-group" align="center">
									<input type="submit" value="登录" class="btn btn-md bg-purple"></input>
								</div>
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
		</div>
		<!-- /container -->
	</div>
	<!-- /login -->

	<!-- /////////////////////////////// Scripts /////////////////////////////// -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
	<!-- Offline jQuery script -->
	<!-- <script  type="text/javascript" src="jquery.min"></script>  -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- Validator scripts -->
	<script type="text/javascript" src="js/validator/validator.js"></script>
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