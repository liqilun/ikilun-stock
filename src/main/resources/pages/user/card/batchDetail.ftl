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
<script type="text/javascript" src="${staticPath}ckeditor/ckeditor.js"></script>
</head>
<body><#assign isGymNav='Y'/>
<#include "../nav.ftl">
<#include "../subNav.ftl">
<div class="container">
		<div class="tab-pane fade in active">
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<form class="form-horizontal" role="form" id="dbform">
				   	<div class="modal-body">
				   		<div class="form-group">
						   	  <input type="hidden" name="id" id="id" value="${batch.id!}">
						   	   <label for="companyName" class="col-sm-2 control-label">订单名称</label>
						      <div class="col-sm-6">
						      	 <input type="text" class="form-control" name="name" value="${batch.name!}"  placeholder="公司名称">
						      </div>
						</div>
						<div class="form-group">
						   	  <label for="soldAmount" class="col-sm-2 control-label">售价</label>
						      <div class="col-sm-6">
						      	 <input type="text" class="form-control" name="soldAmount" id="soldAmount" value="${batch.soldAmount!}" >
						      </div>
						</div>
						<div class="form-group">
						   	  <label for="soldAmount" class="col-sm-2 control-label">面值</label>
						      <div class="col-sm-6">
						      	 <input type="text" class="form-control" name="amount" id="amount" value="${batch.amount!}" >
						      </div>
						</div>
						<div class="form-group form-inline">
						   	  <label for="fzrPhone" class="col-sm-2 control-label">有效时间</label>
						      <div class="col-sm-10">
						      	 <input type="text" class="form-control" name="beginTime" id="beginTime" value="${batch.beginTime!}" 
						      	 	onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" style="width: 180px;">
						      	 --
						      	 <input type="text" class="form-control" name="endTime" id="endTime" value="${batch.endTime!}" 
						      	 	onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" style="width: 180px;">
						      </div>
						</div>
						<div class="form-group">
							<label for="cardfrom" class="col-sm-2 control-label">卡号范围</label>
							<div class="col-sm-10 form-inline" id="cardList">
								<div id="cankao">
								<input type="text" class="form-control" name="cardStart"/>
									--
								<input type="text" class="form-control" name="cardEnd"/>
								<input type="button" value="添加" class="btn btn-info" onclick="createCard()" />
								</div>
							</div>
						</div>
						<div class="form-group pull-center">
							<label class="col-sm-2 control-label">&nbsp;</label>
							 <button type="button" id="save" class="btn btn-info" onclick="saveBatch()">提交更改 </button>
						</div>
				   </div>
			   </form>
		   </div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
$(document).ready(function(){
	
});
function saveBatch(){
	var reqUrl= '${userPath}admin/card/addBatchByEntityCard';
	jQuery.post(reqUrl, $("#dbform").serializeArray(),function(result){
		if(result.success){
			window.location.reload();
		}else {
			alert(result.msg);
		}
	});
}
function createCard(){
	$('#cardList').append($('#cankao').clone());
}
</script>
</body>
</html>