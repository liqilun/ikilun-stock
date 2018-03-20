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
</head>
<body>
<body><#assign isCardNav='Y'/>
<#include "../nav.ftl">
<div class="container">
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>课程</th>
							<th>扣除用户金额/每节</th>
							<th>给教练金额/每节</th>
							<th>闲时扣除用户金额/每节</th>
							<th>闲时给教练金额/每节</th>
							<th>状态</th>
							<th>保存</th>
						</tr>
					</thead>
					<tbody>
						<#list courseList as course>
						<#if gymCourseMap[course.id?c]??>
						<#assign gymCourse=gymCourseMap[course.id?c]/>
						<#else>
						<#assign gymCourse={}/>
						</#if>
						<tr>
							<td>${course.name}</td>
							<td><input type="text" id="reduceMemberAmount${course.id}" <#if gymCourse??>value="${gymCourse.reduceMemberAmount!}"</#if> /></td>
							<td><input type="text" id="addCoachAmount${course.id}" <#if gymCourse??>value="${gymCourse.addCoachAmount!}"</#if> /></td>
							<td><input type="text" id="reduceMemberAmount2${course.id}" <#if gymCourse??>value="${gymCourse.reduceMemberAmount2!}"</#if> /></td>
							<td><input type="text" id="addCoachAmount2${course.id}" <#if gymCourse??>value="${gymCourse.addCoachAmount2!}"</#if> /></td>
							<td>
								<select id="status${course.id}">
									<option value="Y" <#if gymCourse?? && gymCourse.status?? && gymCourse.status=='Y'> selected="selected" </#if>>启用</option>
									<option value="N" <#if gymCourse?? && gymCourse.status?? && gymCourse.status=='N'> selected="selected" </#if>>停用</option>
								</select>
							</td>
							<td><button class="btn btn-xs btn-info" id="btn${course.id}" onclick="saveGymCourse(${course.id})">保存</button></td>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
function saveGymCourse(id){
	$('#btn'+id).attr("disabled",true); 
	var values={'courseId':id,
				'reduceMemberAmount':$('#reduceMemberAmount'+id).val(),
				'addCoachAmount':$('#addCoachAmount'+id).val(),
				'reduceMemberAmount2':$('#reduceMemberAmount2'+id).val(),
				'addCoachAmount2':$('#addCoachAmount2'+id).val(),
				'status':$('#status'+id).val()
			};
	jQuery.post("${gymUserPath}admin/gym/saveGymCourse", values,function(result){
		if(result.success){
			alert('保存成功！');
			window.location.reload();
		}else {
			alert('保存失败：'+result.msg);
			$('#btn'+id).attr("disabled",false); 
		}
	});
}
</script>
</body>
</html>