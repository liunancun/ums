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
	name : "查看",
	checked : true
}, {
	id : 32,
	pId : 3,
	name : "添加",
	checked : true
}, {
	id : 33,
	pId : 3,
	name : "修改",
	checked : true
}, {
	id : 34,
	pId : 3,
	name : "删除",
	checked : true
} ];

function jsonToString() {
	var treeObj = $.fn.zTree.getZTreeObj("ztree");
	var nodes = treeObj.getCheckedNodes();

	var ids = '';
	for (var i = 0; i < nodes.length; i++) {
		if (i != 0) {
			ids += ',';
		}
		ids += nodes[i].id;
	}
	$('#selectIds').val(ids);
}