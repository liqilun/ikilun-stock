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
					<button class="btn btn-xs btn-info" data-toggle="modal" data-target="#myModal" name="chain">添加</button>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>名称</th>
							<th>状态</th>
							<th>添加时间</th>
						</tr>
					</thead>
					<tbody>
						<#list courseList as course> 
						<tr>
							<th>${course.id}</th>
							<th>${course.name!}</th>
							<th>
								<select id="batch${course.id}" onchange="updateStatus(${course.id},this.value)">
									<option value="Y" <#if course.status=='Y'> selected="selected" </#if>>可用</option>
									<option value="N" <#if course.status=='N'> selected="selected" </#if>>不可用</option>
								</select>
							</th>
							<th>${course.addTime?string('yyyy-MM-dd HH:mm')}</th>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		   <div class="modal-header">
		      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		      <h4 class="modal-title" id="myModalLabel">课程</h4>
		   </div>
		   <form class="form-horizontal" role="form" id="dbform">
			   <div class="modal-body  form-inline">
				   <div class="form-group form-inline">
				      <div class="col-sm-12">
				           	课程名称：<input type="text" class="form-control" id="name" name="name">
				      </div>
				   </div>
			   </div>
			   <div class="modal-footer">
			   	  <button type="button" class="btn btn-info" id="sbtForm" onclick="save()">保存</button>
			      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			   </div>
		   </form>
		</div>
	</div>
</div>
<script type="text/javascript">
function save(){
	var reqUrl= '${userPath}admin/course/save';
	jQuery.post(reqUrl, $("#dbform").serializeArray(),function(result){
		if(result.success){
			window.location.reload();
		}else {
			alert(result.msg);
		}
	});
}
function updateStatus(id,status){
	$("#batch"+id).css('background-color','red');
	var values = {'id':id,'status':status};
	jQuery.post("${userPath}admin/course/updateStatus", values,function(result){
		if(result.success){
			alert('设置成功！');
		}else {
			alert(result.msg);
		}
		$("#batch"+id).css('background-color','white');
	});
}
</script>
</body>
</html>