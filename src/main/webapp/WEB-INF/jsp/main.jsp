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
<link href="css/style.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/menu.css" rel="stylesheet">
</head>
<body>
	<%-- 引入页头文件 --%>
	<%@ include file="common/brand.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<%-- 引入菜单文件 --%>
			<%@ include file="common/menu.jsp"%>
			<%-- 主页轮播图片 --%>
			<div class="col-md-10 col-md-offset-2">
				<div id="main" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#main" data-slide-to="0" class="active"></li>
						<li data-target="#main" data-slide-to="1"></li>
						<li data-target="#main" data-slide-to="2"></li>
						<li data-target="#main" data-slide-to="3"></li>
						<li data-target="#main" data-slide-to="4"></li>
						<li data-target="#main" data-slide-to="5"></li>
						<li data-target="#main" data-slide-to="6"></li>
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
					<a class="left carousel-control" href="#main" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#main" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>