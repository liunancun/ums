<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="imp">
	<div class="modal-dialog">
		<form class="modal-content" method="post"
			action="<%=request.getContextPath()%>/user/import.action">
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">导入用户</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>描述</label>
					<textarea class="form-control" rows="5"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
				<button class="btn btn-primary" type="submit">提交</button>
			</div>
		</form>
	</div>
</div>