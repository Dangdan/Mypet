<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js"
	background="http://img3.redocn.com/tupian/20150106/aixinxiangkuang_3797284.jpg">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MyPet主页</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
html, body {
	height: 100%;
}

body>div {
	height: 100%;
}

nav {
	font-size: 24px;
}

.input-group-addon {
	width: 100px
}

#login-form .row {
	margin-bottom: 10px;
}
</style>
</head>
<body bgcolor="#F5F5F5" background="https://raw.githubusercontent.com/Dangdan/Mypet/master/mypet.jpg">
	
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 400px; margin-left: 100px">
				<div class="modal-header">
					<h4 class="modal-title" style="text-align: center;">登录</h4>
				</div>
				<div class="modal-body">
					<div style="padding-left: 10px;">
						<form class="bs-example bs-example-form" role="form">
							<div class="row warning">
								<div class="col-lg-12 warning">
									<p class="warning" id="login-account-warn"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon login-pre-label"> 帐号 </span> <input
											type="text" class="form-control" id="login-account">
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
							<div class="row warning">
								<div class="col-lg-12 warning">
									<p id="login-password-warn" class="warning"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon login-pre-label"> 密码 </span> <input
											id="login-password" type="password" class="form-control">
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
							<div class="row warning">
								<div class="col-lg-12 warning">
									<p id="login-verifycode-warn" class="warning"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group" id="login-role">
										<span class="input-group-addon">角色:</span>
										<div class="btn-group disabled" data-toggle="buttons" disabled>
											<label class="btn btn-primary input-area input-option "
												style="color: #010006"> <input type="radio"
												name="options" id="option1">发布者
											</label> <label class="btn btn-primary input-area input-option "
												style="color: #010006"> <input type="radio"
												name="options" id="option2">领养者
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="row warning">
								<div class="col-lg-12 warning">
									<p id="login-verifycode-warn" class="warning"></p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon login-pre-label"> 验证码 </span> <input
											id="login-verifycode" type="text" class="form-control"
											style="width: 120px;"> <a class="input-group-addon"
											href="" style="width: 100px; padding: 0 4px"> <img
											id="login-verify-code" class="verifyCode"
											src="user/userVerifyCode?login=1"
											style="width: 100px; height: 40px;" />
										</a>
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="login-btn" type="button" class="btn btn-primary">
						登录</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<div class="modal fade" id="register-modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 450px; margin-left: 100px">
				<div class="modal-header">
					<h4 class="modal-title" style="text-align: center;">注册</h4>
				</div>
				<div class="modal-body">
					<div style="padding-left: 20px;">
						<form class="bs-example bs-example-form" role="form"
							id="login-form">
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon register-pre-label">用户名
										</span> <input id="register-account" type="text" class="form-control">
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon register-pre-label"> 密码
										</span> <input id="register-password" type="password"
											class="form-control">
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>

							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon register-pre-label"> 地址
										</span> <input id="register-address" type="text" class="form-control">
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon register-pre-label"> 年龄
										</span> <input id="register-age" type="text" class="form-control">
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon register-pre-label"> 电话
										</span> <input id="register-phone" type="text" class="form-control">
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon register-pre-label"> 邮箱
										</span> <input id="register-email" type="text" class="form-control">
									</div>
									<!-- /input-group -->
								</div>
								<!-- /.col-lg-6 -->
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group" id="register-role">
										<span class="input-group-addon">角色:</span>
										<div class="btn-group disabled" data-toggle="buttons" disabled>
											<label class="btn btn-primary input-area input-option "
												style="color: #010006"> <input type="radio"
												name="options" id="option1">发布者
											</label> <label class="btn btn-primary input-area input-option "
												style="color: #010006"> <input type="radio"
												name="options" id="option2">领养者
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group" id="register-sex">
										<span class="input-group-addon">性别:</span>
										<div class="btn-group disabled" data-toggle="buttons" disabled>
											<label class="btn btn-primary input-area input-option "
												style="color: #010006"> <input type="radio"
												name="options" id="option1">男
											</label> <label class="btn btn-primary input-area input-option "
												style="color: #010006"> <input type="radio"
												name="options" id="option2">女
											</label>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="register-btn" type="button" class="btn btn-primary">注册</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<div class="modal fade" id="about-modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 400px; margin-left: 100px">
				<div class="modal-header">
					<h4 class="modal-title" style="text-align:center;">About</h4>
				</div>
				<div class="modal-body">
					<p>MyPet是一个宠物领养服务系统</p>
					<p>你可以发布你的宠物信息，发布更多宠物公告</p>
					<p>你也可以选择你想领养的宠物，查看更多宠物公告</p>
					<p>这是一个传递温暖的平台，让宠物找到更好的归宿</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div style="">
				<ul id="main-nav" class="nav navbar-nav">
					<li><a href="#" data-toggle="modal" data-target="#login-modal">登录</a></li>
					<li><a href="#" data-toggle="modal"
						data-target="#register-modal">注册</a></li>
					<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
				</ul>
			</div>
		</div>
		
	</nav>
	

</body>
<script type="text/javascript">
	$(".verifyCode").click(function() {
		$(this).attr("src", $(this).attr("src") + "1");
		return false;
	});
	$("#login-btn").click(function() {
		var account = $("#login-account").val();
		var password = $("#login-password").val();
		var verifyCode = $("#login-verifycode").val();
		var role = $("#login-role .active").text().trim();

		if (account.trim() == "") {
			alert("帐号不能为空");
			return;
		}
		if (password.trim() == "") {
			alert("密码不能为空");
			return;
		}
		if (role.trim() == "") {
			alert("角色不能为空");
			return;
		}
		if (verifyCode.trim() == "") {
			alert("验证码不能为空");
			return;
		}
		if (role == "领养者") {
			url = "user/requestUserlogin";
		} else {
			url = "user/publishUserlogin";
		}
		$.ajax({
			type : 'POST',
			dataType : "json",
			url : url,
			data : {
				username : account,
				pwd : password,
				verifyCode : verifyCode,
				identity : role
			},
			success : function(data) {
				if (data.type != 0) {
					alert(data.content);
					var code = $("#login-verify-code");
					$(code).attr("src", $(code).attr("src") + "1");
				} else {
					alert("登录成功");
					if (role == "领养者") {
						window.location.href = "requestUser";
					} else {
						window.location.href = "publishUser";
					}
				}
			},
			error : function(data) {
				alert("登录失败，请稍后重试");
			}
		});

	});

	$("#register-btn").click(function() {
		var account = $("#register-account").val();
		var password = $("#register-password").val();
		var address = $("#register-address").val();
		var age = $("#register-age").val();
		var phone = $("#register-phone").val();
		var email = $("#register-email").val();
		var role = $("#register-role .active").text().trim();
		var sex = $("#register-sex .active").text().trim();

		if (account.trim() == "") {
			alert("帐号不能为空");
			return;
		}
		if (password.trim() == "") {
			alert("密码不能为空");
			return;
		}
		if (address.trim() == "") {
			alert("地址不能为空");
			return;
		}
		if (age.trim() == "") {
			alert("年龄不能为空");
			return;
		}
		if (phone.trim() == "") {
			alert("电话不能为空");
			return;
		}
		if (role == "") {
			alert("角色不能为空");
			return;
		}
		if (sex == "") {
			alert("性别不能为空");
			return;
		}
		if (email == "") {
			alert("邮箱不能为空");
			return;
		}

		$.ajax({
			type : 'POST',
			url : "user/register",
			dataType : "json",
			data : {
				username : account,
				pwd : password,
				address : address,
				age : age,
				phone : phone,
				email : email,
				sex : sex,
				identity : role,

			},
			success : function(data) {
				alert(data.type);
				if (data.type != 0) {
					alert(data.content);
				} else {
					alert("注册成功");
				}
			},
			error : function(data) {
				alert("注册失败，请稍后重试");
			}
		});
	});
</script>
</html>
