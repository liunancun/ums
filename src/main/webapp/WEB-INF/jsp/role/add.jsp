<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="modal">
	<div class="modal-dialog">
		<form class="modal-content" method="post"
			action="<%=request.getContextPath()%>/role/add.action">
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加角色</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>角色名</label>
					<input class="form-control" type="text" id="add_name" name="name"
						required />
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea class="form-control" rows="5" id="add_desc" name="desc"></textarea>
				</div>
				<label>权限</label>
				<input id="resources" name="resources" type="hidden" />
				<div class="panel panel-default oy200">
					<ul id="ztree" class="ztree"></ul>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
				<button class="btn btn-primary" type="submit"
					onclick="jsonToString()">提交</button>
			</div>
		</form>
	</div>
</div>
<script>
	$(document).ready(function() {
		$.fn.zTree.init($("#ztree"), checkSetting, ${treeNode});
	});
</script>