<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户管理</title>
<%-- 引入样式文件 --%>
<%@ include file="../css.jsp"%>
</head>
<body>
	<!-- 引入进度条页面 -->
	<%@ include file="../progress.jsp"%>
	<%-- 引入页头文件 --%>
	<%@ include file="../brand.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<%-- 引入菜单文件 --%>
			<%@ include file="../menu.jsp"%>

			<div class="col-md-10 col-md-offset-2">
				<!-- 查询条件开始 -->
				<div class="panel panel-primary">
					<div class="panel-heading">搜索条件</div>
					<div class="panel-body">
						<form id="search" method="post"
							action="<%=request.getContextPath()%>/user/list.action">
							<div class="row">
								<div class="form-group col-md-6">
									<label>用户名</label>
									<input class="form-control" type="text" name="usernamelike"
										placeholder="用户名" value="${param.usernamelike }" />
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
								<button class="btn btn-primary" type="button"
									onclick="clean(this)">重置</button>
							</div>
						</form>
					</div>
				</div>
				<!-- 查询条件结束 -->

				<!-- 功能按钮开始 -->
				<div class="mt10f pb10">
					<button class="btn btn-primary" type="button" onclick="add()">添加</button>
					<span class="btn btn-primary btn-file">
						导入
						<input type="file" name="userFile" onchange="upload(this)"
							url="<%=request.getContextPath()%>/user/imp.action" />
					</span>
					<button class="btn btn-primary" type="button"
						onclick="window.open('<%=request.getContextPath()%>/user/exp.action')">导出</button>
					<button class="btn btn-primary" type="button"
						onclick="window.open('<%=request.getContextPath()%>/user/down.action')">下载模板</button>
				</div>
				<!-- 功能按钮结束 -->

				<!-- 查询结果开始 -->
				<div class="panel panel-primary">
					<div class="panel-heading">结果列表</div>
					<table class="table table-bordered table-hover table-condensed">
						<thead>
							<tr class="active">
								<th width="10%">编号</th>
								<th width="15%">用户名</th>
								<th width="10%">是否管理员</th>
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
											<td title="${user.admin ? '是' : '否' }">${user.admin ? '是' : '否' }</td>
											<td
												title="<fmt:formatDate value='${user.createTime }' pattern='yyyy-MM-dd HH:mm:ss' />">
												<fmt:formatDate value="${user.createTime }"
													pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td title="${user.desc }">${user.desc }</td>
											<td>
												<img class="img18" alt="edit" src="../img/view.png"
													onclick="view('${user.username }','${user.desc }', ${user.admin })" />
												<img class="img18" alt="edit" src="../img/edit.png"
													onclick="edit('${user.id }','${user.username }','${user.desc }', ${user.admin })" />
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
				<!-- 查询结果结束 -->

				<!-- 引入分页页面文件 -->
				<%@ include file="page.jsp"%>
			</div>
		</div>
	</div>

	<!-- 引入添加页面文件 -->
	<%@ include file="add.jsp"%>
	<!-- 引入编辑页面文件 -->
	<%@ include file="edit.jsp"%>
	<!-- 引入详情页面文件 -->
	<%@ include file="view.jsp"%>

	<!-- 引入脚本文件 -->
	<%@ include file="../js.jsp"%>
</body>
</html>