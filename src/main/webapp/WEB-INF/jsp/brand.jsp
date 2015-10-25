<%-- 页头定义页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand logo">
				<img src="<%=request.getContextPath()%>/img/logo.png">
			</a>
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/main.action">用户管理系统</a>
		</div>

		<form id="logout" class="navbar-form navbar-right"
			action="<%=request.getContextPath()%>/logout.action">
			<img class="img32" title="修改信息"
				src="<%=request.getContextPath()%>/img/user.png">
			<img class="img32" title="登出" onclick="$('#logout').submit()"
				src="<%=request.getContextPath()%>/img/logout.png">
		</form>
		<p class="navbar-text navbar-right">欢迎&nbsp;${user.username }&nbsp;登录系统</p>
	</div>
</nav>