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
<title>发布者平台</title>
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
			uploadJson : "/pic/upload",
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
		
		$("#publish-pet-info-btn").click(function(){
			url=$("#pubish-pet-url").val();
			pname=$("#pubish-pet-pname").val();
			ptype=$("#pubish-pet-ptype").val();
			age=$("#pubish-pet-age").val();
			sex=$("#pubish-pet-sex").val();
			characteristic=$("#pubish-pet-characteristic").val();
			$.ajax({
				type : 'POST',
				url : "pet/publish",
				dataType : "json",
				data : {
					imgurl:url,
					pname : pname,
					ptype : ptype,
					age : age,
					sex : sex,
					characteristic : characteristic,
				},
				success : function(data) {
					alert(data.type);
					if (data.type != 0) {
						alert(data.content);
					} else {
						alert("发布成功");
					}
				},
				error : function(data) {
					alert("请求失败，请稍后重试");
				}
			});
		})
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
			$("#publish-info").addClass("active");
			break;
		case "4":
			$("#publish-history").addClass("active");
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
<script type="text/javascript">
KindEditor.ready(function(K) {
	var uploadbutton = K.uploadbutton({
		button : K('#uploadButton')[0],
		fieldName : 'imgFile',
		url : 'pic/upload',
		afterUpload : function(data) {
			if (data.error == 0) {
				var imgUrl=$("<img style='max-width:300px;max-height:200px;padding:10px'/>").attr("src",data.url);
				$("#show-pet-img").append(imgUrl);
				var url = $("#pubish-pet-url").val();
				if(url==""){
					$("#pubish-pet-url").val(data.url);
				}else{
					$("#pubish-pet-url").val($("#pubish-pet-url").val()+";"+data.url);
				}
			} else {
				alert(data.message);
			}
		},
		afterError : function(str) {
			alert("上传失败，请稍后重试");
		}
	});
	uploadbutton.fileBox.change(function(e) {
		uploadbutton.submit();
	});
});
</script>
</head>
<body>
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP">
					<img id="logo" alt="发布者平台" src="images/coffee-cup.png"><span>发布者平台</span>
				</p>
			</div>
			<c:if test=""></c:if>
			<div class="meun-title">
				当前发布者：${sessionScope.user.username} <a href="user/userLogout"
					class="btn btn-yellow btn-xs">注销</a>
			</div>
			<div class="meun-item meun-item-active" href="#user"
				aria-controls="contract" role="tab" data-toggle="tab">
				<span class="icons icon-book icon-large"></span>个人信息
			</div>
			<div class="meun-item meun-item-active" href="#request-list"
				aria-controls="char" role="tab" data-toggle="tab">
				<span id="request-list-item" class="icons icon-user icon-large"></span>请求列表
			</div>
			<div id="upload-active" class="meun-item meun-item-active" href="#publish-pet-info"
				aria-controls="user" role="tab" data-toggle="tab">
				<span class="icons icon-user icon-large"></span>发布宠物领养信息
			</div>
			<div class="meun-item meun-item-active" href="#publish-info"
				aria-controls="chan" role="tab" data-toggle="tab">
				<span class="icons icon-building icon-large"></span>发布公告
			</div>
			<div class="meun-item meun-item-active" href="#publish-history"
				aria-controls="chan" role="tab" data-toggle="tab">
				<span class="icons icon-building icon-large"></span>发布历史
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
				<div role="tabpanel" class="tab-pane" id="user">
					<div class="editor">
						<!-- 未完待续 -->
						<form method="post" id="info-form">
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">用户名:</label>
								<div class="col-xs-3 ">
									<input type="text" id="user-username"
										class="form-control input-xm "
										value="${sessionScope.user.username}" placeholder="" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">密码：</label>
								<div class="col-xs-3 ">
									<input type="text" id="user-password"
										class="form-control input-xm "
										value="${sessionScope.user.pwd}" placeholder="" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">性别：</label>
								<div class="col-xs-3 ">
									<input type="text" id="user-sex" class="form-control input-xm "
										value="${sessionScope.user.sex}" placeholder="" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">身份：</label>
								<div class="col-xs-3 ">
									<input type="text" id="user-identity"
										class="form-control input-xm "
										value="${sessionScope.user.identity}" placeholder="" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">年龄：</label>
								<div class="col-xs-3 ">
									<input type="text" id="user-age" class="form-control input-xm "
										value="${sessionScope.user.age}" placeholder="" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">地址：</label>
								<div class="col-xs-3">
									<input type="text" id="user-address"
										class="form-control input-xm "
										value="${sessionScope.user.address}" placeholder="" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">电话：</label>
								<div class="col-xs-3 ">
									<input type="text" id="user-phone"
										class="form-control input-xm "
										value="${sessionScope.user.phone}" placeholder="" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">邮箱：</label>
								<div class="col-xs-3">
									<input type="text" id="user-email"
										class="form-control input-xm "
										value="${sessionScope.user.email}" placeholder="" disabled>
								</div>
							</div>
						</form>
						<div class="form-group row">
							<label for="newContract"
								class="col-xs-2 text-right control-label"></label>
							<div class="col-xs-3">
								<button id="edit-info" class="btn btn-yellow">编辑</button>
								<button id="save-info" class="btn btn-yellow"
									style="display: none">保存</button>
							</div>
						</div>
					</div>
					<!--弹出删除警告窗口-->
					<!-- /.modal -->
				</div>
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
				<!-- 发布宠物信息模块 -->
				<div role="tabpanel" class="tab-pane" id="publish-pet-info">
					<div class="editor">
						<!-- 未完待续 -->
						<form action="<c:url value='pet/publish'/>" method="post"
							enctype="multipart/form-data">
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">宠物名:</label>
								<div class="col-xs-3 ">
									<input type="text" id="pubish-pet-pname" class="form-control input-xm "
										placeholder="">
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">宠物年龄:</label>
								<div class="col-xs-3 ">
									<input type="text" id="pubish-pet-age"class="form-control input-xm "
										placeholder="">
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">宠物类型:</label>
								<div class="col-xs-3 ">
									<input type="text" id="pubish-pet-ptype"  class="form-control input-xm "
										placeholder="">
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">宠物性别:</label>
								<div class="col-xs-3 ">
									<input type="text" id="pubish-pet-sex" class="form-control input-xm "
										placeholder="">
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">宠物特征:</label>
								<div class="col-xs-3 ">
									<input type="text" id="pubish-pet-characteristic"
										class="form-control input-xm " placeholder="">
								</div>
							</div>
							<div class="form-group row">
								<label for="newContract"
									class="col-xs-2 text-right control-label">宠物图片:</label>
									<div class="col-xs-2 ">
										<input type="button" id="uploadButton" value="上传图片" style=""/>
									</div>
									<input type="hidden" id="pubish-pet-url"/>
							</div>						
						</form>
						<div id="show-pet-img" class="row">
							<label for="newContract"
									class="col-xs-2 text-right control-label">宠物图片样例:</label>
						</div>
						<div class="form-group row">
							<button type="button" id="publish-pet-info-btn"
								class="btn btn-primary col-xs-4 col-xs-offset-1" >发布宠物领养信息</button>
						</div>
						
					</div>
					<!--弹出删除警告窗口-->
					<!-- /.modal -->
				</div>
				<!-- 发布历史模块 -->
				<div role="tabpanel" class="tab-pane" id="publish-history">
					<div class="check-div form-inline">
						<div class="col-xs-2">
							<button  class="btn btn-yellow btn-xs">我的公告发布历史</button>
						</div>
						
						
						
						<div class="col-xs-2">
							<button class="btn btn-yellow btn-xs">我的宠物发布历史</button>
						</div>
					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-2 ">宠物名称</div>
							<div class="col-xs-2 ">宠物性别</div>
							<div class="col-xs-2 ">宠物类型</div>
							<div class="col-xs-2 ">宠物年龄</div>
							<div class="col-xs-2 ">宠物特征</div>
							<div class="col-xs-1 ">操作</div>
						</div>
						<div class="tablebody"></div>
					</div>
				</div>
				<!--请求列表模块-->
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
								<p>用户信息1:这里的都不用管，不用填</p>
								<p>用户信息2:</p>
								<p>用户信息3:</p>
								<p>用户信息4:</p>
								<p>用户信息5:</p>
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
				<div role="tabpanel" class="tab-pane" id="request-list">
					<div class="data-div" id="show-request-list">
						<c:forEach items="${applicationList}" var="application">
							<div class="tablebody row" style="padding-left: 40px">
								<div class="col-xs-2">
									申请人:<a class="show-requester-info" href="#" data-toggle="modal"
										data-target="#user-info-modal" info-id="${application.aid}">${application.requestname}</a>
								</div>
								<div style="display: none" id="requester-info-${application.aid}">
									<p>姓名：${application.requestname}</p>
									<p>年龄：${application.requestUser.age}</p>
									<p>性别：${application.requestUser.sex}</p>
									<p>地址：${application.requestUser.address}</p>
									<p>邮箱：${application.requestUser.email}</p>
									<p>电话：${application.requestUser.phone}</p>
								</div>
								<div class="col-xs-2">
									宠物名称:<a class="show-pet-info" href="#" data-toggle="modal"
										data-target="#pet-info-modal" info-id="${application.requestPet.pid}">${application.petname}</a>
								</div>
								<div style="display: none" id="pet-info-${application.requestPet.pid}">
									<p>宠物名：${application.petname}</p>
									<p>年龄：${application.requestPet.age}个月</p>
									<p>性别：${application.requestPet.sex}</p>
									<p>特征：${application.requestPet.characteristic}</p>
								</div>
								<div class="col-xs-2">
									申请状态:<a class="show-requester-info" href="#" data-toggle="modal"
										data-target="#status-info-modal" info-id="${application.aid}">${application.status}</a>
								</div>
								<div class="col-xs-2" style="text-align: right">
									申请时间：<fmt:formatDate value="${application.created}" dateStyle="long" />
								</div>
								<div class="col-xs-5">
									<button id="pass-req" class="btn btn-green"
										pass-id=${application.aid}>同意申请</button>
									<button id="unpass-req" class="btn btn-yellow"
										pass-id=${application.aid}>拒绝申请</button>
								</div>
								
							</div>
							<HR
								style="FILTER: progid:DXImageTransform.Microsoft.Glow(color=#000000, strength=50)"
								width="100%" color=#000000 SIZE=1>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
		<script src="js/jquery.nouislider.js"></script>
		<script>
			$("#edit-info").click(function() {
				$("#info-form input").attr("disabled", false);
				$("#save-info").show();
			})
			$("#save-info").click(function() {
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
						alert(data.type);
						if (data.type != 0) {
							alert(data.content);
						} else {
							alert("保存成功");
						}
					},
					error : function(data) {
						alert("保存失败，请稍后重试");
					}
				});
			});

			$(".show-requester-info").click(
					function() {
						var id = $(this).attr("info-id");
						$("#user-info-modal-body").html("");
						$("#user-info-modal-body").append(
								$("#requester-info-" + id).html());
					});
			$(".show-pet-info").click(function() {
				var id = $(this).attr("info-id");
				$("#pet-info-modal-body").html("");
				$("#pet-info-modal-body").append($("#pet-info-" + id).html());
			});
			$("#pass-req").click(function() {
				var passReqId = $(this).attr("pass-id");
				$.ajax({
					type : 'POST',
					url : "application/updateStatus",
					dataType : "json",
					data : {
						status : "已同意",
						aid : passReqId
					},
					success : function(data) {
						alert(data.type);
						if (data.type != 0) {
							alert(data.content);
						} else {
							alert("通过成功");
						}
					},
					error : function(data) {
						alert("请求失败，请稍后重试");
					}
				});
			});
			$("#unpass-req").click(function() {
				var passReqId = $(this).attr("pass-id");
				$.ajax({
					type : 'POST',
					url : "application/updateStatus",
					dataType : "json",
					data : {
						status : "已拒绝",
						aid : passReqId
					},
					success : function(data) {
						alert(data.type);
						if (data.type != 0) {
							alert(data.content);
						} else {
							alert("拒绝成功");
						}
					},
					error : function(data) {
						alert("请求失败，请稍后重试");
					}
				});
			});
		</script>
</body>
<script type="text/javascript">
$("#upload-active").click(function(){
// 	$("#uploadButton").show();	
	$(".ke-form").width(100);
	
});
</script>
</html>