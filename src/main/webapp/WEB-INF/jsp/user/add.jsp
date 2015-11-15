<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="modal">
	<div class="modal-dialog">
		<form class="modal-content" onsubmit="return add(this)"
			action="<%=request.getContextPath()%>/user/add.action">
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加用户</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>用户名</label>
					<input class="form-control" type="text" id="add_username"
						name="username" required />
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label>密码</label>
						<input class="form-control" type="password" id="add_password"
							name="password" required />
					</div>
					<div class="form-group col-md-6">
						<label>确认密码</label>
						<input class="form-control" type="password" id="add_confirm"
							name="confirm" required />
					</div>
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea class="form-control" rows="5" id="add_desc" name="desc"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
				<button class="btn btn-primary" type="submit">提交</button>
			</div>
		</form>
	</div>
</div>