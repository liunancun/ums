<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="edit">
	<div class="modal-dialog">
		<form class="modal-content" method="post"
			action="<%=request.getContextPath()%>/user/edit.action">
			<input type="hidden" id="edit_id" name="id" />
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">编辑用户</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="form-group col-md-6">
						<label>用户名</label>
						<input class="form-control" type="text" id="edit_username"
							readonly />
					</div>
					<div class="form-group col-md-6">
						<label>管理员</label>
						<div class="switch">
							<input type="checkbox" id="edit_admin" name="admin" value="true" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label>密码</label>
						<input class="form-control" type="password" name="password" />
					</div>
					<div class="form-group col-md-6">
						<label>确认密码</label>
						<input class="form-control" type="password" name="confirm" />
					</div>
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea class="form-control" rows="5" id="edit_desc" name="desc"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
				<button class="btn btn-primary" type="submit">提交</button>
			</div>
		</form>
	</div>
</div>