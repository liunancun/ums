var setting = {
	check : {
		enable : true
	},
	data : {
		simpleData : {
			enable : true,
			pIdKey : "pid"
		}
	}
};

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
	$('#resources').val(ids);
}