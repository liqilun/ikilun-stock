<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>后台管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link type="text/css" rel="stylesheet" href="${staticPath}bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${staticPath}css/bootcss.css" />
<link rel="stylesheet" type="text/css" href="${staticPath}css/animate.css" />
<script src="${staticPath}jquery/2.0.3/jquery.min.js"></script>
<script src="${staticPath}bootstrap/js/bootstrap.min.js"></script>
</head>
<body><#assign isMemberNav='Y'/>
<#include "../nav.ftl">
<div class="container">
		<div class="subNavbar">
			<ul class="list-inline2">
				<li class="glyphicon glyphicon-star-empty"><a
					href="${userPath}admin/sms/list">短信列表</a></li>
			</ul>
		</div>
</div>
<div class="container">
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-10">&nbsp;</div>
			<div class="col-md-12">
				<form action="${userPath}admin/member/list.xhtml" class="form-inline" role="form">
					<div class="form-group form-inline">
						<div class="pull-left">
							<label class="sr-only" for="mobile">手机号</label>
							<input type="text" name="mobile" class="form-control" value="${mobile!}" placeholder="接受短信手机号"/>
							<input type="submit" class="btn btn-default" value="搜索"/>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>手机号</th>
							<th>状态</th>
							<th>查看订单</th>
							<th>注册时间</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
</div>
<script type="text/javascript">
</script>
</body>
</html>