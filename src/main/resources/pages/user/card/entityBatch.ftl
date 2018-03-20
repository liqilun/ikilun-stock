<div class="modal-dialog">
	<div class="modal-content">
	   <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">实体卡</h4>
	   </div>
		  <form class="form-horizontal" role="form" id="dbform">
			<div class="modal-body">
				   <div class="form-group form-inline">
						<label for="name" class="col-sm-3 control-label">名称</label>
						<div class="col-sm-8">
							<input type="hidden" id="id" name="id" value="${batch.id!}">
							<input type="text" class="form-control" id="name" name="name" value="${batch.name!}">
						</div>
					</div>
					<div class="form-group form-inline">
						<label for="num" class="col-sm-3 control-label">数量</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="num" name="num" value="${batch.num!}">
						</div>
					</div>
					<div class="form-group form-inline">
						<label for="mobile" class="col-sm-3 control-label">接收手机号</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="mobile" name="mobile" value="${batch.mobile!}">
						</div>
					</div>
				   <div class="form-group form-inline">
				   	   <label for="email" class="col-sm-3 control-label">接收手机号</label>
				       <div class="col-sm-8">
				           <input type="text" class="form-control" id="email" name="email" value="${batch.email!}">
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
		var reqUrl= '${userPath}admin/card/addEntityBatch';
		jQuery.post(reqUrl, $("#dbform").serializeArray(),function(result){
			if(result.success){
				window.location.reload();
			}else {
				alert(result.msg);
			}
		});
	}
</script>