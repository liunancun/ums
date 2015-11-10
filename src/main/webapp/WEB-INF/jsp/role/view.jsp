<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="modal">
	<div class="modal-dialog">
		<form class="modal-content" method="post"
			action="<%=request.getContextPath()%>/user/edit.action">
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">查看角色</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>名字</label>
					<input class="form-control" type="text" value="${role.name }"
						readonly />
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea class="form-control" rows="5" readonly>${role.desc }</textarea>
				</div>
				<label>权限</label>
				<div class="panel panel-default oy200">
					<ul id="ztree" class="ztree"></ul>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
			</div>
		</form>
	</div>
</div>
<script>
	$(document).ready(function() {
		$.fn.zTree.init($("#ztree"), viewSetting, ${treeNode});
	});
</script>