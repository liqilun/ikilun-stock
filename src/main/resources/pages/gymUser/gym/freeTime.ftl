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
<script src="${staticPath}bootstrap/js/bootstrap.min.js"></script>
<script src="${staticPath}dpicker/WdatePicker.js"></script>
</head>
<body>
<body><#assign isCardNav='Y'/>
<#include "../nav.ftl">
<div class="container">
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12 form-inline">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>常规时间</th>
							<th><input type="button" name="cbt" value="周一" data-type='week' data-value='1' class="btn btn-info"/></th>
							<th><input type="button" name="cbt" value="周二" data-type='week' data-value='2' class="btn btn-info"/></th>
							<th><input type="button" name="cbt" value="周三" data-type='week' data-value='3' class="btn btn-info"/></th>
							<th><input type="button" name="cbt" value="周四" data-type='week' data-value='4' class="btn btn-info"/></th>
							<th><input type="button" name="cbt" value="周五" data-type='week' data-value='5' class="btn btn-info"/></th>
							<th><input type="button" name="cbt" value="周六" data-type='week' data-value='6' class="btn btn-info"/></th>
							<th><input type="button" name="cbt" value="周日" data-type='week' data-value='7' class="btn btn-info"/></th>
						</tr>
						<tr>
							<th>已设特殊时间</th>
							<th colspan="7">
								<#list sdList as sd>
									<input type="button" name="cbt" value="${sd.specialDate?string('MM月dd')}" data-type='date' 
									data-value="${sd.specialDate?string('yyyy-MM-dd')}" class="btn btn-info"/>&nbsp;&nbsp;
								</#list>
							</th>
						</tr>
						<tr>
							<th>添加特殊时间</th>
							<th colspan="7">
								 <input type="text" class="form-control" name="specialDate" id="specialDate"
						      	 onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly" style="width: 180px;">
								<input type="button" class="btn btn-info" value="添加" onclick="setSpecialDate()">
							</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="col-md-12" id="thour">
				
			</div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
$("input[name='cbt']").click(function(){
	clearCls();
	var el = $(this);
	el.removeClass('btn-info');
	el.addClass('btn-danger');
	$("#thour").load('${gymUserPath}admin/gym/freeTimeHour',{'dataType':el.attr('data-type'),'dateValue':el.attr('data-value')});
});
function clearCls(){
	$("input[name='cbt']").each(function(){
		var el = $(this);
		$(this).addClass('btn-info');
		$(this).removeClass('btn-danger');
	});
}
function setSpecialDate(){
	$("#thour").load('${gymUserPath}admin/gym/freeTimeHour',{'dataType':'date','dateValue':$('#specialDate').val()});
}
</script>
</body>
</html>