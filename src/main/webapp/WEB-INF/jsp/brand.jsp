<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 页头定义 --%>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/main.action">用户管理系统</a>
		</div>
		<form class="navbar-form navbar-right"
			action="<%=request.getContextPath()%>/logout.action">
			<button type="submit" class="btn btn-danger btn-sm">登出</button>
		</form>
	</div>
</nav>