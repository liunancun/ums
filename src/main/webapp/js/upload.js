function upload(obj) {
	var name = $(obj).attr('name');
	var url = $(obj).attr('url');

	var fd = new FormData();
	fd.append("upload", 1);
	fd.append(name, $(obj).get(0).files[0]);
	$.ajax({
		url : url,
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		beforeSend : function() {
			// 重置文件上传表单
			$(obj).val('');
			// 弹出进度条

		},
		success : function(data) {
			// 关闭进度条
			alert('关闭进度条');
			// 刷新列表页面

		},
		error : function(data) {
			// 弹出错误页面

		}
	});
}