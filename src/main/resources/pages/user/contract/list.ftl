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
<link href="${staticPath}bootstrap/css/fileinput.min.css" rel="stylesheet">
<script src="${staticPath}jquery/2.0.3/jquery.min.js"></script>
<script src="${staticPath}bootstrap/js/bootstrap.min.js"></script>
<script src="${staticPath}bootstrap/js/fileinput.min.js"></script>
<script src="${staticPath}bootstrap/js/fileinput_locale_zh.js"></script>
<script src="${staticPath}dpicker/WdatePicker.js"></script>
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
							<th>合同开始日期</th>
							<th>合同结束日期</th>
							<th>合同文件</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						<#list contractList as contract> 
						<tr>
							<th>${contract.id}</th>
							<th>${contract.startDate?string('yyyy-MM-dd')!}</th>
							<th>${contract.endDate?string('yyyy-MM-dd')!}</th>
							<th><#if contract.fileName??><a href="${imagePath}${contract.fileName!}">查看</a></#if></th>
							<th><button class="btn btn-xs btn-info" data-id="${contract.id}" data-toggle="modal" data-target="#myModal" name="chain">修改</button></th>
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
	$("#myModal").load('${userPath}admin/contract/detail',{"id":$(this).attr('data-id'),"gymId":"${gymId}"});
});
</script>
</body>
</html>