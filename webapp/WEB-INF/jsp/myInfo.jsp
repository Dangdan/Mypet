<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="editor">
	<!-- 未完待续 -->
	<form method="post" id="info-form">
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">用户名:</label>
			<div class="col-xs-3 ">
				<input type="text" id="user-username" class="form-control input-xm "
					value="${sessionScope.user.username}" placeholder="" disabled>
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">密码：</label>
			<div class="col-xs-3 ">
				<input type="text" id="user-password" class="form-control input-xm "
					value="${sessionScope.user.pwd}" placeholder="" disabled>
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">性别：</label>
			<div class="col-xs-3 ">
				<input type="text" id="user-sex" class="form-control input-xm "
					value="${sessionScope.user.sex}" placeholder="" disabled>
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">身份：</label>
			<div class="col-xs-3 ">
				<input type="text" id="user-identity" class="form-control input-xm "
					value="${sessionScope.user.identity}" placeholder="" disabled>
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">年龄：</label>
			<div class="col-xs-3 ">
				<input type="text" id="user-age" class="form-control input-xm "
					value="${sessionScope.user.age}" placeholder="" disabled>
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">地址：</label>
			<div class="col-xs-3">
				<input type="text" id="user-address" class="form-control input-xm "
					value="${sessionScope.user.address}" placeholder="" disabled>
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">电话：</label>
			<div class="col-xs-3 ">
				<input type="text" id="user-phone" class="form-control input-xm "
					value="${sessionScope.user.phone}" placeholder="" disabled>
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">邮箱：</label>
			<div class="col-xs-3">
				<input type="text" id="user-email" class="form-control input-xm "
					value="${sessionScope.user.email}" placeholder="" disabled>
			</div>
		</div>
	</form>
	<div class="form-group row">
		<label for="newContract" class="col-xs-2 text-right control-label"></label>
		<div class="col-xs-3">
			<button id="edit-info" class="btn btn-yellow">编辑</button>
			<button id="save-info" class="btn btn-yellow" style="display: none">保存</button>
		</div>
	</div>
</div>
<!--弹出删除警告窗口-->
<!-- /.modal -->