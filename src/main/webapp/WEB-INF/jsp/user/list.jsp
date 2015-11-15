<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<%-- 分页控件开始 --%>
<c:if test="${not empty users }">
	<form id="page" class="row mt10f" method="post"
		action="<%=request.getContextPath()%>/user/list.action">
		<%-- 隐藏域 --%>
		<input name="page" type="hidden" />
		<input name="usernamelike" type="hidden"
			value="${param.usernamelike }" />
		<input name="startTime" type="hidden"
			value="<fmt:formatDate value='${startTime }' pattern='yyyy-MM-dd HH:mm:ss' />" />
		<input name="endTime" type="hidden"
			value="<fmt:formatDate value='${endTime }' pattern='yyyy-MM-dd HH:mm:ss' />" />
		<%-- 分页详情 --%>
		<div class="col-md-6">
			<p class="text-primary">显示${usersPaginator.startRow }-${usersPaginator.endRow }条，共${usersPaginator.totalCount }条</p>
		</div>
		<%-- 分页导航 --%>
		<div class="col-md-6">
			<nav class="pull-right">
				<ul class="pagination m0">
					<c:choose>
						<c:when test="${usersPaginator.firstPage }">
							<li class="disabled">
								<span>&laquo;</span>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="javascript:Ums.list.page('1')">&laquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:forEach items="${usersPaginator.slider }" var="index">
						<c:choose>
							<c:when test="${index eq usersPaginator.page }">
								<li class="active">
									<span>${index }</span>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="javascript:Ums.list.page('${index }')">${index }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${usersPaginator.lastPage }">
							<li class="disabled">
								<span>&raquo;</span>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a
									href="javascript:Ums.list.page('${usersPaginator.totalPages }')">&raquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</form>
</c:if>
<%-- 分页控件结束 --%>