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
</head>
<body>
<#include "nav.ftl">
<div class="container">
		<div class="tab-pane fade in active">
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<form class="form-horizontal" role="form" id="dbform">
				   	<div class="modal-body">
				   		<div class="form-group">
						   	  <label for="companyName" class="col-sm-2 control-label">当前登录密码</label>
						      <div class="col-sm-6">
						      	 <input type="password" class="form-control" name="curpass" style="width: 240px;"/>
						      </div>
						</div>
						<div class="form-group">
						   	  <label for="briefName" class="col-sm-2 control-label">新密码</label>
						      <div class="col-sm-6">
						      	 <input type="password" class="form-control" name="password" style="width: 240px;">
						      </div>
						</div>
						<div class="form-group">
						   	  <label for="briefName" class="col-sm-2 control-label">再次输入新密码</label>
						      <div class="col-sm-6">
						      	 <input type="password" class="form-control" name="password2" style="width: 240px;">
						      </div>
						</div>
						<div class="form-group pull-center">
							<label class="col-sm-2 control-label">&nbsp;</label>
							 <button type="button" id="save" class="btn btn-info" onclick="modPass()">保存 </button>
						</div>
				   </div>
			   </form>
		   </div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
function modPass(){
	$('#save').attr("disabled",true); 
	jQuery.post("${userPath}admin/saveModpass", $("#dbform").serializeArray(),function(result){
		if(result.success){
			document.location.href='${userPath}login';
		}else {
			alert(result.msg);
			$('#save').attr("disabled",false); 
		}
	});
}
</script>
</body>
</html>