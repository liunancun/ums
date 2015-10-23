<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="view">
	<div class="modal-dialog">
		<form class="modal-content" method="post"
			action="<%=request.getContextPath()%>/user/edit.action">
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">查看用户</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="form-group col-md-6">
						<label>用户名</label>
						<input class="form-control" type="text" id="view_username"
							readonly />
					</div>
					<div class="form-group col-md-6">
						<label>管理员</label>
						<div class="switch">
							<input type="checkbox" id="view_admin" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea class="form-control" rows="5" id="view_desc" readonly></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
			</div>
		</form>
	</div>
</div>