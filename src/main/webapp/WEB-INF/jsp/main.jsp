<%-- 系统主页 --%>
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
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/menu.css" rel="stylesheet">
</head>
<body>
	<%-- 引入进度条页面 --%>
	<%@ include file="common/progress.jsp"%>
	<%-- 引入页头文件 --%>
	<%@ include file="common/brand.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<%-- 引入菜单文件 --%>
			<%@ include file="common/menu.jsp"%>
			<%-- 主页轮播图片 --%>
			<div id="main" class="col-md-10 col-md-offset-2">
				<div id="image" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#image" data-slide-to="0" class="active"></li>
						<li data-target="#image" data-slide-to="1"></li>
						<li data-target="#image" data-slide-to="2"></li>
						<li data-target="#image" data-slide-to="3"></li>
						<li data-target="#image" data-slide-to="4"></li>
						<li data-target="#image" data-slide-to="5"></li>
						<li data-target="#image" data-slide-to="6"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="img/main/0.jpg" width="100%" height="100%" />
						</div>
						<div class="item">
							<img src="img/main/1.jpg" width="100%" height="100%" />
						</div>
						<div class="item">
							<img src="img/main/2.jpg" width="100%" height="100%" />
						</div>
						<div class="item">
							<img src="img/main/3.jpg" width="100%" height="100%" />
						</div>
						<div class="item">
							<img src="img/main/4.jpg" width="100%" height="100%" />
						</div>
						<div class="item">
							<img src="img/main/5.jpg" width="100%" height="100%" />
						</div>
						<div class="item">
							<img src="img/main/6.jpg" width="100%" height="100%" />
						</div>
					</div>
					<a class="left carousel-control" href="#image" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#image" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
		</div>
	</div>

	<%-- 引入jquery组件 --%>
	<script src="js/jquery-1.11.3.min.js"></script>
	<%-- 引入bootstrap组件 --%>
	<script src="js/bootstrap.min.js"></script>
	<%-- 引入bootstrap日期时间组件 --%>
	<script src="js/bootstrap-datetimepicker.min.js"></script>
	<%-- 引入bootstrap日期时间组件中文国际化 --%>
	<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
	<%-- 引入zTree组件 --%>
	<script src="js/jquery.ztree.all-3.5.min.js"></script>
	<%-- 引入自定义脚本 --%>
	<script src="js/upload.js"></script>
	<script src="js/ums.js"></script>
	<script src="js/ums/main.js"></script>
</body>
</html>