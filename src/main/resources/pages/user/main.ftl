<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<!--兼容IE-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--移动设备优先-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>列表</title>
		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="${staticPath}bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${staticPath}css/bootcss.css" />
		<link rel="stylesheet" type="text/css" href="${staticPath}css/animate.css" />
	</head>
	<body><#assign isIndexNav='Y'>
		<#include "nav.ftl">
		<div class="container">
			<div class="alert alert-danger alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4>系统安全升级</h4>
				<p>为了提供更好的服务，服务器今天暂停1个小时，给大家带来的不便敬请谅解！</p>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">网站统计数据</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<td>统计项目</td>
										<td>昨日</td>
										<td>今日</td>
									</tr>
								</thead>
								<tr>
									<td>注册会员</td>
									<td>20</td>
									<td>40</td>

								</tr>
								<tr>
									<td>登录会员</td>
									<td>20</td>
									<td>40</td>
								</tr>
								<tr>
									<td>昨日订单</td>
									<td>20</td>
									<td>40</td>
								</tr>
								<tr>

									<td>今日订单</td>
									<td>20</td>
									<td>40</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">用户留言</div>
						<!--<div class="panel-body">-->
						<ul class="list-group">
							<li class="list-group-item">
								<a href=""><span class="glyphicon glyphicon-list-alt"></span>&nbsp;麦子学院北京公司成立，发力服务全国市场<span class="pull-right">2015年12月25号</span></a>
							</li>
							<li class="list-group-item">
								<a href=""><span class="glyphicon glyphicon-list-alt"></span>&nbsp;麦子学院北京公司成立，发力服务全国市场<span class="pull-right">2015年12月25号</span></a>
							</li>
							<li class="list-group-item">
								<a href=""><span class="glyphicon glyphicon-list-alt"></span>&nbsp;麦子学院北京公司成立，发力服务全国市场<span class="pull-right">2015年12月25号</span></a>
							</li>
							<li class="list-group-item">
								<a href=""><span class="glyphicon glyphicon-list-alt"></span>&nbsp;麦子学院北京公司成立，发力服务全国市场<span class="pull-right">2015年12月25号</span></a>
							</li>
							<li class="list-group-item">
								<a href=""><span class="glyphicon glyphicon-list-alt"></span>&nbsp;麦子学院北京公司成立，发力服务全国市场<span class="pull-right">2015年12月25号</span></a>
							</li>
							<li class="list-group-item">
								<a href=""><span class="glyphicon glyphicon-list-alt"></span>&nbsp;麦子学院北京公司成立，发力服务全国市场<span class="pull-right">2015年12月25号</span></a>
							</li>

						</ul>

					</div>
				</div>
			</div>
		</div>
		<!--警告-->
		<!--曲线图 进度条-->
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">今日访客统计</div>
						<div class="panel-body">
							<canvas id="canvas" class="col-md-12"></canvas>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel panel-heading">服务器状态</div>
						<div class="panel panel-body">
							<p>内存使用率：40%</p>
							<div class="progress">

								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
									<span class="sr-only">40% Complete (success)</span>
								</div>
							</div>
							<p>内存使用率：40%</p>
							<div class="progress">
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
									<span class="sr-only">20% Complete</span>
								</div>
							</div>
							<p>内存使用率：40%</p>
							<div class="progress">
								<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (warning)</span>
								</div>
							</div>
							<p>内存使用率：40%</p>
							<div class="progress">
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
									<span class="sr-only">80% Complete (danger)</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--曲线图 进度条-->
	</body>
	<script src="${staticPath}jquery/2.0.3/jquery.min.js"></script>
	<script src="${staticPath}bootstrap/js/bootstrap.min.js"></script>
	<script src="${staticPath}js/script.js"></script>
	<script src="${staticPath}js/Chart.js"></script>
</html>