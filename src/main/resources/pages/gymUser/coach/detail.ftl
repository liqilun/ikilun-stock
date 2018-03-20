<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
		   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		   <h4 class="modal-title" id="myModalLabel">教练</h4>
		</div>
		<form class="form-horizontal" role="form" id="dbform">
			<div class="modal-body">
				<div class="form-group  form-inline">
					<label for="name" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="name" name="name" value="${coach.name!}">
					</div>
				</div>
				
				<div class="form-group form-inline">
					<label for="mobile" class="col-sm-2 control-label">手机号</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="mobile" name="mobile" value="${coach.mobile!}">
					</div>
				</div>
				<div class="form-group form-inline">
					<label for="identityCode" class="col-sm-2 control-label">身份证</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="identityCode" name="identityCode" value="${coach.identityCode!}">
					</div>
				</div>
				<div class="form-group form-inline">
					 <label for="fzrPhone" class="col-sm-2 control-label">上传头像</label>
					<div class="col-sm-6">
						<img <#if coach.headPic??>src="${imagePath}${coach.headPic}?x-oss-process=image/resize,m_lfit,h_100,w_100"</#if> id="headPicImg" >
						<input type="hidden" name="headPic" id="headPic" value="${coach.headPic!}">
						<input id="file" type="file" name="file" multiple class="file-loading"/>
					</div>
				</div>
				<div class="form-group form-inline">
					<label for="identityCode" class="col-sm-2 control-label">教授课程</label>
					<div class="col-sm-10">
						<#list courseList as course> 
							<input type="checkbox" class="form-control" name="courseIds" value="${course.id!}" 
								<#if coachCourseIdList?seq_contains(course.id)>checked="checked"</#if>>${course.name}
						</#list>
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
			$('#headPicImg').attr('src','${imagePath}' + data.response.retval + '?x-oss-process=image/resize,m_lfit,h_100,w_100');
			$('#headPic').val(data.response.retval);
		}else {
			alert(data.response.msg);			
		}
	});
});
	function save(){
		var reqUrl= '${gymUserPath}admin/coach/save';
		jQuery.post(reqUrl, $("#dbform").serializeArray(),function(result){
			if(result.success){
				window.location.reload();
			}else {
				alert('保存失败：'+result.msg);
			}
		});
	}
</script>