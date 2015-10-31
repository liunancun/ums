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
			// 显示进度条
			$('#progress').modal({
				backdrop : 'static'
			});
			// 更新上传进度
			progress();
		}
	});
}

function progress() {
	// 延时2秒
	setTimeout(function() {
		// 更新进度
		var url = $('#progress').attr('url');
		$.ajax({
			url : url,
			success : function(data) {
				var width = 'min-width: 2em;width: ' + data + '%;';
				var html = data + '%';
				$('#progress').find('div:last').attr('style', width);
				$('#progress').find('span:last').html(html);
				if (data < 100) {
					progress();
				} else {
					// 延时2秒
					setTimeout(function() {
						// 刷新当前页
						location.replace(location);
					}, 2000);
				}
			}
		});
	}, 2000);
}