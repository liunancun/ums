function link(obj) {
	Ums.menu.load(obj);
	return false;
}

function load(obj) {
	Ums.modal.load(obj);
}

function add(obj) {
	// 执行添加
	Ums.list.add(obj);
	// 隐藏模态框
	$('#modal').modal('hide');
	return false;
}

function edit(obj) {
	// 执行编辑
	Ums.list.add(obj);
	// 隐藏模态框
	$('#modal').modal('hide');
	return false;
}

function del(obj) {
	// 执行编删除
	Ums.list.del(obj);
	return false;
}