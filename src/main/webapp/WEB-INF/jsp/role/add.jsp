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
					<label>名字</label>
					<input class="form-control" type="text" id="add_name" name="name"
						required />
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea class="form-control" rows="5" id="add_desc" name="desc"></textarea>
				</div>
				<label>权限</label>
				<div class="panel panel-default oy200">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
				<button class="btn btn-primary" type="submit">提交</button>
			</div>
		</form>
	</div>
</div>
<script>
	var setting = {
		check : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true
			}
		}
	};

	var data = [ {
		id : 1,
		pId : 0,
		name : "数据管理"
	}, {
		id : 11,
		pId : 1,
		name : "查看"
	}, {
		id : 12,
		pId : 1,
		name : "添加"
	}, {
		id : 13,
		pId : 1,
		name : "修改"
	}, {
		id : 14,
		pId : 1,
		name : "删除"
	}, {
		id : 2,
		pId : 0,
		name : "用户管理"
	}, {
		id : 21,
		pId : 2,
		name : "查看"
	}, {
		id : 22,
		pId : 2,
		name : "添加"
	}, {
		id : 23,
		pId : 2,
		name : "修改"
	}, {
		id : 24,
		pId : 2,
		name : "删除"
	}, {
		id : 3,
		pId : 0,
		name : "角色管理"
	}, {
		id : 31,
		pId : 3,
		name : "查看"
	}, {
		id : 32,
		pId : 3,
		name : "添加"
	}, {
		id : 33,
		pId : 3,
		name : "修改"
	}, {
		id : 34,
		pId : 3,
		name : "删除"
	} ];

	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting, data);
	});
</script>