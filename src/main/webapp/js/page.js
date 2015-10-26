function page(page) {
	// 设置页数
	$('#page_form').find('input:first').val(page);
	// 提交分页数据
	$('#page_form').submit()
}