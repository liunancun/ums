<%-- 进度条页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="progress"
	url="<%=request.getContextPath()%>/progress.action">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="progress mb0">
					<div class="progress-bar" style="min-width: 2em; width: 0;">
						<span>0%</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>