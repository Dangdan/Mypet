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
			<div class="nav-show meun-item meun-item-active" href="#user" url="myInfo"
				aria-controls="contract" role="tab" data-toggle="tab">
				<span class="icons icon-book icon-large"></span>个人信息
			</div>
			<div class="nav-show meun-item meun-item-active" href="#request-list" url="requestList"
				aria-controls="char" role="tab" data-toggle="tab">
				<span id="request-list-item" class="icons icon-user icon-large"></span>请求列表
			</div>
			<div id="upload-active" class="nav-show meun-item meun-item-active" url="publishPet"
				href="#publish-pet-info" aria-controls="user" role="tab"
				data-toggle="tab">
				<span class="icons icon-user icon-large"></span>发布宠物领养信息
			</div>
			<div class="nav-show meun-item meun-item-active" href="#publish-info" url="publishInfo"
				aria-controls="chan" role="tab" data-toggle="tab">
				<span class="icons icon-building icon-large"></span>发布公告
			</div>
			<div class="nav-show meun-item meun-item-active" href="#publish-history" url="publishHistory"
				aria-controls="chan" role="tab" data-toggle="tab">
				<span class="icons icon-building icon-large"></span>发布历史
			</div>
			<!-- 右侧具体内容栏目 -->
		</div>
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"><i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 个人信息模块 -->
				<div role="tabpanel" class="tab-pane" id="user"></div>
				<!-- 公告模块 -->
				<div role="tabpanel" class="tab-pane" id="publish-info"></div>
				<!-- 发布宠物信息模块 -->
				<div role="tabpanel" class="tab-pane" id="publish-pet-info"></div>
				<!-- 发布历史模块 -->
				<div role="tabpanel" class="tab-pane" id="publish-history"></div>
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
				<div role="tabpanel" class="tab-pane" id="request-list"></div>
			</div>
		</div>
	</div>
	<script src="js/jquery.nouislider.js"></script>
</body>
<script type="text/javascript">
	nowUrl="";
	nowId="";
	function nowReload(){
		if(nowUrl!=""){
			$.ajax({
				type : 'GET',
				url : nowUrl,
				success : function(data) {
					$(nowId).html(data);
					if(nowId=="#publish-info"){
						contentInit();
					}else if(nowId=="#publish-pet-info"){
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
	$(document).on('click','#edit-info',function(){  
		$("#info-form input").attr("disabled", false);
		$("#save-info").show();
	});  
	$(document).on('click','#save-info',function(){  
		$("#info-form input").attr("disabled", false);
		$("#save-info").show();
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
	$(document).on('click','.show-requester-info',function() {
		var id = $(this).attr("info-id");
		$("#user-info-modal-body").html("");
		$("#user-info-modal-body").append(
				$("#requester-info-" + id).html());
	}); 
	$(document).on('click','.show-pet-info',function() {
		var id = $(this).attr("info-id");
		$("#pet-info-modal-body").html("");
		$("#pet-info-modal-body").append($("#pet-info-" + id).html());
	}); 
	$(document).on('click','#pass-req',function() {
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
	$(document).on("click","#publish-pet-info-btn",function(){
		url = $("#pubish-pet-url").val();
		pname = $("#pubish-pet-pname").val();
		ptype = $("#pubish-pet-ptype").val();
		age = $("#pubish-pet-age").val();
		sex = $("#pubish-pet-sex").val();
		characteristic = $("#pubish-pet-characteristic").val();
		$.ajax({
			type : 'POST',
			url : "pet/publish",
			dataType : "json",
			data : {
				imgurl : url,
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
					nowReload();
				}
			},
			error : function(data) {
				alert("请求失败，请稍后重试");
			}
		});
	})
	
	
	$(document).on('click','#unpass-req',function() {
		var id = $(this).attr("info-id");
		$("#pet-info-modal-body").html("");
		$("#pet-info-modal-body").append($("#pet-info-" + id).html());
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
	function contentInit(){
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
	}
	function uploadFileInit(){
			K = KindEditor;
			var uploadbutton = K
					.uploadbutton({
						button : K('#uploadButton')[0],
						fieldName : 'imgFile',
						url : 'pic/upload',
						afterUpload : function(data) {
							if (data.error == 0) {
								var imgUrl = $(
										"<img style='max-width:300px;max-height:200px;padding:10px'/>")
										.attr("src", data.url);
								$("#show-pet-img").append(imgUrl);
								var url = $("#pubish-pet-url").val();
								if (url == "") {
									$("#pubish-pet-url").val(data.url);
								} else {
									$("#pubish-pet-url").val(
											$("#pubish-pet-url").val()
													+ ";" + data.url);
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
	}
	$(document).on('click','.nav-show',function() {
		var id = $(this).attr("href");
		var url = $(this).attr("url");
		$.ajax({
			type : 'GET',
			url : url,
			success : function(data) {
				$(id).html(data);
				if(id=="#publish-info"){
					contentInit();
				}else if(id=="#publish-pet-info"){
					uploadFileInit(); 
					$(".ke-button").hide();
				}
				nowUrl = url;
				nowId=id;
			},
			error : function(data) {
				alert("请求失败，请稍后重试");
			}
		});
	})
	$(document).on('click','.nav-go',function() {
		var input= $(this).parent().parent().find("input")[0];
		var value=$(input).val();
		var id = $(this).attr("href");
		var url = $(this).attr("url")+value;
		$.ajax({
			type : 'GET',
			url : url,
			success : function(data) {
				$(id).html(data);
				if(id=="#publish-info"){
					contentInit();
				}else if(id=="#publish-pet-info"){
					uploadFileInit(); 
					$(".ke-button").hide();
				}
				nowUrl = url;
				nowId=id;
			},
			error : function(data) {
				alert("请求失败，请稍后重试");
			}
		});
	});
</script>
</html>