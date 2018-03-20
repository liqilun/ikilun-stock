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
<script src="${staticPath}dpicker/WdatePicker.js"></script>
</head>
<body>
<body><#assign isCardNav='Y'/>
<#include "../nav.ftl">
<div class="container">
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<div class="pull-right">
					<button class="btn btn-xs btn-info" data-toggle="modal" data-target="#myModal" data-id="" data-type='month' name="chain">添加月卡</button>&nbsp;&nbsp;
					<button class="btn btn-xs btn-info" data-toggle="modal" data-target="#myModal" data-id="" data-type='charge' name="chain">添加充值卡</button>
					<a class="btn btn-xs btn-info" href="${gymUserPath}admin/gym/courseList">课程管理</a>&nbsp;&nbsp;
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>卡类型</th>
							<th>面值</th>
							<th>珠币(1珠币=10元)</th>
							<th>赠送</th>
							<th>状态</th>
							<th>有效时间</th>
							<th>添加时间</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						<#list batchList as batch> 
						<tr><#assign zhubi=batch.amount/10 />
							<td>${(batch.cardType=='month')?string('月卡','充值卡')}</td>
							<td>${batch.amount}</td>
							<td>${zhubi}</td>
							<td>${batch.giveAmount}</td>
							<td>
								<select id="batch${batch.id}" onchange="cardStatus(${batch.id},this.value)">
									<option value="online" <#if batch.status=='online'> selected="selected" </#if>>在线销售</option>
									<option value="offline" <#if batch.status=='offline'> selected="selected" </#if>>停止销售</option>
								</select>
							</td>
							<td><#if batch.endTime??>${batch.endTime?string('yyyy-MM-dd HH:mm')}</#if></td>
							<td>${batch.beginTime?string('yyyy-MM-dd')}</td>
							<td><button class="btn btn-xs btn-info" data-id="${batch.id!}" data-type='${batch.cardType!}' data-toggle="modal" data-target="#myModal" name="chain">修改</button></td>
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
	$("#myModal").load('${gymUserPath}admin/card/batchDetail',{"id":$(this).attr('data-id'),"cardType":$(this).attr('data-type')});
});
function cardStatus(id,status){
	$("#batch"+id).css('background-color','red');
	var values = {'id':id,'status':status};
	jQuery.post("${gymUserPath}admin/card/updateBatchStatus", values,function(result){
		if(result.success){
			alert('设置成功！');
		}else {
			alert(result.msg);
		}
		$("#batch"+id).css('background-color','white');
	});
}
function saveRate(){
	$('#sbtForm2').attr("disabled",true); 
	var values = $("#rateForm").serializeArray();
	jQuery.post("${gymUserPath}admin/payRate/save", values,function(result){
		if(result.success){
			alert('保存成功！');
			window.location.reload();
		}else {
			alert('保存失败：'+result.msg);
			$('#sbtForm2').attr("disabled",false); 
		}
	});
}
</script>
</body>
</html>