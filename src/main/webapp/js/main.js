/**
 * 清空表单内的元素值
 * 
 * @param obj
 */
function clean(obj) {
	// 获取到按钮所在表单
	var $from = $(obj).parents('form');
	// 清空表单内的元素值
	$from.find(':input').not(":button, :submit, :reset").val("").removeAttr(
			"checked").remove("selected");
}