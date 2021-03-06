<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- 查询条件开始 --%>
<div class="panel panel-primary">
	<div class="panel-heading">搜索条件</div>
	<div class="panel-body">
		<form id="search"
			action="<%=request.getContextPath()%>/role/list.action">
			<div class="row">
				<div class="form-group col-md-6">
					<label>角色名</label>
					<input class="form-control" type="text" name="namelike"
						value="${param.namelike }" />
				</div>
				<div class="form-group col-md-6">
					<label>创建时间</label>
					<div class="row">
						<div class="col-md-6">
							<fmt:parseDate value="${param.startTime }" var="startTime"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<input class="form-control date start-time calendar" readonly
								type="text" placeholder="开始时间"
								value="<fmt:formatDate value='${startTime }' pattern='yyyy-MM-dd' />" />
							<input id="start_time" name="startTime" type="hidden"
								value="<fmt:formatDate value='${startTime }' pattern='yyyy-MM-dd HH:mm:ss' />" />
						</div>
						<div class="col-md-6">
							<fmt:parseDate value="${param.endTime }" var="endTime"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<input class="form-control date end-time calendar" readonly
								type="text" placeholder="结束时间"
								value="<fmt:formatDate value='${endTime }' pattern='yyyy-MM-dd' />" />
							<input id="end_time" name="endTime" type="hidden"
								value="<fmt:formatDate value='${endTime }' pattern='yyyy-MM-dd HH:mm:ss' />" />
						</div>
					</div>
				</div>
			</div>
			<div class="pull-right">
				<button class="btn btn-primary" type="button"
					onclick="Ums.list.search()">搜索</button>
				<button class="btn btn-primary" type="reset">重置</button>
			</div>
		</form>
	</div>
</div>
<%-- 查询条件结束 --%>

<%-- 功能按钮开始 --%>
<div class="mt10f pb10">
	<button class="btn btn-primary" type="button"
		url="<%=request.getContextPath()%>/role/initAdd.action"
		onclick="load(this)">添加</button>
</div>
<%-- 功能按钮结束 --%>

<%-- 查询结果开始 --%>
<div id="list">
	<%-- 引入列表页面文件 --%>
	<%@ include file="list.jsp"%>
</div>
<%-- 查询结果结束 --%>
<script src="js/ums/role.js"></script>