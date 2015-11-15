<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="panel panel-primary">
	<div class="panel-heading">搜索条件</div>
	<div class="panel-body">
		<form method="post"
			action="<%=request.getContextPath()%>/data/list.action">
			<div class="row">
				<div class="form-group col-md-6">
					<label>查询条件</label>
					<input type="text" class="form-control" />
				</div>
				<div class="form-group col-md-6">
					<label>查询条件</label>
					<input type="text" class="form-control" />
				</div>
			</div>
			<div class="pull-right">
				<button class="btn btn-primary" type="submit">搜索</button>
				<button class="btn btn-primary" type="reset">重置</button>
			</div>
		</form>
	</div>
</div>
<div class="mt10f pb10">
	<button class="btn btn-primary" type="button">添加</button>
	<button class="btn btn-primary" type="button">导入</button>
</div>
<div class="panel panel-primary">
	<div class="panel-heading">搜索结果</div>
	<table class="table table-bordered">
		<thead>
			<tr class="active">
				<th>表格标题</th>
				<th>表格标题</th>
				<th>表格标题</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
			<tr>
				<td>表格单元格</td>
				<td>表格单元格</td>
				<td>表格单元格</td>
			</tr>
		</tbody>
	</table>
</div>
<nav class="mt20f pull-right">
	<ul class="pagination">
		<li>
			<span>100条记录1/10页</span>
		</li>
		<li>
			<a href="#">首页</a>
		</li>
		<li>
			<a href="#">上一页</a>
		</li>
		<li>
			<a href="#">下一页</a>
		</li>
		<li>
			<a href="#">尾页</a>
		</li>
	</ul>
</nav>