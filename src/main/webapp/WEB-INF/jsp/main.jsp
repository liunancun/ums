<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户管理系统</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/menu.css" rel="stylesheet">
</head>
<body>
	<%-- 引入页头文件 --%>
	<%@ include file="brand.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<%-- 引入菜单文件 --%>
			<%@ include file="menu.jsp"%>

			<div class="col-md-10 col-md-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading">搜索条件</div>
					<div class="panel-body">
						<form method="post"
							action="<%=request.getContextPath()%>/user/list.action">
							<div class="row">
								<div class="form-group col-md-6">
									<label>账号</label>
									<input type="text" class="form-control" name="username"
										value="${param.username }" />
								</div>
								<div class="form-group col-md-6">
									<label>昵称</label>
									<input type="text"
										class="form-control date yyyy-mm-dd calendar" name="nickname"
										value="${param.nickname }" />
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
					<button class="btn btn-primary" type="button" onclick="add()">添加</button>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">搜索结果</div>
					<table class="table table-bordered">
						<thead>
							<tr class="active">
								<th width="10%">编号</th>
								<th width="15%">账号</th>
								<th width="15%">昵称</th>
								<th width="15%">创建时间</th>
								<th>描述</th>
								<th width="15%">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>001</td>
								<td>admin</td>
								<td>Admin</td>
								<td>2015-10-22 22:12</td>
								<td>Admin</td>
								<td>
									<img class="img18" alt="edit" src="img/view.png" />
									<img class="img18" alt="edit" src="img/edit.png" />
									<img class="img18" alt="edit" src="img/delete.png" />
								</td>
							</tr>
							<tr>
								<td>001</td>
								<td>admin</td>
								<td>Admin</td>
								<td>2015-10-22 22:12</td>
								<td>Admin</td>
								<td>
									<img class="img18" alt="edit" src="img/view.png" />
									<img class="img18" alt="edit" src="img/edit.png" />
									<img class="img18" alt="edit" src="img/delete.png" />
								</td>
							</tr>
							<tr>
								<td>001</td>
								<td>admin</td>
								<td>Admin</td>
								<td>2015-10-22 22:12</td>
								<td>Admin</td>
								<td>
									<img class="img18" alt="edit" src="img/view.png" />
									<img class="img18" alt="edit" src="img/edit.png" />
									<img class="img18" alt="edit" src="img/delete.png" />
								</td>
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
			</div>
		</div>
	</div>

	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>