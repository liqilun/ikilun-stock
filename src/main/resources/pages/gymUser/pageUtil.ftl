<#if (pageUtil??) && (pageUtil.pageCount > 1)>
<ul class="pagination pull-right">
	<#if pageUtil.isPrePage()>
		<#assign pagePreUrl=pageUtil.preurl />
		<#if !pagePreUrl?starts_with('/')>
			<#assign pagePreUrl=userPath + pageUtil.preurl/>
		</#if>
		<li><a href="${userPath}${pagePreUrl}">&laquo;</a></li>
	<#else>
		<li><a href="#" class="disabled">&laquo;</a></li>
	</#if>
	<#assign pageInfoList=pageUtil.pageInfoList />
	<#list pageInfoList as pageInfo> 
		<#assign pageUrl=pageInfo.url/>
		<#if !pageUrl?starts_with('/')>
			<#assign pagePreUrl=userPath + pageInfo.url/>
		</#if>
		<li <#if pageInfo.currentPage>class='active'</#if>><a href="${userPath}${pageUrl}">${pageInfo.pageNo}</a></li>
	</#list>
	
	<#if pageUtil.isNextPage()>
		<#assign pageNextUrl=pageUtil.nexturl />
		<#if !pageNextUrl?starts_with('/')>
			<#assign pageNextUrl=userPath + pageUtil.nexturl />
		</#if>
		<li><a href="${userPath}${pageNextUrl}">&raquo;</a></li>
	<#else>
		<li><a href="#" class="disabled">&raquo;</a></li>
	</#if>
</ul>
</#if>