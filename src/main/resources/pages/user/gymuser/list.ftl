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
<script src="${staticPath}jquery/2.0.3/jquery.min.js"></script>
<script src="${staticPath}bootstrap/js/bootstrap.min.js"></script>
</head>
<body><#assign isGymNav='Y'/>
<#include "../nav.ftl">
<#include "../subNav.ftl">
<div class="container">
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-10">&nbsp;</div>
			<div class="col-md-12">
				<div class="pull-right">
					<button class="btn btn-xs btn-info" data-toggle="modal" data-target="#myModal" data-id="" name="chain">添加</button>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>登录名</th>
							<th>真实姓名</th>
							<th>状态</th>
							<th>添加时间</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						<#list gymUserList as gymUser> 
						<tr>
							<th>${gymUser.id}</th>
							<th>${gymUser.username!}</th>
							<th>${gymUser.realName!}</th>
							<th><#if gymUser.status=='Y'>开放<#elseif gymUser.status=='N'>关闭</#if></th>
							<th>${gymUser.addTime?string('yyyy-MM-dd HH:mm')}</th>
							<th><button class="btn btn-xs btn-info" data-id="${gymUser.id}" data-toggle="modal" data-target="#myModal" name="chain">修改</button></th>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
$("button[name=chain]").click(function(){
	$("#myModal").load('${userPath}admin/gymuser/detail',{"id":$(this).attr('data-id'),'gymId':'${gymId}'});
});
</script>
</body>
</html>