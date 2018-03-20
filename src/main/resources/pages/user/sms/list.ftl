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
<link rel="stylesheet" type="text/css" href="${staticPath}css/animate.css" />
<script src="${staticPath}jquery/2.0.3/jquery.min.js"></script>
<script src="${staticPath}bootstrap/js/bootstrap.min.js"></script>
</head>
<body><#assign isMemberNav='Y'/>
<#include "../nav.ftl">
<#include "../subNav.ftl">
<div class="container">
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-10">&nbsp;</div>
			<div class="col-md-12">
				<form action="${userPath}admin/sms/list.xhtml" class="form-inline" role="form">
					<div class="form-group form-inline">
						<div class="pull-left">
							<label class="sr-only" for="mobile">手机号</label>
							<input type="text" name="mobile" class="form-control" value="${mobile!}" placeholder="接受短信手机号"/>
							<input type="submit" class="btn btn-default" value="搜索"/>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>手机号</th>
							<th>内容.</th>
							<th>发送次数</th>
							<th>添加时间</th>
							<th>有效时间</th>
							<th>实发时间</th>
						</tr>
					</thead>
					<tbody>
						<#list smsList as sms> 
						<tr>
							<td>${sms.mobile!}</td>
							<td>${sms.content!}</td>
							<td>${sms.sendnum!}</td>
							<td>${sms.addTime?string('yyyy-MM-dd HH:mm')!}</td>
							<#if sms.validTime??>
							<td>${sms.validTime?string('yyyy-MM-dd HH:mm')!}</td>
							<#else>
							<td>&nbsp;</td>
							</#if>
							<#if sms.realTime??>
							<td>${sms.realTime?string('yyyy-MM-dd HH:mm')!}</td>
							<#else>
							<td>&nbsp;</td>
							</#if>
						</tr>
						</#list>
					</tbody>
				</table>
				<#include "../pageUtil.ftl">
			</div>
		</div>
</div>
<script type="text/javascript">
</script>
</body>
</html>