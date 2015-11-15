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
	data : $('#search').serialize(),
	search : function() {
		// 获取查询链接
		var url = $('#search').attr('action');
		// 获取查询条件
		Ums.list.data = $('#search').serialize();
		// 加载查询结果
		$('#list').load(url, Ums.list.data);
	},
	page : function(page) {
		// 获取查询链接
		var url = $('#search').attr('action');
		// 拼接查询条件
		url += "?page=" + page;
		// 加载查询结果
		$('#list').load(url, Ums.list.data);
	}
};