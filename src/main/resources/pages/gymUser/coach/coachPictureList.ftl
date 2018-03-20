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
</head>
<body>
<body><#assign isCoachNav='Y'/>
<#include "../nav.ftl">
<div class="container">
		<div class="tab-pane fade in active">
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<form class="form-horizontal" role="form" id="dbform">
				   	<div class="modal-body">
				   		<div class="form-group">
					   		<div class="col-sm-12">
					   			<div class="row">
								<#list pictureList as picture>
									 <div class="col-sm-6 col-md-3">
									<table class="table table-bordered">
									<tbody>
									<tr>
										<td>
										<img src="${imagePath}${picture.url}?x-oss-process=image/resize,m_lfit,h_180,w_180" class="img-thumbnail"><br/>
											<input type="button" class="btn btn-sm" onclick="delPicture(${picture.id})" value="删除">
										</td>
									</tr>
									</tbody>
									</table>
									</div>
								</#list>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<br/>
		<div class="form-group form-inline">
			<label for="fzrPhone" class="col-sm-2 control-label">上传教练图片</label>
			<div class="col-sm-8">
				<input id="file" type="file" name="file" multiple class="file-loading"/>
			</div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
$(document).ready(function(){
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
	    uploadExtraData: {'tag':'coach','relatedId':'${coachId}'},
	}).on("filebatchselected", function(event) {
		$(this).fileinput("upload");
	}).on('fileuploaded', function(event, data) {
		if(data.response.success){
			window.location.reload();
		}else {
			alert(data.response.msg);			
		}
	});
});
function delPicture(id){
	if(confirm('确认要删除吗？')==false){
		return false;
	}
	var reqUrl= '${gymUserPath}admin/coach/delPicture';
	var el = $(this);
	jQuery.post(reqUrl, {'id':id},function(result){
		if(result.success){
			window.location.reload();
		}else {
			alert(result.msg);
		}
	});	
}
</script>
</body>
</html>