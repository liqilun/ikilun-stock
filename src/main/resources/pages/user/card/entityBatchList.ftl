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
							<th>名称</th>
							<th>卡数量</th>
							<th>手机号</th>
							<th>发送解压密码</th>
							<th>下载压缩包</th>
							<th>添加时间</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						<#list batchList as batch> 
						<tr>
							<td>${batch.id}</td>
							<td>${batch.name!}</td>
							<td>${batch.num!}</td>
							<td>${batch.mobile!}</td>
							<td><button class="btn btn-xs btn-info" data-id="${batch.id}" onclick="sendZipPass(${batch.id})">发送</button></td>
							<td><a class="btn btn-xs btn-info" href="${userPath}admin/card/downEntityBatch?id=${batch.id}">下载</a></td>
							<td>${batch.addTime?string('yyyy-MM-dd HH:mm')}</td>
							<td><button class="btn btn-xs btn-info" data-id="${batch.id}" data-toggle="modal" data-target="#myModal" name="chain">修改</button></td>
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
	$("#myModal").load('${userPath}admin/card/getEntityBatch',{"id":$(this).attr('data-id')});
});
function sendZipPass(id){
	var reqUrl= '${userPath}admin/card/sendEntityZipPass';
	jQuery.post(reqUrl, {"id":id},function(result){
		if(result.success){
			alert("发送成功");
		}else {
			alert(result.msg);
		}
	});
}
</script>
</body>
</html>