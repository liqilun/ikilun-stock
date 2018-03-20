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
			<a href="${userPath}admin/main" class="navbar-brand"><b>鲸健身</b></a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li <#if isIndexNav??>class="hactive"</#if>>
					<a href="${userPath}admin/main"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台首页</a>
				</li>
				<li <#if isGymNav??>class="hactive"</#if>>
					<a href="${userPath}admin/gym/list"><span class="glyphicon glyphicon-th"></span>&nbsp;&nbsp;场馆管理</a>
				</li>
				<li <#if isOrderNav??>class="hactive"</#if>>
					<a href="#"><span class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;订单管理</a>
				</li>
				<li <#if isMemberNav??>class="hactive"</#if>>
					<a href="${userPath}admin/member/list"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a>
				</li>
				<li <#if isCardNav??>class="hactive"</#if>>
					<a href="${userPath}admin/card/list"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;卡券管理</a>
				</li>
				<li <#if isReportNav??>class="hactive"</#if>>
					<a href="#"><span class="glyphicon glyphicon-object-align-bottom"></span>&nbsp;&nbsp;报表统计</a>
				</li>
				<li <#if isAuthNav??>class="hactive"</#if>>
					<a href="${userPath}admin/auth/list"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;权限管理</a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="#index1" class="dropdown" data-toggle="dropdown">
						${user.username}
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="#"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;前台首页</a>
						</li>
						<li>
							<a href="${userPath}admin/modPass"><span class="glyphicon glyphicon-cog"></span>&nbsp;修改密码</a>
						</li>
						<li>
							<a href="${userPath}exit"><span class="glyphicon glyphicon-off"></span>&nbsp;退出登录</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!--导航-->