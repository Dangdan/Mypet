<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登录MyPet</title>
<link type="text/css" rel="stylesheet" href="/css/login.css" />
<script type="text/javascript" src="/js/jquery-1.6.4.js"></script>
</head>
<body background="https://raw.githubusercontent.com/Dangdan/Mypet/master/background.jpg">

	<center>
		<h1 style="color: red">登录</h1>
		<form id="indexform" name="indexForm" action="logincheck.jsp"
			method="post">
			<table border="0">
				<tr>
					<td>账号：</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="password"></td>
				</tr>
			</table>
			<br> <input type="submit" value="登录" style="color: #BC8F8F">
		</form>
		<form action="register.jsp">
			<input type="submit" value="注册" style="color: #BC8F8F">
		</form>
	</center>
</body>
</html>