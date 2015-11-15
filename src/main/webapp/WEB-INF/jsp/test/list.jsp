<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- 查询条件开始 --%>
<div class="panel panel-primary">
	<div class="panel-heading">搜索条件</div>
	<div class="panel-body">
		<form id="search" method="post"
			action="<%=request.getContextPath()%>/user/list.action">
			<div class="row">
				<div class="form-group col-md-6">
					<label>用户名</label>
					<input class="form-control" type="text" name="usernamelike"
						value="${param.usernamelike }" />
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
				<button class="btn btn-primary" type="submit">搜索</button>
				<button class="btn btn-primary" type="reset">重置</button>
			</div>
		</form>
	</div>
</div>
<%-- 查询条件结束 --%>

<%-- 功能按钮开始 --%>
<div class="mt10f pb10">
	<button class="btn btn-primary" type="button"
		url="<%=request.getContextPath()%>/user/initAdd.action"
		onclick="Ums.modal.load(this)">添加</button>
	<span class="btn btn-primary btn-file">
		导入
		<input type="file" name="userFile" onchange="upload(this)"
			url="<%=request.getContextPath()%>/user/imp.action" />
	</span>
	<button class="btn btn-primary" type="button"
		onclick="window.open('<%=request.getContextPath()%>/user/exp.action')">导出</button>
	<button class="btn btn-primary" type="button"
		onclick="window.open('<%=request.getContextPath()%>/user/down.action')">模板</button>
</div>
<%-- 功能按钮结束 --%>

<%-- 查询结果开始 --%>
<div class="panel panel-primary">
	<div class="panel-heading">结果列表</div>
	<table class="table table-bordered table-hover table-condensed">
		<thead>
			<tr class="active">
				<th width="10%">编号</th>
				<th width="15%">用户名</th>
				<th width="20%">创建时间</th>
				<th>描述</th>
				<th width="15%">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty users }">
					<c:forEach items="${users }" var="user">
						<tr>
							<td title="${user.id }">${user.id }</td>
							<td title="${user.username }">${user.username }</td>
							<td
								title="<fmt:formatDate value='${user.createTime }' pattern='yyyy-MM-dd HH:mm:ss' />">
								<fmt:formatDate value="${user.createTime }"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td title="${user.desc }">${user.desc }</td>
							<td>
								<img class="img18" alt="edit" src="../img/view.png"
									url="<%=request.getContextPath()%>/user/view.action?id=${user.id }"
									onclick="Ums.modal.load(this)" />
								<img class="img18" alt="edit" src="../img/edit.png"
									url="<%=request.getContextPath()%>/user/initEdit.action?id=${user.id }"
									onclick="Ums.modal.load(this)" />
								<a href="delete.action?id=${user.id }">
									<img class="img18" alt="edit" src="../img/delete.png" />
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" align="center">没有数据</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- 查询结果结束 --%>

<%-- 引入分页页面文件 --%>
<%@ include file="page.jsp"%>