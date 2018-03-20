<!--导航-->
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
			<a href="${gymUserPath}admin/main" class="navbar-brand"><b>${gym.companyName!}</b></a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li <#if isIndexNav??>class="hactive"</#if>>
					<a href="${gymUserPath}admin/main"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台首页</a>
				</li>
				<li <#if isGymNav??>class="hactive"</#if>>
					<a href="${gymUserPath}admin/gym/detail"><span class="glyphicon glyphicon-th"></span>&nbsp;&nbsp;基本信息</a>
				</li>
				<li <#if isOrderNav??>class="hactive"</#if>>
					<a href="#"><span class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;订单管理</a>
				</li>
				<li <#if isCoachNav??>class="hactive"</#if>>
					<a href="${gymUserPath}admin/coach/list"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;教练管理</a>
				</li>
				<li <#if isCardNav??>class="hactive"</#if>>
					<a href="${gymUserPath}admin/card/batchList"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;产品管理</a>
				</li>
				<li <#if isReportNav??>class="hactive"</#if>>
					<a href="#"><span class="glyphicon glyphicon-object-align-bottom"></span>&nbsp;&nbsp;报表统计</a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="#index1" class="dropdown" data-toggle="dropdown">
						${gymUser.username}
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="#"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;前台首页</a>
						</li>
						<li>
							<a href="${gymUserPath}admin/modPass"><span class="glyphicon glyphicon-cog"></span>&nbsp;修改密码</a>
						</li>
						<li>
							<a href="${gymUserPath}exit"><span class="glyphicon glyphicon-off"></span>&nbsp;退出登录</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!--导航-->