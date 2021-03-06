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
<div class="container">
		<div class="tab-pane fade in active">
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<form class="form-horizontal" role="form" id="dbform">
				   	<div class="modal-body">
				   		<div class="form-group">
						   	  <input type="hidden" name="id" id="id" value="${gym.id!}">
						   	  <input type="hidden" name="provincecode" id="provincecode" value="310000">
						   	  <input type="hidden" name="id" id="id" value="${gym.id!}">
						   	   <label for="companyName" class="col-sm-2 control-label">公司名称</label>
						      <div class="col-sm-6">
						      	 <input type="text" class="form-control" name="companyName" value="${gym.companyName!}"  placeholder="公司名称">
						      </div>
						</div>
						<div class="form-group">
						   	  <label for="briefName" class="col-sm-2 control-label">企业简称</label>
						      <div class="col-sm-6">
						      	 <input type="text" class="form-control" name="briefName" value="${gym.briefName!}" >
						      </div>
						</div>
						<div class="form-group form-inline">
						   	  <label for="briefName" class="col-sm-2 control-label">所属区域</label>
						      <div class="col-sm-8">
						      	 <select name="citycode" id="citycode" class="form-control">
						      	 	<option value="310000" selected="selected">上海市</option>
						      	 </select>&nbsp;&nbsp;
						      	 <select name="countycode" id="countycode" class="form-control">
						      	 	<option value="" <#if !gym.countycode??>selected="selected"</#if>>请选择</option>
						      	 	<#list countyList as county>
						      	 		<option value="${county.countycode}" <#if gym.countycode?? && gym.countycode==county.countycode> selected="selected" </#if>>${county.countyname}</option>
						      	 	</#list>
						      	 </select>
						      </div>
						</div>
						<div class="form-group form-inline">
						   	  <label for="fzrName" class="col-sm-2 control-label">负责人名字</label>
						      <div class="col-sm-8">
						      	 <input type="text" class="form-control" name="fzrName" value="${gym.fzrName!}" >
						      	 &nbsp;&nbsp;&nbsp;&nbsp;电话：<input type="text" class="form-control" name="fzrPhone" value="${gym.fzrPhone!}" >
						      </div>
						</div>
						<div class="form-group form-inline">
						   	  <label for="fzrPhone" class="col-sm-2 control-label">开业时间</label>
						      <div class="col-sm-10">
						      	 <input type="text" class="form-control" name="openDate" value="${gym.openDate!}" 
						      	 onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly" style="width: 180px;">
						      	  &nbsp;&nbsp;&nbsp;&nbsp; 营业时间：<input type="text" class="form-control" name="serviceHour1" value="${gym.serviceHour1!}" 
						      	  	onclick="WdatePicker({dateFmt:'HH:mm'})" readonly="readonly" style="width: 80px;">
						      	 --
						      	 <input type="text" class="form-control" name="serviceHour2" value="${gym.serviceHour2!}" 
						      	 	onclick="WdatePicker({dateFmt:'HH:mm'})" readonly="readonly" style="width: 80px;">
						      </div>
						</div>
						<div class="form-group">
						   	  <label for="fzrPhone" class="col-sm-2 control-label">详细地址</label>
						      <div class="col-sm-6">
						      	 <input type="text" class="form-control" name="address" value="${gym.address!}" >
						      </div>
						</div>
						<div class="form-group">
							<label for="remark" class="col-sm-2 control-label">场馆描述</label>
							<div class="col-sm-8">
								<textarea name="remark2" id="remark2" class="form-control" rows="3">${gym.remark!}</textarea>
							</div>
						</div>
						<div class="form-group pull-center">
							<label class="col-sm-2 control-label">&nbsp;</label>
							 <button type="button" id="save" class="btn btn-info" onclick="saveGym()">提交更改 </button>
						</div>
				   </div>
			   </form>
		   </div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
$(document).ready(function(){
	ckeditor = CKEDITOR.replace("remark2",{customConfig : '${staticPath}ckeditor/myConfig.js'});
	//上传附件
	$("#file").fileinput({
		showUpload: false,
		showPreview: false,
		language: 'zh',
		uploadUrl: "${gymUserPath}admin/file/uploadPicture",
		maxFileCount: 6,
		browseClass: "btn btn-primary", //按钮样式 
		showRemove:false, // 是否显示移除按钮  
	    showCaption: false ,//是否显示标题 
	    dropZoneEnabled: false, //是否显示拖拽区域
	    uploadExtraData: {},
	}).on("filebatchselected", function(event) {
		$(this).fileinput("upload");
	}).on('fileuploaded', function(event, data) {
		if(data.response.success){
			$('#logoImg').attr('src','${imagePath}' + data.response.retval + '?x-oss-process=image/resize,m_lfit,h_100,w_100');
			$('#logo').val(data.response.retval);
		}else {
			alert(data.response.msg);			
		}
	});
});
function saveGym(){
	$('#save').attr("disabled",true); 
	var values = $("#dbform").serializeArray();
	values.push({"name":"remark","value":ckeditor.getData()})
	jQuery.post("${gymUserPath}admin/gym/save", values,function(result){
		if(result.success){
			alert('保存成功！');
			window.location.reload();
		}else {
			alert('保存失败：'+result.msg);
			$('#save').attr("disabled",false); 
		}
	});
}
</script>
</body>
</html>