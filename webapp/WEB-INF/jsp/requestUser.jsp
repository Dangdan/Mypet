<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ch">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>领养者平台</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	$(function() {
		var options = {
			cssPath : 'css/Editor.css',
			filterMode : true,
			resizeType : 1,
			items : [ 'source', 'undo', 'redo', 'code', 'plainpaste',
					'wordpaste', 'justifyleft', 'justifycenter',
					'justifyright', 'justifyfull', 'insertorderedlist',
					'insertunorderedlist', 'indent', 'outdent', 'subscript',
					'superscript', 'clearhtml', 'quickformat', 'formatblock',
					'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold',
					'italic', 'underline', 'strikethrough', 'lineheight',
					'removeformat', 'image', 'flash', 'insertfile', 'table',
					'hr', 'emoticons', 'link', 'unlink' ],
			themeType : "simple",
			colorTable : [
					[ '#36B6A1', '#778899', '#FF8282', '#F79B6D', '#B289CC',
							'#4898EB' ],
					[ '#7948DB', '#006600', '#99BB00', '#B8D100', '#60D978',
							'#00D5FF' ],
					[ '#337FE5', '#003399', '#4C33E5', '#9933E5', '#CC33E5',
							'#EE33EE' ],
					[ '#FFFFFF', '#CCCCCC', '#999999', '#666666', '#444444',
							'#000000' ] ],
			// 指定上传文件的服务器端程序
			uploadJson : "/RdcBlog/pupload.do",
			// urlType:'domain',
			// 指定浏览远程图片的服务器端程序
			fileManagerJson : "xxx",
			minHeight : "600px",
			// afterUpload : function(url) {
			//                     alert(url),
			// 失去焦点时同步数据到textarea
			afterBlur : function() {
				this.sync();
			}
		// autoHeightMode: trued
		}
		var editor = KindEditor.create('textarea[name="content"]', options);

		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
			var itmeObj = $(".meun-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});

		});
	})
</script>
<script>
	$(function() {
		switch ($("#tag").text()) {
		case "0":
			$("#user").addClass("active");
			break;
		case "1":
			$("#request-list").addClass("active");
			break;
		case "2":
			$("#publish-pet").addClass("active");
			break;
		case "3":
			$("#info-list").addClass("active");
			break;

		}
	});
</script>
<!--[if lt IE 9]>
          <script src="js/html5shiv.min.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
<link rel="stylesheet" type="text/css" href="css/pet.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/slide.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css" />
<link rel="stylesheet" type="text/css" href="css/Editor.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<script charset="utf-8" src="editor/kindeditor.js"></script>
<script charset="utf-8" src="editor/lang/zh_CN.js"></script>
<script charset="utf-8" src="editor/plugins/image/image.js"></script>
<style type="text/css">
.form-control[disabled] {
	color: black;
}
</style>
</head>
<body>
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP">
					<img id="logo" alt="领养者平台" src="images/coffee-cup.png"><span>领养者平台</span>
				</p>
			</div>
			<c:if test=""></c:if>
			<div class="meun-title">
				当前领养者：${sessionScope.user.username} <a href="user/userLogout"
					class="btn btn-yellow btn-xs">注销</a>
			</div>
			<div class="nav-show meun-item meun-item-active" href="#user"
				url="requestInfo" aria-controls="contract" role="tab"
				data-toggle="tab">
				<span class="icons icon-book icon-large"></span>个人信息
			</div>
			<div class="nav-show  meun-item meun-item-active"
				href="#request-list" url="myApply" aria-controls="char" role="tab"
				data-toggle="tab">
				<span class="icons icon-user icon-large"></span>我的申请
			</div>
			<div class="nav-show  meun-item meun-item-active" href="#request-pet"
				url="petList" aria-controls="user" role="tab" data-toggle="tab">
				<span class="icons icon-user icon-large"></span>宠物列表
			</div>
			<div class="nav-show meun-item meun-item-active" href="#info-list"
				url="pubInfo" aria-controls="chan" role="tab" data-toggle="tab">
				<span class="icons icon-building icon-large"></span>网站公告
			</div>

			<!-- 右侧具体内容栏目 -->
		</div>
		<div id="rightContent">
			<a class="toggle-btn" id="nimei">f <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 个人信息模块 -->
				<div role="tabpanel" class="tab-pane" id="user"></div>

				<!--申请列表模块-->
				<div class="modal fade" id="pet-info-modal" tabindex="-1"
					role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content"
							style="width: 400px; margin-left: 100px">
							<div class="modal-header">
								<h4 class="modal-title" style="text-align: center;">宠物信息</h4>
							</div>
							<div id="pet-info-modal-body" class="modal-body">
								<p>宠物信息1::这里的都不用管，不用填</p>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>
				<div role="tabpanel" class="tab-pane" id="request-list"></div>

				<!-- 宠物详情 -->
				<div role="tabpanel" class="tab-pane" id="pet-show">
					<div class="editor">
						<!-- 未完待续 -->
						<div class="form-group row">
							<label for="newContract"
								class="col-xs-2 text-right control-label">宠物名:</label>
							<div class="col-xs-3 ">
								<input type="text" class="form-control input-xm " id="pet-name"
									placeholder="" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="newContract"
								class="col-xs-2 text-right control-label">年龄:</label>
							<div class="col-xs-3 ">
								<input type="text" class="form-control input-xm " id="pet-age"
									placeholder="" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="newContract"
								class="col-xs-2 text-right control-label">性别:</label>
							<div class="col-xs-3 ">
								<input type="text" class="form-control input-xm " id="pet-sex"
									placeholder="" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="newContract"
								class="col-xs-2 text-right control-label">种类:</label>
							<div class="col-xs-3 ">
								<input type="text" class="form-control input-xm " id="pet-ptype"
									placeholder="" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="newContract"
								class="col-xs-2 text-right control-label">特征:</label>
							<div class="col-xs-3 ">
								<input type="text" class="form-control input-xm "
									id="pet-characteristic" placeholder="" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="newContract"
								class="col-xs-2 text-right control-label">主人:</label>
							<div class="col-xs-3 ">
								<input type="text" class="form-control input-xm "
									id="pet-username" placeholder="" disabled>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-xs-1 "></div>
							<div class="col-xs-8 " id="img-show"></div>
							<!--  <div class="col-xs-8">
								<img src="images/coffee-cup.png"
									style="width: 150px; height: 150px; float: left" /> <img
									src="images/coffee-cup.png"
									style="width: 150px; height: 150px; float: left" /> <img
									src="images/coffee-cup.png"
									style="width: 150px; height: 150px; float: left" /> <img
									src="images/coffee-cup.png"
									style="width: 150px; height: 150px; float: left" />
							</div>-->
						</div>
						<div class="form-group row">
							<label for="newContract"
								class="col-xs-2 text-right control-label"></label>
							<div class="col-xs-3">
								<button href="#request-pet" aria-controls="user" role="tab"
									data-toggle="tab" class="btn btn-yellow">返回列表</button>
								<button class="btn btn-yellow" data-toggle="modal"
									data-target="#apply-modal">我要申请</button>
							</div>
						</div>
					</div>
					<!--弹出删除警告窗口-->
					<!-- /.modal -->
				</div>


				<!--宠物列表模块-->
				<div class="modal fade" id="user-info-modal" tabindex="-1"
					role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content"
							style="width: 400px; margin-left: 100px">
							<div class="modal-header">
								<h4 class="modal-title" style="text-align: center;">用户信息</h4>
							</div>
							<div id="user-info-modal-body" class="modal-body"
								style="padding-left: 30px">
								<p>用户信息111:这里的都不用管，不用填</p>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>
				<div class="modal fade" id="apply-modal" tabindex="-1" role="dialog"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content"
							style="width: 400px; margin-left: 100px">
							<div class="modal-header">
								<h4 class="modal-title" style="text-align: center;">宠物信息</h4>
							</div>
							<div id="apply-modal-modal-body" class="modal-body">
								<p>宠物信息1::这里的都不用管，不用填</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-green" id="apply-pet-btn">申请</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>

				<!-- 个人信息模块 -->
				<div role="tabpanel" class="tab-pane" id="user"></div>
				<!-- 公告模块 -->
				<div role="tabpanel" class="tab-pane" id="publish-info">
					<div class="editor">
						<!-- 未完待续 -->
						<form action="<c:url value='notice/add'/>" method="post">
							<div class="form-group ">
								<label for="newContract"
									class="col-xs-2 text-right control-label">公告标题：</label>
								<div class="col-xs-4 ">
									<input type="text" name="title" class="form-control input-xm "
										id="newContract" placeholder="">
								</div>
							</div>
							<div id="txt_editor">
								<textarea name="content"
									style="width: 85%; overflow: auto; resize: none;"
									id="articleContent"></textarea>
							</div>
							<input type="submit"
								class="btn btn-primary col-xs-1 col-xs-offset-1 addContract"
								value="发布公告">
						</form>
					</div>
					<!--弹出删除警告窗口-->
					<!-- /.modal -->
				</div>


				<!--公告列表模块-->

				<div role="tabpanel" class="tab-pane" id="info-list"></div>





				<!-- 宠物列表模块 -->
				<div role="tabpanel" class="tab-pane" id="request-pet"></div>
			</div>
		</div>
	</div>
	<script src="js/jquery.nouislider.js"></script>
	<script>
		$(document).on('click', '#edit-info', function() {
			$("#info-form input").attr("disabled", false);
			$("#save-info").show();
		});
		$(document).on('click', '#save-info', function() {
			var username = $("#user-username").val().trim();
			var password = $("#user-password").val().trim();
			var sex = $("#user-sex").val().trim();
			var email = $("#user-email").val().trim();
			var address = $("#user-address").val().trim();
			var identity = $("#user-identity").val().trim();
			var phone = $("#user-phone").val().trim();
			var age = $("#user-age").val().trim();
			$.ajax({
				type : 'POST',
				url : "user/update",
				dataType : "json",
				data : {
					username : username,
					pwd : password,
					address : address,
					age : age,
					phone : phone,
					email : email,
					sex : sex,
				},
				success : function(data) {
					if (data.type != 0) {
						alert(data.content);
					} else {
						alert("保存成功");
						nowReload();
					}
				},
				error : function(data) {
					alert("保存失败，请稍后重试");
				}
			});
		});
		$(document).on(
				'click',
				'.show-requester-info',
				function() {
					var id = $(this).attr("info-id");
					$("#user-info-modal-body").html("");
					$("#user-info-modal-body").append(
							$("#requester-info-" + id).html());
				});
		$(document).on('click', '.show-notice-info', function() {
			var id = $(this).attr("info-id");
			$("#user-info-modal-body").html("");
			$("#user-info-modal-body").append($("#notice-info-" + id).html());
		});
		$(document).on('click', '.show-pet-info', function() {
			var id = $(this).attr("info-id");
			$("#pet-info-modal-body").html("");
			$("#pet-info-modal-body").append($("#pet-info-" + id).html());
		});
		$(document)
				.on(
						'click',
						'.pet-show',
						function() {
							var petId = $(this).attr("pet-info-id");
							$("#apply-modal-modal-body").html(
									$("#requester-info-" + petId).html());
							$("#apply-pet-btn").attr("pet-id", petId);
							$
									.ajax({
										type : 'GET',
										url : "pet/" + petId,
										dataType : "json",
										success : function(data) {
											if (data.type != null) {
												alert(data.content);
											} else {
												$("#pet-name").val(data.pname);
												$("#pet-age").val(data.age);
												$("#pet-sex").val(data.sex);
												$("#pet-ptype").val(data.ptype);
												$("#pet-characteristic").val(
														data.characteristic);
												$("#pet-username").val(
														data.username);
												$("#img-show").html("");
												for ( var index in data.imgs) {
													var imgs = $(
															"<img style='width: 150px; height: 150px; float: left; padding-right:10px' />")
															.attr(
																	"src",
																	data.imgs[index]);
													$("#img-show").append(imgs);
												}

											}
										},
										error : function(data) {
											alert("请求失败，请稍后重试");
										}
									});
						});
		$(document).on('click', '#apply-pet-btn', function() {
			var petId = $(this).attr("pet-id");
			$.ajax({
				type : 'POST',
				url : "application/requestPet",
				dataType : "json",
				data : {
					pid : petId
				},
				success : function(data) {
					if (data.type != null) {
						alert(data.content);
					} else {
						alert("成功发起申请");
					}
				},
				error : function(data) {
					alert("申请失败，请稍后重试");
				}
			});

		});
		$(document).on('click', '#delete-req', function() {
			var item = $(this).parent().parent();
			var deleteReqId = $(this).attr("delete-id");
			$.ajax({
				type : 'POST',
				url : "application/delete",
				dataType : "json",
				data : {
					aid : deleteReqId
				},
				success : function(data) {
					if (data.type != 0) {
						alert(data.content);
					} else {
						alert("撤销成功");
						$(item).remove();
					}
				},
				error : function(data) {
					alert("撤销失败，请稍后重试");
				}
			});
		});
		$(document).on('click', '.nav-show', function() {
			var id = $(this).attr("href");
			var url = $(this).attr("url");
			$.ajax({
				type : 'GET',
				url : url,
				success : function(data) {
					$(id).html(data);
					nowUrl = url;
					nowId = id;
				},
				error : function(data) {
					alert("请求失败，请稍后重试");
				}
			});
		})
		nowUrl = "";
		nowId = "";
		function nowReload() {
			if (nowUrl != "") {
				$.ajax({
					type : 'GET',
					url : nowUrl,
					success : function(data) {
						$(nowId).html(data);
						if (nowId == "#publish-info") {
							contentInit();
						} else if (nowId == "#publish-pet-info") {
							uploadFileInit();
							$(".ke-button").hide();
						}
					},
					error : function(data) {
						alert("请求失败，请稍后重试");
					}
				});
			}
		}
	</script>
</body>

</html>