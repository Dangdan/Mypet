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
	<c:forEach items="${petList.rows}" var="pet">
		<div class="tablebody row" style="padding-left: 40px">
			<!-- <div class="col-xs-2">
				<img style="max-width:100%;max-height:260px;padding:20px" src="${pet.imgs[0]}" />			
			</div> -->
			<div class="col-xs-6">
				<div class="col-xs-6" style="margin-top:25px">
					宠物名:<a class="show-pet-info" href="#" >${pet.pname}</a>
				</div>
				<div class="col-xs-8">
					类型:<a class="show-pet-info" href="#" >${pet.ptype}</a>
				</div>
				<div class="col-xs-8">
					年龄:<a class="show-pet-info" href="#" >${pet.age}</a>
				</div>
				<div class="col-xs-8">
					特征:<a class="show-pet-info" href="#" >${pet.characteristic}</a>
				</div>
				<div class="col-xs-8">
					主人:<a class="show-pet-info" href="#" >${pet.username}</a>
				</div>
			</div>
			
			<hr>
		</div>
	</c:forEach>
	<div class="check-div form-inline">
		<div class="col-xs-3">
			<c:if test="${petList.currentPage>1}">
				<button class="nav-show  btn btn-blue btn-xs goto" href="#publish-history" url="petHistory?page=${petList.currentPage-1}">上一页</button>
			</c:if>
			<span style="padding-left: 10px; padding-right: 10px">当前第${petList.currentPage}页 (总共${petList.row}页)</span>
			<c:if test="${petList.currentPage<petList.row}">
				<button class="nav-show  btn btn-blue btn-xs" href="#publish-history" url="petHistory?page=${petList.currentPage+1}">下一页</button>
			</c:if>
		</div>
		<div class="col-xs-1">
			<input class="btn-xs" style="width: 60px!important;" size="6" onkeyup="value=value.replace(/[^\d]/g,'')"/>
		</div>
		<div class="col-xs-1">
			<button class="nav-go btn btn-blue btn-xs goto " href="#publish-history" url="petHistory?page=">跳转到</button>
		</div>
	</div>
</div>