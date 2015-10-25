<%-- 菜单定义页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-md-2 menu">
	<ul class="nav nav-menu">
		<c:forEach items="${menus }" var="menu">
			<c:if test="${menu.id eq menuId }">
				<li class="active">
			</c:if>
			<c:if test="${menu.id ne menuId }">
				<li>
			</c:if>
			<a href="${menu.url }">${menu.name }</a>
			</li>
		</c:forEach>
	</ul>
</div>