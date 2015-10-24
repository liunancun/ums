function add() {
	$('#add_username').val('');
	$('#add_password').val('');
	$('#add_confirm').val('');
	$('#add_desc').val('');
	$('#add_admin').bootstrapSwitch('state', false);
	$('#add').modal();
}

function view(username, desc, admin) {
	$('#view_username').val(username);
	$('#view_desc').val(desc);
	$('#view_admin').bootstrapSwitch('state', admin);
	$('#view').modal();
}

function edit(id, username, desc, admin) {
	$('#edit_id').val(id);
	$('#edit_username').val(username);
	$('#edit_desc').val(desc);
	$('#edit_admin').bootstrapSwitch('state', admin);
	$('#edit').modal();
}

$(function(argument) {
	// 初始化开关组件
	$('[type="checkbox"]').bootstrapSwitch();

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