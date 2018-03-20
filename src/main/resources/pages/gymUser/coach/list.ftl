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
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<div class="pull-right">
					<button class="btn btn-xs btn-info" data-toggle="modal" data-target="#myModal" data-id="" name="chain">添加</button>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>头像</th>
							<th>教练名称</th>
							<th>手机号</th>
							<th>身份证</th>
							<th>教授课程</th>
							<th>图片</th>
							<th>标签</th>
							<th>添加时间</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						<#list coachList as coach> 
						<tr>
							<td>${coach.id}</td>
							<td><#if coach.headPic??><img src="${imagePath}${coach.headPic}?x-oss-process=image/resize,m_lfit,h_100,w_100" class="img-thumbnail"></#if></td>
							<td>${coach.name}</td>
							<td>${coach.mobile}</td>
							<td>${coach.identityCode}</td>
							<td>${courseMap[coach.id?c]}</td>
							<td><a href="${gymUserPath}admin/coach/pictureList?coachId=${coach.id}">图片</a></td>
							<td><a href="${gymUserPath}admin/coach/labelList?coachId=${coach.id}">标签</a></td>
							<td>${coach.addTime?string('yyyy-MM-dd HH:mm')}</td>
							<td><button class="btn btn-xs btn-info" data-id="${coach.mobile!}" data-toggle="modal" data-target="#myModal" name="chain">修改</button></td>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
$("button[name=chain]").click(function(){
	$("#myModal").load('${gymUserPath}admin/coach/detail',{"mobile":$(this).attr('data-id')});
});
</script>
</body>
</html>