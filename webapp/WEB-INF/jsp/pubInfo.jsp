<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="data-div" id="show-info-list">
	<c:forEach items="${noticeList}" var="notice">
		<div class="tablebody row" style="padding-left: 40px">

			<div class="col-xs-6">
				公告标题:<a class="show-notice-info" href="#" data-toggle="modal"
					data-target="#notice-info-modal" info-id="${notice.nid}">${notice.title}</a>
			</div>

			<div class="col-xs-8">
				发布人:<a class="show-notice-info" href="#" data-toggle="modal"
					data-target="#user-info-modal" info-id="${notice.nid}">${notice.username}</a>
			</div>
			<div style="display: none" id="notice-info-${notice.nid}">
				<p>姓名：${notice.username}</p>
				<p>年龄：${notice.publishUser.age}</p>
				<p>性别：${notice.publishUser.sex}</p>
				<p>地址：${notice.publishUser.address}</p>
				<p>邮箱：${notice.publishUser.email}</p>
				<p>电话：${notice.publishUser.phone}</p>
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

</div>