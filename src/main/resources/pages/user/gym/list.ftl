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
<body><#assign isGymNav='Y'/>
<#include "../nav.ftl">
<#include "../subNav.ftl">
<div class="container">
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-10">&nbsp;</div>
			<div class="col-md-12">
				<form action="${userPath}admin/gym/list.xhtml" class="form-inline" role="form">
					<div class="form-group form-inline">
						<div class="pull-left">
							<label class="sr-only" for="name">名称</label>
							<input type="text" name="name" class="form-control" value="${name!}" placeholder="请输入场馆名称"/>
							<input type="submit" class="btn btn-default" value="搜索"/>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-12">
				<div class="pull-right">
					<a href="${userPath}admin/gym/detail">添加</a>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>logo</th>
							<th>城市-区县</th>
							<th>连锁店</th>
							<th>公司名称</th>
							<th>企业简称</th>
							<th>负责人名字/电话</th>
							<th>营业时间</th>
							<th>服务费率</th>
							<th>交易费率</th>
							<th>合同</th>
							<th>工作室账户</th>
							<th>状态</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						<#list gymList as gym> 
						<tr>
							<td>${gym.id}</td>
							<#if gym.logo??>
							<td><img src="${imagePath}${gym.logo}?x-oss-process=image/resize,m_lfit,h_50,w_50" /></td>
							<#else>
							<td><img src="${staticPath}images/default_gym.png" width="50px;" height="50px;"/></td>
							</#if>
							<td>上海市-${countyMap[gym.countycode].countyname!}</td>
							<td><#if gym.chainId??>${chainMap[gym.chainId?c].name!}</#if></td>
							<td>${gym.companyName!}</td>
							<td>${gym.briefName!}</td>
							<td>${gym.fzrName!}/${gym.fzrPhone!}</td>
							<td>${gym.serviceHour1!}--${gym.serviceHour2!}</td>
							<td>${gym.rate4Sold!}%</td>
							<td>${gym.rate4Order!}%</td>
							<td><a href="${userPath}admin/contract/list?gymId=${gym.id}">合同</a></td>
							<td><a href="${userPath}admin/gymuser/list?gymId=${gym.id}">查看</a></td>
							<td><#if gym.status=='Y'>前台展示<#elseif gym.status=='B'>开放预定<#elseif gym.status=='N'>关闭</#if></td>
							<td><a href="${userPath}admin/gym/detail?id=${gym.id}">修改</a></td>
						</tr>
						</#list>
					</tbody>
				</table>
				<#include "../pageUtil.ftl">
			</div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">

</script>
</body>
</html>