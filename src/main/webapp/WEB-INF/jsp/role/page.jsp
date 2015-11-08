<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="page" class="row mt10f" method="post"
	action="<%=request.getContextPath()%>/user/list.action">
	<%-- 隐藏域 --%>
	<input name="page" type="hidden" />
	<input name="namelike" type="hidden" value="${param.namelike }" />
	<input name="startTime" type="hidden"
		value="<fmt:formatDate value='${startTime }' pattern='yyyy-MM-dd HH:mm:ss' />" />
	<input name="endTime" type="hidden"
		value="<fmt:formatDate value='${endTime }' pattern='yyyy-MM-dd HH:mm:ss' />" />
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
							<a href="javascript:page('1')">&laquo;</a>
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
								<a href="javascript:page('${index }')">${index }</a>
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
							<a href="javascript:page('${rolesPaginator.totalPages }')">&raquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</form>