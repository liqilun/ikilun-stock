<table class="table table-bordered">

<tbody>
	<tr><#assign hourList1=['09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30']>
		<td>上午</td>
		<td><#list hourList1 as hour>
			<input type="button" name="hour" value="${hour}" <#if setHourList?seq_contains(hour)>class="btn"<#else>class="btn btn-warning"</#if>>&nbsp;&nbsp;
			</#list>
		</td>
	</tr>
	<tr><#assign hourList2=['13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30']>
		<td>下午</td>
		<td>
			<#list hourList2 as hour2>
			<input type="button" name="hour" value="${hour2}" <#if setHourList?seq_contains(hour2)>class="btn"<#else>class="btn btn-warning"</#if>>&nbsp;&nbsp;
			</#list>
		</td>
	</tr>
	<tr><#assign hourList3=['18:00','18:30','19:00','19:30','20:00','20:30','21:00','21:30','22:00','22:30']>
		<td>晚上</td>
		<td>
			<#list hourList3 as hour3>
			<input type="button" name="hour" value="${hour3}" <#if setHourList?seq_contains(hour3)>class="btn"<#else>class="btn btn-warning"</#if>>&nbsp;&nbsp;
			</#list>
		</td>
	</tr>
	<tr>
		<td>
		</td>
		<td>
			<input type="button" id="save" value="保存" class="btn btn-info" onclick="saveFreeTime()">
		</td>
	</tr>
</tbody>
</table>
<script>
$("input[name='hour']").click(function(){
	var el = $(this);
	if(el.hasClass('btn-warning')){
		el.removeClass('btn-warning');
	}else {
		el.addClass('btn-warning');
	}
});
function saveFreeTime(){
	var hours='';
	$("input[name='hour']").each(function(){
		var el = $(this);
		if(!el.hasClass('btn-warning')){
			hours = hours+','+el.val();
		}
	});
	$('#save').attr("disabled",true); 
	var values = {'dataType':'${dataType}','dateValue':'${dateValue}','hours':hours};
	jQuery.post("${gymUserPath}admin/gym/saveFreeTimeHour", values,function(result){
		if(result.success){
			alert('保存成功！');
		}else {
			alert('保存失败：'+result.msg);
		}
		$('#save').attr("disabled",false); 
	});
}
</script>