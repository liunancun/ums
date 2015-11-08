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
<title>角色管理</title>
<%-- 引入样式文件 --%>
<%@ include file="../common/css.jsp"%>
</head>
<body>
	<%-- 引入进度条页面 --%>
	<%@ include file="../common/progress.jsp"%>
	<%-- 引入页头文件 --%>
	<%@ include file="../common/brand.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<%-- 引入菜单文件 --%>
			<%@ include file="../common/menu.jsp"%>

			<div class="col-md-10 col-md-offset-2">
				<%-- 查询条件开始 --%>
				<div class="panel panel-primary">
					<div class="panel-heading">搜索条件</div>
					<div class="panel-body">
						<form id="search" method="post"
							action="<%=request.getContextPath()%>/role/list.action">
							<div class="row">
								<div class="form-group col-md-6">
									<label>名字</label>
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
								<button class="btn btn-primary" type="submit">搜索</button>
								<button class="btn btn-primary" type="button"
									onclick="clean(this)">重置</button>
							</div>
						</form>
					</div>
				</div>
				<%-- 查询条件结束 --%>

				<%-- 功能按钮开始 --%>
				<div class="mt10f pb10">
					<button class="btn btn-primary" type="button"
						url="<%=request.getContextPath()%>/role/initAdd.action"
						onclick="Ums.modal.load(this)">添加</button>
					<span class="btn btn-primary btn-file">
						导入
						<input type="file" name="userFile" onchange="upload(this)"
							url="<%=request.getContextPath()%>/role/imp.action" />
					</span>
					<button class="btn btn-primary" type="button"
						onclick="window.open('<%=request.getContextPath()%>/role/exp.action')">导出</button>
					<button class="btn btn-primary" type="button"
						onclick="window.open('<%=request.getContextPath()%>/role/down.action')">模板</button>
				</div>
				<%-- 功能按钮结束 --%>

				<%-- 查询结果开始 --%>
				<div class="panel panel-primary">
					<div class="panel-heading">结果列表</div>
					<table class="table table-bordered table-hover table-condensed">
						<thead>
							<tr class="active">
								<th width="10%">编号</th>
								<th width="15%">名字</th>
								<th width="20%">创建时间</th>
								<th>描述</th>
								<th width="15%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty roles }">
									<c:forEach items="${roles }" var="role">
										<tr>
											<td title="${role.id }">${role.id }</td>
											<td title="${role.name }">${role.name }</td>
											<td
												title="<fmt:formatDate value='${role.createTime }' pattern='yyyy-MM-dd HH:mm:ss' />">
												<fmt:formatDate value="${role.createTime }"
													pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td title="${role.desc }">${role.desc }</td>
											<td>
												<img class="img18" alt="edit" src="../img/view.png"
													url="<%=request.getContextPath()%>/role/view.action?id=${role.id }"
													onclick="Ums.modal.load(this)" />
												<img class="img18" alt="edit" src="../img/edit.png"
													url="<%=request.getContextPath()%>/role/initEdit.action?id=${role.id }"
													onclick="Ums.modal.load(this)" />
												<a href="delete.action?id=${role.id }">
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

				<c:if test="${not empty roles }">
					<%-- 引入分页页面文件 --%>
					<%@ include file="page.jsp"%>
				</c:if>
			</div>
		</div>
	</div>

	<%-- 引入脚本文件 --%>
	<%@ include file="../common/js.jsp"%>
</body>
</html>