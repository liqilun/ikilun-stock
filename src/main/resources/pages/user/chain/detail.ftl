<div class="modal-dialog">
	<div class="modal-content">
	   <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">连锁店</h4>
	   </div>
		   <form class="form-horizontal" role="form" id="dbform">
			   <div class="modal-body  form-inline">
				   <div class="form-group form-inline">
				      <div class="col-sm-12">
				      		<input type="hidden" id="id" name="id" value="${chain.id!}">
				           	名称：<input type="text" class="form-control" id="name" name="name" value="${chain.name!}">
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
		var reqUrl= '${userPath}admin/chain/save';
		jQuery.post(reqUrl, $("#dbform").serializeArray(),function(result){
			if(result.success){
				window.location.reload();
			}else {
				alert(result.msg);
			}
		});
	}
</script>