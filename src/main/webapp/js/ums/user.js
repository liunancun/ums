$(function(argument) {
	// 初始化日期组件
	$('.yyyy-mm-dd').datetimepicker({
		format : 'yyyy-mm-dd',
		language : 'zh-CN',
		autoclose : true,
		minView : 2,
		pickerPosition : 'bottom-left'
	});
	// 初始化开始时间空控件
	$('.start-time').datetimepicker({
		format : 'yyyy-mm-dd',
		language : 'zh-CN',
		autoclose : true,
		minView : 2,
		linkField : "start_time",
		linkFormat : "yyyy-mm-dd 00:00:00"
	});
	// 初始化结束时间控件
	$('.end-time').datetimepicker({
		format : 'yyyy-mm-dd',
		language : 'zh-CN',
		autoclose : true,
		minView : 2,
		linkField : "end_time",
		linkFormat : "yyyy-mm-dd 23:59:59"
	});
});

function load(obj) {
	Ums.modal.load(obj);
}

function add() {

}

function edit() {

}

function del() {

}