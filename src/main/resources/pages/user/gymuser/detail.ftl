<div class="modal-dialog">
	<div class="modal-content">
	   <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">场馆登录账户</h4>
	   </div>
		   <form class="form-horizontal" role="form" id="dbform">
			   <div class="modal-body  form-inline">
				   <div class="form-group form-inline">
				      <div class="col-sm-12">
				      		<input type="hidden" id="id" name="id" value="${gymUser.id!}">
				      		<input type="hidden" id="gymId" name="gymId" value="${gymId!}">
				           	登录名：<input type="text" class="form-control" id="username" name="username" value="${gymUser.username!}">（手机号）
				      </div>
				      
				      <div class="col-sm-12">
				           	真实姓名：<input type="text" class="form-control" id="realName" name="realName" value="${gymUser.realName!}">
				      </div>
				       <div class="col-sm-12">
				           	状态：<select name="status" class="form-control" id="status"  >
									<option value="Y" <#if gymUser.status?? && gymUser.status=='Y'>selected="selected"</#if>>开放</option>
									<option value="N" <#if gymUser.status?? && gymUser.status=='N'>selected="selected"</#if>>关闭</option>
								</select>
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
	function save(){
		var reqUrl= '${userPath}admin/gymuser/save';
		jQuery.post(reqUrl, $("#dbform").serializeArray(),function(result){
			if(result.success){
				window.location.reload();
			}else {
				alert(result.msg);
			}
		});
	}
</script>