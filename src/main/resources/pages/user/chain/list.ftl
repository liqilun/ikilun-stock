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
							<th>批次名称</th>
							<th>添加时间</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						<#list chainList as chain> 
						<tr>
							<th>${chain.id}</th>
							<th>${chain.name!}</th>
							<th>${chain.addTime?string('yyyy-MM-dd HH:mm')}</th>
							<th><button class="btn btn-xs btn-info" data-id="${chain.id}" data-toggle="modal" data-target="#myModal" name="chain">修改</button></th>
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
	$("#myModal").load('${userPath}admin/chain/detail',{"id":$(this).attr('data-id')});
});
</script>
</body>
</html>