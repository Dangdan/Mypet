<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="data-div" id="show-request-list">
	<c:forEach items="${applicationList}" var="application">
		<div class="tablebody row" style="padding-left: 40px">

			<div class="col-xs-2">
				宠物名称:<a class="show-pet-info" href="#" data-toggle="modal"
					data-target="#pet-info-modal"
					info-id="${application.requestPet.pid}">${application.petname}</a>
			</div>
			<div style="display: none"
				id="pet-info-${application.requestPet.pid}">
				<p>宠物名：${application.petname}</p>
				<p>年龄：${application.requestPet.age}个月</p>
				<p>性别：${application.requestPet.sex}</p>
				<p>特征：${application.requestPet.characteristic}</p>
			</div>
			<div class="col-xs-2">
				发布人:<a class="show-requester-info" href="#" data-toggle="modal"
					data-target="#user-info-modal" info-id="${application.aid}">${application.publishname}</a>
			</div>
			<div style="display: none" id="requester-info-${application.aid}">
				<p>姓名：${application.publishname}</p>
				<p>年龄：${application.publishUser.age}</p>
				<p>性别：${application.publishUser.sex}</p>
				<p>地址：${application.publishUser.address}</p>
				<p>邮箱：${application.publishUser.email}</p>
				<p>电话：${application.publishUser.phone}</p>
			</div>
			<div class="col-xs-2">
				申请状态:<a class="show-requester-info" href="#" data-toggle="modal"
					data-target="#status-info-modal" info-id="${application.aid}">${application.status}</a>
			</div>
			<div class="col-xs-2" style="text-align: right">
				申请时间
				<fmt:formatDate value="${application.created}" dateStyle="long" />
			</div>
			<div class="col-xs-4">
				<button id="delete-req" class="btn btn-green"
					delete-id=${application.aid}>撤销申请</button>
			</div>

		</div>
		<HR
			style="FILTER: progid:DXImageTransform.Microsoft.Glow(color=#000000, strength=50)"
			width="100%" color=#000000 SIZE=1>
	</c:forEach>

</div>