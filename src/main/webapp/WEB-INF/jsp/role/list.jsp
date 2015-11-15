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
				<th width="15%">角色名</th>
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
								<img class="img18" src="img/view.png" onclick="load(this)"
									url="<%=request.getContextPath()%>/role/view.action?id=${role.id }" />
								<img class="img18" src="img/edit.png" onclick="load(this)"
									url="<%=request.getContextPath()%>/role/initEdit.action?id=${role.id }" />
								<img class="img18" src="img/delete.png" onclick="del(this)"
									url="<%=request.getContextPath()%>/role/delete.action?id=${role.id }" />
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
<c:if test="${not empty roles }">
	<div class="row mt10f">
		<%-- 分页详情 --%>
		<div class="col-md-6">
			<p class="text-primary">显示${rolesPaginator.startRow }-${rolesPaginator.endRow }条，共${rolesPaginator.totalCount }条</p>
		</div>
		<%-- 分页导航 --%>
		<div class="col-md-6">
			<nav class="pull-right">
				<ul class="pagination m0">
					<c:choose>
						<c:when test="${rolesPaginator.firstPage }">
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
					<c:forEach items="${rolesPaginator.slider }" var="index">
						<c:choose>
							<c:when test="${index eq rolesPaginator.page }">
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
						<c:when test="${rolesPaginator.lastPage }">
							<li class="disabled">
								<span>&raquo;</span>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a
									href="javascript:Ums.list.page('${rolesPaginator.totalPages }')">&raquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>
</c:if>
<%-- 分页控件结束 --%>