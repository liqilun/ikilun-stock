<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
		   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		   <h4 class="modal-title" id="myModalLabel">充值卡</h4>
		</div>
			<form class="form-horizontal" role="form" id="dbform">
				<div class="modal-body">
					<div class="form-group form-inline">
						<input type="hidden" name="id" id="id" value="${batch.id!}">
						<input type="hidden" name="cardType" id="cardType" value="charge">
						<input type="hidden" name="monthCardNum" id="monthCardNum" value="0">
					</div>
					<div class="form-group form-inline">
				     	<label for="amount" class="col-sm-2 control-label">面值</label>
				     	<div class="col-sm-8">
							<input type="text" class="form-control" id="amount" name="amount" value="${batch.amount!}" style="width: 120px;" maxlength="6">(用户需要支付的钱)
				        </div>
				    </div>
					<div class="form-group form-inline">
						<label for="giveZhubi" class="col-sm-2 control-label">赠送</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="giveAmount" name="giveAmount" value="${batch.giveAmount!}"  style="width: 120px;" maxlength="4">
						</div>
					</div>
					<div class="form-group form-inline">
					   	  <label for="endTime" class="col-sm-2 control-label">有效日期</label>
					      <div class="col-sm-8">
					      	 <input type="text" class="form-control" name="endTime" <#if batch.endTime??>value="${batch.endTime?string('yyyy-mm-dd')!}" </#if>
					      	 	onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly" style="width: 120px;">
					      </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" id="sbtForm" onclick="save()">保存</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</form>
	</div>
</div>
<script>
	function save(){
		var reqUrl= '${gymUserPath}admin/card/saveBatch';
		jQuery.post(reqUrl, $("#dbform").serializeArray(),function(result){
			if(result.success){
				window.location.reload();
			}else {
				alert(result.msg);
			}
		});
	}
</script>