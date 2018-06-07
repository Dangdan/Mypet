<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="editor">
	<!-- 未完待续 -->
	<form action="<c:url value='notice/add'/>" method="post">
		<div class="form-group ">
			<label for="newContract" class="col-xs-2 text-right control-label">公告标题：</label>
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