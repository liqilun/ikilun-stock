<div class="modal-dialog">
	<div class="modal-content">
	   <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">合同</h4>
	   </div>
		   <form class="form-horizontal" role="form" id="dbform">
			   <div class="modal-body  form-inline">
				   <div class="form-group">
						<div class="col-sm-10">
								<input type="hidden" id="id" name="id" value="${contract.id!}">
								<input type="hidden" id="rdstr" name="rdstr" value="${contract.rdstr!}">
								<input type="hidden" id="gymId" name="gymId" value="${gymId!}">
								<label for="startDate" class="col-sm-4 control-label">开始</label>
								<div class="col-sm-6">
						      	<input type="text" class="form-control" id="startDate" name="startDate" 
						      	onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly"
						      	<#if contract.startDate??>value="${contract.startDate?string('yyyy-MM-dd')!}" </#if>>
						     	</div>
						</div>
				    </div>
				    <div class="form-group">
						<div class="col-sm-10">
								<label for="endDate" class="col-sm-4 control-label">结束</label>
								<div class="col-sm-6">
						      	<input type="text" class="form-control" id="endDate" name="endDate" 
						      	onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly"
						      	<#if contract.endDate??> value="${contract.endDate?string('yyyy-MM-dd')!}" </#if>>
						     	</div>
						</div>
				    </div><br/>
				    <div class="form-group">
						<div class="col-sm-10">
							<label for="fileLink" class="col-sm-4 control-label">附件</label>
							<div class="col-sm-6">
								<a id="fileLink" <#if contract.fileName??>href="${imagePath}${contract.fileName}"</#if>>查看</a>
								<input type="hidden" name="fileName" id="fileName" value="${contract.fileName!}">
								<input id="file" type="file" name="file" multiple class="file-loading"/>
							</div>
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
<script>
$(document).ready(function(){
	//上传附件
	$("#file").fileinput({
		showUpload: false,
		showPreview: false,
		language: 'zh',
		uploadUrl: "${userPath}admin/file/uploadFile",
		maxFileCount: 6,
		browseClass: "btn btn-primary", //按钮样式 
		showRemove:false, // 是否显示移除按钮  
	    showCaption: false ,//是否显示标题 
	    dropZoneEnabled: false, //是否显示拖拽区域
	    uploadExtraData: {'tag':'contract','relatedId':'${contract.id!}','rdstr':'${contract.rdstr}'},
	}).on("filebatchselected", function(event) {
		$(this).fileinput("upload");
	}).on('fileuploaded', function(event, data) {
		if(data.response.success){
			$('#fileLink').attr('href','${imagePath}' + data.response.retval);
			$('#fileName').val(data.response.retval);
		}else {
			alert(data.response.msg);			
		}
	});
});
	function save(){
		var reqUrl= '${userPath}admin/contract/save';
		jQuery.post(reqUrl, $("#dbform").serializeArray(),function(result){
			if(result.success){
				window.location.reload();
			}else {
				alert(result.msg);
			}
		});
	}
</script>