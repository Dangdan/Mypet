<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="editor">
	<!-- 未完待续 -->
	<form action="<c:url value='pet/publish'/>" method="post"
		enctype="multipart/form-data">
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">宠物名:</label>
			<div class="col-xs-3 ">
				<input type="text" id="pubish-pet-pname"
					class="form-control input-xm " placeholder="">
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">宠物年龄:</label>
			<div class="col-xs-3 ">
				<input type="text" id="pubish-pet-age"
					class="form-control input-xm " placeholder="">
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">宠物类型:</label>
			<div class="col-xs-3 ">
				<input type="text" id="pubish-pet-ptype"
					class="form-control input-xm " placeholder="">
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">宠物性别:</label>
			<div class="col-xs-3 ">
				<input type="text" id="pubish-pet-sex"
					class="form-control input-xm " placeholder="">
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">宠物特征:</label>
			<div class="col-xs-3 ">
				<input type="text" id="pubish-pet-characteristic"
					class="form-control input-xm " placeholder="">
			</div>
		</div>
		<div class="form-group row">
			<label for="newContract" class="col-xs-2 text-right control-label">宠物图片:</label>
			<div class="col-xs-2 ">
				<input type="button" id="uploadButton" value="上传图片"/>
			</div>
			<input type="hidden" id="pubish-pet-url" />
		</div>
	</form>
	<div id="show-pet-img" class="row">
		<label for="newContract" class="col-xs-2 text-right control-label">宠物图片样例:</label>
	</div>
	<div class="form-group row">
		<button type="button" id="publish-pet-info-btn"
			class="btn btn-primary col-xs-4 col-xs-offset-1">发布宠物领养信息</button>
	</div>
</div>