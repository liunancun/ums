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