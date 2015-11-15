var Ums = Ums || {};

Ums.modal = {
	load : function(obj) {
		// 获取请求链接
		var url = $(obj).attr('url');
		$.post(url, function(result) {
			// 已经存在模态框需要删除
			$('#modal').remove();
			// 将返回的元素插入到页面
			$('body').append(result);
			// 显示模态框
			$('#modal').modal();
		});
	}
};

Ums.list = {
	// 查询条件
	data : '',
	// 页码条件
	index : 1,
	// 搜索数据
	search : function() {
		// 缓存查询条件
		Ums.list.data = $('#search').serialize();
		// 执行查询
		Ums.list.query();
	},
	// 分页查询
	page : function(index) {
		// 缓存页码条件
		Ums.list.index = index;
		// 执行查询
		Ums.list.query();
	},
	// 查询数据
	query : function() {
		// 获取查询链接
		var url = $('#search').attr('action');
		// 拼接页码条件
		url += "?page=" + Ums.list.index;
		// 加载查询结果
		$('#list').load(url, Ums.list.data);
	},
	// 添加数据
	add : function() {
		// 获取添加链接
		var url = $('#add').attr('action');
		// 获取添加数据
		var data = $('#add').serialize();
		// 执行添加
		$.post(url, data);

		// 执行查询
		Ums.list.query();
	},
	// 编辑数据
	edit : function() {
		// 获取编辑链接
		var url = $('#edit').attr('action');
		// 获取编辑数据
		var data = $('#edit').serialize();
		// 执行编辑
		$.post(url, data);

		// 执行查询
		Ums.list.query();
	},
	// 删除数据
	del : function() {

	}
};