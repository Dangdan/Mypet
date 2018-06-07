<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="check-div form-inline">
	<div class="col-xs-2">
		<button class="nav-show  btn btn-yellow btn-xs" href="#publish-history" url="publishHistory">我的公告发布历史</button>
	</div>
	<div class="col-xs-2">
		<button class="nav-show  btn btn-yellow btn-xs" href="#publish-history" url="petHistory">我的宠物发布历史</button>
	</div>
</div>

<div class="data-div" id="show-info-list">
	<c:forEach items="${noticeList.rows}" var="notice">
		<div class="tablebody row" style="padding-left: 40px">

			<div class="col-xs-6">
				公告标题:<a class="show-notice-info" href="#" data-toggle="modal"
					data-target="#notice-info-modal" info-id="${notice.nid}">${notice.title}</a>
			</div>
			<div class="col-xs-8">
				发布人:<a class="show-notice-info" href="#" >${notice.username}</a>
			</div>
			<div class="col-xs-12">
				公告内容:<a class="show-notice-info" href="#" data-toggle="modal"
					data-target="#content-info-modal" info-id="${notice.content}">${notice.content}</a>
			</div>
			<div class="col-xs-10" style="text-align: right">
				发布时间：
				<fmt:formatDate value="${notice.created}" dateStyle="long" />
			</div>
		</div>
		<hr>
	</c:forEach>
	<div class="check-div form-inline">
		<div class="col-xs-3">
			<c:if test="${noticeList.currentPage>1}">
				<button class="nav-show  btn btn-blue btn-xs goto" href="#publish-history" url="publishHistory?page=${noticeList.currentPage-1}">上一页</button>
			</c:if>
			<span style="padding-left: 10px; padding-right: 10px">当前第${noticeList.currentPage}页 (总共${noticeList.row}页)</span>
			<c:if test="${noticeList.currentPage<noticeList.row}">
				<button class="nav-show  btn btn-blue btn-xs" href="#publish-history" url="publishHistory?page=${noticeList.currentPage+1}">下一页</button>
			</c:if>
		</div>
		<div class="col-xs-1">
			<input class="btn-xs" style="width: 60px!important;" size="6" onkeyup="value=value.replace(/[^\d]/g,'')"/>
		</div>
		<div class="col-xs-1">
			<button class="nav-go btn btn-blue btn-xs goto " href="#publish-history" url="publishHistory?page=">跳转到</button>
		</div>
	</div>
</div>