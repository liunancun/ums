<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row mt10f">
	<div class="col-md-6">
		<p class="text-primary">显示${usersPaginator.startRow }-${usersPaginator.endRow }条，共${usersPaginator.totalCount }条</p>
	</div>
	<div class="col-md-6">
		<nav class="pull-right">
			<ul class="pagination m0">
				<li class="${usersPaginator.firstPage ? 'disabled' : '' }">
					<a href="javascript:page('1')">&laquo;</a>
				</li>
				<c:forEach items="${usersPaginator.slider }" var="index">
					<li
						class="${usersPaginator.isDisabledPage(index) ? 'active' : '' }">
						<a href="javascript:page('${index }')">${index }</a>
					</li>
				</c:forEach>
				<li class="${usersPaginator.lastPage ? 'disabled' : '' }">
					<a href="javascript:page('${usersPaginator.totalPages }')">&raquo;</a>
				</li>
			</ul>
		</nav>
	</div>
</div>
<form id="page_form" method="post" style="display: none;"
	action="<%=request.getContextPath()%>/user/list.action">
	<input name="page" type="hidden" />
	<input name="usernamelike" type="hidden" value="${param.usernamelike }" />
	<input name="startTime" type="hidden"
		value="<fmt:formatDate value='${startTime }' pattern='yyyy-MM-dd HH:mm:ss' />" />
	<input name="endTime" type="hidden"
		value="<fmt:formatDate value='${endTime }' pattern='yyyy-MM-dd HH:mm:ss' />" />
</form>