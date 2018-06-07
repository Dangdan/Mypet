<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="data-div" id="show-request-list">
	<div>
		<div class="tablebody row"
			style="padding-left: 40px; padding-right: 60px">
			<c:forEach items="${petList}" var="pet">
				<div class="col-xs-3 text-center">
					<img alt="${pet.imgs[0]}" style="width: 150px; height: 150px"
						src="${pet.imgs[0]}">
					<div>
						宠物名称:<a class="pet-show" href="#pet-show" role="tab"
							data-toggle="tab" pet-info-id="${pet.pid}">${pet.pname}</a>
					</div>
					<div style="display: none" id="requester-info-${pet.pid}">
						<p>宠物名：${pet.pname}</p>
						<p>主人：${pet.username}</p>
						<p>申请人：${sessionScope.user.username}</p>
					</div>
					<div>
						发布人:<a class="show-requester-info" href="#" data-toggle="modal"
							data-target="#user-info-modal" info-id="${pet.username}">${pet.username}</a>
					</div>
					<div style="display: none" id="requester-info-${pet.username}">
						<p>姓名：${pet.owner.username}</p>
						<p>年龄：${pet.owner.age}</p>
						<p>性别：${pet.owner.sex}</p>
						<p>地址：${pet.owner.address}</p>
						<p>邮箱：${pet.owner.email}</p>
						<p>电话: ${pet.owner.phone}</p>
					</div>
				</div>
				<!-- 									<div class="col-xs-4"> -->
				<!-- 										<button href="#pet-show" -->
				<!-- 				aria-controls="user" role="tab" data-toggle="tab" id="pass-req" style="margin-top: -45px" -->
				<!-- 											class="btn btn-green" pass-id="这里是该领养的编号">查看详情</button> -->
				<!-- 									</div> -->
			</c:forEach>

			

		</div>
	</div>
</div>